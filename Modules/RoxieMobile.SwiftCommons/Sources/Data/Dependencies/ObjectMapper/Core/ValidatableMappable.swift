// ----------------------------------------------------------------------------
//
//  ValidatableMappable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsConcurrent
import SwiftCommonsLang

// ----------------------------------------------------------------------------

public protocol ValidatableMappable: BaseMappable
{
// MARK: - Construction

    /// This initializer can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point.
    init(options: ValidatableOptions)
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

public struct ValidatableOptions
{
    /// Protected default initializer.
    internal init(map: Map) {
        self.map = map
    }

    /// A property used for holding mapping data.
    internal let map: Map
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

internal class ValidatableHelper: NonCreatable
{
// MARK: - Methods

    /// Convert a JSON String into a Dictionary using NSJSONSerialization
    fileprivate static func parse(JSONString: String) throws -> JsonObject {
        var jsonObject: Any?
        var cause: Error?

        // Convert string to Foundation object
        if let data = JSONString.data(using: String.Encoding.utf8, allowLossyConversion: true) {
            do {
                jsonObject = try JSONSerialization.jsonObject(
                        with: data, options: JSONSerialization.ReadingOptions.allowFragments)
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
            throw JsonSyntaxError(message: logMessage)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    internal static func exception(from exception: NSException, with JSON: JsonObject) -> NSException {

        guard (exception.userInfo?[Inner.InvalidJson] == nil) else {
            return exception
        }

        // Put JSON to a dictionary
        var dict = exception.userInfo ?? [:]
        dict[Inner.InvalidJson] = JSON

        // Create new exception with passed JSON
        return NSException(name: exception.name, reason: exception.reason, userInfo: dict)
    }

    @available(*, deprecated, message: "\n• Write a description.")
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

public extension ValidatableMappable
{
// MARK: - Methods

    /// Initializes object from a JSON String.
    public init(from JSONString: String, with context: MapContext? = nil) throws {
        let JSON = try ValidatableHelper.parse(JSONString: JSONString)
        try self.init(from: JSON, with: context)
    }

    /// Initializes object from a JSON Dictionary.
    public init(from JSON: JsonObject, with context: MapContext? = nil) throws {
        var object: Self?

        var exception: NSException?
        objcTry {
            object = Mapper(context: context).map(JSON: JSON)
        }.objcCatch { e in
            exception = e
        }

        // Throw error if mapping was failed
        if let obj = object {
            self = obj
        }
        else if let cause = exception {
            let JSON = ValidatableHelper.extractJson(from: exception)
            throw JsonSyntaxError(message: cause.reason, JSON: JSON, cause: exception)
        }
        else {
            let typeName = Roxie.typeName(of: Swift.type(of: object))
            throw JsonSyntaxError(message: "Failed to convert JSON to object ‘\(typeName)’.", JSON: JSON)
        }
    }
}

// ----------------------------------------------------------------------------
