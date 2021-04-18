// ----------------------------------------------------------------------------
//
//  SerializableMappable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsConcurrent
import SwiftCommonsLang

// ----------------------------------------------------------------------------

public protocol SerializableMappable: BaseMappable {

// MARK: - Construction

    /// Initializes an object from data in a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    init?(coder decoder: NSCoder)
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

internal class ValidatableHelper: NonCreatable {

// MARK: - Methods

    /// Converts a JSON string into a dictionary using `NSJSONSerialization`.
    fileprivate static func parse(JSONString: String) throws -> JsonObject {
        var jsonObject: Any?
        var cause: Error?

        // Convert string to Foundation object
        if let data = JSONString.data(using: String.Encoding.utf8, allowLossyConversion: true) {
            do {
                jsonObject = try JSONSerialization
                    .jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            }
            catch let e {
                cause = e
            }
        }

        // Cast Foundation object to a Dictionary
        if let JSON = jsonObject as? JsonObject {
            return JSON
        }
        else {
            var logMessage = "Failed to convert string to JSON:\n\(JSONString)"

            if let err = cause {
                logMessage += "\n\nCaused by error: " + String(describing: err).trim()
            }
            throw JsonSyntaxError(reason: logMessage)
        }
    }

    /// Creates new exception with specified JSON if existing did not contain it.
    internal static func exception(from exception: NSException, with JSON: JsonObject) -> NSException {

        if let _ = exception.userInfo?[Inner.InvalidJson] {
            return exception
        }

        // Put JSON to a dictionary
        var dict = exception.userInfo ?? [:]
        dict[Inner.InvalidJson] = JSON

        // Create new exception with specified JSON
        return NSException(name: exception.name, reason: exception.reason, userInfo: dict)
    }

    /// Extracts JSON from `userInfo` of specified exception.
    internal static func extractJson(from exception: NSException?) -> JsonObject? {
        return exception?.userInfo?[Inner.InvalidJson] as? JsonObject
    }

// MARK: - Constants

    private struct Inner {
        static let InvalidJson = CommonKeys.Prefix.Extra + "INVALID_JSON"
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

public extension SerializableMappable {

// MARK: - Methods

    /// Initializes object from a JSON string.
    init(from JSONString: String, with context: MapContext? = nil) throws {
        let JSON = try ValidatableHelper.parse(JSONString: JSONString)
        try self.init(from: JSON, with: context)
    }

    /// Initializes object from a JSON dictionary.
    init(from JSON: JsonObject, with context: MapContext? = nil) throws {
        var object: Self?

        var exception: NSException?
        objcTry {
            object = Mapper(context: context).map(JSON: JSON)
        }.objcCatch { ex in
            exception = ex
        }

        // Throw error if mapping was failed
        if let obj = object {
            self = obj
        }
        else if let cause = exception {
            let JSON = ValidatableHelper.extractJson(from: exception)
            throw JsonSyntaxError(reason: cause.reason, JSON: JSON, cause: exception)
        }
        else {
            let typeName = Roxie.typeName(of: Swift.type(of: object))
            throw JsonSyntaxError(reason: "Failed to convert JSON to object ‘\(typeName)’.", JSON: JSON)
        }
    }
}
