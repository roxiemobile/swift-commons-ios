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
import SwiftCommons
import SwiftCommonsCoreDataObjC

// ----------------------------------------------------------------------------

/// The abstract base class for data models.
open class ValidatableModel: SerializableObject, Mappable, Hashable, Validatable, PostValidatable, NSCopying
{
// MARK: - Construction

    /// Initializes a new instance of the class from data in a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    /// - Returns:
    ///   `self`, initialized using the data in decoder.
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    /**
     * NOTE: Throws NSException from Objective-C
     */
    @available(*, deprecated, message: "\n• Write a description.")
    public required init?(map: Map) {
        super.init()

        // Deserialize object
        let exception = safeMapping(map) {
            self.mapping(map: $0)
        }

        // Raise exception if mapping was failed
        if let cause = exception {

            if let options = (map.context as? Options), options.raiseExceptionOnFailure {
                cause.raise()
            }
            else {
                return nil
            }
        }
    }

    /// Creates a new instance of the class.
    fileprivate override init() {
        super.init()
    }

// MARK: - Methods: SerializableObject

    @available(*, deprecated, message: "\n• Write a description.")
    open override func encodeObject(with encoder: NSCoder) -> Bool
    {
        // Parent processing
        guard self.frozen && super.encodeObject(with: encoder) else {
            return false
        }

        // Serialize object
        encoder.encode(Mapper().toJSON(self))
        return true
    }

    @available(*, deprecated, message: "\n• Write a description.")
    open override func decodeObject(with decoder: NSCoder) -> Bool
    {
        // Parent processing
        guard !self.frozen && super.decodeObject(with: decoder) else {
            return false
        }

        var result = false
        objcTry {

            // Deserialize object
            if let JSON = decoder.decodeObject() as? JsonObject {

                let map = Map(mappingType: .fromJSON, JSON: JSON, toObject: true).tap {
                    $0.context = Options(raiseExceptionOnFailure: true)
                }

                let exception = self.safeMapping(map) {
                    self.mapping(map: $0)
                }

                // Check result of the deserialization
                result = (exception != nil)
            }

        }.objcCatch { e in
            // Do nothing
        }

        // Done
        return result
    }

// MARK: - Methods: Mappable

    @available(*, deprecated, message: "\n• Write a description.")
    open func mapping(map: Map) {
        // Do nothing
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public final var frozen: Bool {
        return self.freeze
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
            let className = Roxie.typeName(of: self)
            result = false

            // Log validation error
            Logger.w(className, "\(className) is invalid", error)
        }

        // Done
        return result
    }

// MARK: - Methods: PostValidatable

    @available(*, deprecated, message: "\n• Write a description.")
    open var isShouldPostValidate: Bool {
        return true
    }

    /// Checks attribute values or a combination of attribute values for correctness (cross validation).
    @available(*, deprecated, message: "\n• Write a description.")
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

        var clone: AnyObject?
        var cause: NSException?
        objcTry {

            // Deserialize object
            let map = Map(mappingType: .fromJSON, JSON: Mapper().toJSON(self), toObject: true).tap {
                $0.context = Options(raiseExceptionOnFailure: true)
            }
            clone = typeOfT.init(map: map)

        }.objcCatch { e in
            cause = e
        }

        // Check result of the cloning
        if let instance = clone {
            return Roxie.forceCast(instance, to: typeOfT)
        }
        else {
            Roxie.fatalError("Couldn't clone object ‘\(Roxie.typeName(of: self))’.", exception: cause)
        }
    }

// MARK: - Private Methods

    @available(*, deprecated, message: "\n• Write a description.")
    fileprivate func safeMapping(_ map: Map, closure: @escaping (Map) -> Void) -> NSException? {
        let className = Roxie.typeName(of: self)

        var cause: NSException?
        objcTry {

            guard !self.frozen else {
                roxie_objectMapper_raiseException(message: "Can't modify frozen object ‘\(className)’.")
            }

            // Deserialize object
            closure(map)

            // Prevent further modifications
            self.freeze = true

            // Validate converted object
            if self.isShouldPostValidate {
                do {
                    try self.validate()
                }
                catch let error as CheckError {
                    roxie_objectMapper_raiseException(message: error.message ?? "Couldn't validate object ‘\(className)’.", file: error.file, line: error.line)
                }
                catch {
                    roxie_objectMapper_raiseException(message: "Unexpected error is thrown: " + String(describing: error).trim())
                }
            }

        }.objcCatch { e in

            // Append JSON to a thrown exception
            cause = self.exception(from: e, with: map.JSON)
        }

        // Done
        return cause
    }

    @available(*, deprecated, message: "\n• Write a description.")
    private func exception(from exception: NSException, with JSON: JsonObject) -> NSException {

        guard (exception.userInfo?[Inner.InvalidJson] == nil) else {
            return exception
        }

        // Put JSON to a dictionary
        var dict = exception.userInfo ?? [:]
        dict[Inner.InvalidJson] = JSON

        // Create new exception with passed JSON
        return NSException(name: exception.name, reason: exception.reason, userInfo: dict)
    }

// MARK: - Inner Types

    fileprivate struct Options: MapContext {
        let raiseExceptionOnFailure: Bool
    }

// MARK: - Constants

    private struct Inner {
        static let InvalidJson = CommonKeys.Prefix.Extra + "INVALID_JSON"
    }

// MARK: - Variables

    private var freeze = false

    private var hash: Int!
}

// ----------------------------------------------------------------------------
// MARK: - Convenience Initializers
// ----------------------------------------------------------------------------

public extension ValidatableModel
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public convenience init(from JSONString: String) throws {

        // Convert passed string to JSON
        guard let JSON = Mapper<ValidatableModel>.parseJSONStringIntoDictionary(JSONString: JSONString) else {
            throw JsonSyntaxError(message: "Failed to convert string to JSON:\n\(JSONString)")
        }

        // Deserialize object
        try self.init(from: JSON)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public convenience init(from JSON: JsonObject) throws {

        // Deserialize object
        let map = Map(mappingType: .fromJSON, JSON: JSON, toObject: true).tap {
            $0.context = Options(raiseExceptionOnFailure: true)
        }
        try self.init(from: map)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public convenience init(from map: Map) throws {
        self.init()

        // Deserialize object
        let exception = safeMapping(map) {
            self.mapping(map: $0)
        }

        // Throw error if mapping was failed
        if let cause = exception {
            throw JsonSyntaxError(message: cause.reason, params: cause.userInfo?[Inner.InvalidJson] as? JsonObject, cause: exception)
        }
    }
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
