// ----------------------------------------------------------------------------
//
//  ValidatableModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import CryptoSwift
import SwiftCommonsAbstractions
import SwiftCommonsConcurrent
import SwiftCommonsDiagnostics
import SwiftCommonsLang
import SwiftCommonsLogging
import SwiftCommonsObjC

// ----------------------------------------------------------------------------

/// The abstract base class for data models.
open class ValidatableModel: SerializableObject, ValidatableMappable, Hashable, Validatable, PostValidatable, NSCopying
{
// MARK: - Construction

    /// Initializes a new instance of the class from data in a given unarchiver.
    ///
    /// - Parameters:
    ///   - coder: An unarchiver object.
    ///
    /// - Returns:
    ///   `self`, initialized using the data in decoder.
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public required init(options: ValidatableOptions) {
        super.init()
    }

// MARK: - Methods: SerializableObject

    /// Encodes the receiver using a given archiver.
    ///
    /// - Parameters:
    ///   - encoder: An archiver object.
    ///
    /// - Returns:
    ///   `true` if encoding succeeded; otherwise, `false`.
    ///
    @discardableResult
    open override func encodeObject(with encoder: NSCoder) -> Bool {

        // Parent processing
        guard self.frozen && super.encodeObject(with: encoder) else {
            return false
        }

        // Serialize object
        encoder.encode(Mapper().toJSON(self))
        return true
    }

    /// Decodes the receiver using a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    /// - Returns:
    ///   `true` if decoding succeeded; otherwise, `false`.
    ///
    @discardableResult
    open override func decodeObject(with decoder: NSCoder) -> Bool {
        var result = false

        // Parent processing
        guard !self.frozen && super.decodeObject(with: decoder) else {
            return result
        }

        // Deserialize JSON to object
        if let JSON = decoder.decodeObject() as? JsonObject {
            objcTry {

                // Map object
                self.mapping(map: Map(mappingType: .fromJSON, JSON: JSON, toObject: true))
                result = true

            }.objcCatch { e in
                // Do nothing
            }
        }

        // Done
        return result
    }

// MARK: - Methods: ValidatableMappable

    @available(*, deprecated, message: "\n• Write a description.")
    public final func mapping(map: Map) {

        // Deserialize JSON to object
        if (map.mappingType == .fromJSON) {

            var exception: NSException?
            objcTry {
                let className = Reflection(of: self).type.fullName

                if self.frozen {
                    roxie_objectMapper_raiseException(message: "Can't modify frozen object ‘\(className)’.")
                }

                // Map object
                self.map(with: map)

                // Prevent further modifications
                self.frozen = true

                // Validate converted object
                if self.isShouldPostValidate {
                    do {
                        try self.validate()
                    }
                    catch let error as CheckError {
                        let logMessage = error.message ?? "\(className) is invalid."
                        roxie_objectMapper_raiseException(message: logMessage, file: error.file, line: error.line)
                    }
                    catch {
                        let logMessage = "Unexpected error is thrown: " + String(describing: error).trim()
                        roxie_objectMapper_raiseException(message: logMessage)
                    }
                }

            }.objcCatch { e in
                exception = e
            }

            // Re-throw catched exception
            if let cause = exception {
                ValidatableHelper.exception(from: cause, with: map.JSON).raise()
            }
        }
        // Serialize object to JSON
        else if (map.mappingType == .toJSON) {

            // Map object
            self.map(with: map)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    open func map(with map: Map) {
        // Do nothing
    }

// MARK: - Methods: Hashable

    @available(*, deprecated, message: "\n• Write a description.")
    open var hashValue: Int {
        return self.hash ?? rehash()
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public final func rehash() -> Int
    {
        // Encode serializable object
        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(self)

        // Writing a good Hashable implementation in Swift
        // @link http://stackoverflow.com/a/24240011

        let className = Reflection(of: self).type.fullName
        self.hash = (31 &* className.hashValue) &+ (data as Data).md5().hashValue
        return self.hash
    }

// MARK: - Methods: Validatable

    @available(*, deprecated, message: "\n• Write a description.")
    open var isValid: Bool {
        var result = true

        do {
            // Check object's state
            try validate()
        }
        catch {
            let className = Reflection(of: self).type.fullName
            result = false

            // Log validation error
            Logger.w(className, "\(className) is invalid.", error)
        }

        // Done
        return result
    }

// MARK: - Methods: PostValidatable

    @available(*, deprecated, message: "\n• Write a description.")
    open var isShouldPostValidate: Bool {
        return true
    }

    /// Checks the current state of the object for correctness.
    open func validate() throws {
        // Do nothing
    }

// MARK: - Methods: NSCopying

    /// Creates a new instance that’s a copy of the receiver.
    ///
    /// - Parameters:
    ///   - zone: This parameter is ignored. Memory zones are no longer used by Objective-C.
    ///
    /// - Returns:
    ///   A newly created copy of instance of the receiver.
    ///
    open func copy(with zone: NSZone? = nil) -> Any {
        return clone()
    }

    /// Returns the object returned by `copy(with:)`.
    ///
    /// - Returns:
    ///   The object returned by the `NSCopying` protocol method `copy(with:)`.
    ///
    open func copy() -> Any {
        return copy(with: nil)
    }

    /// Creates a deep copy of the receiver.
    ///
    /// - Returns:
    ///   A newly created copy of instance of the receiver.
    ///
    public final func clone() -> Self {
        let typeOfT = type(of: self)

        // Defines variable of type of Self?
        var object = Roxie.conditionalCast(self, to: typeOfT)
        object = nil

        var exception: NSException?
        objcTry {

            // Clone object
            object = try? typeOfT.init(from: Mapper().toJSON(self))

        }.objcCatch { e in
            exception = e
        }

        // Check result of the cloning
        if let copy = object {
            return Roxie.forceCast(copy, to: typeOfT)
        }
        else {
            let className = Reflection(of: self).type.fullName
            Roxie.fatalError("Couldn't clone object ‘\(className)’.", cause: exception)
        }
    }

// MARK: - Variables

    private var frozen = false

    private var hash: Int!
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Equatable
// ----------------------------------------------------------------------------

public func == (lhs: ValidatableModel, rhs: ValidatableModel) -> Bool
{
    if (lhs === rhs) {
        return true
    }
    else if (type(of: lhs) !== type(of: rhs)) {
        return false
    }
    else {
        return (lhs.hashValue == rhs.hashValue)
    }
}

// ----------------------------------------------------------------------------
