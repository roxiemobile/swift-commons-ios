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

// ----------------------------------------------------------------------------

/// The abstract base class for data models.
open class ValidatableModel: SerializableObject, Mappable, Hashable
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

    @available(*, deprecated, message: "\n• Write a description.")
    public required init(params: [String : Any]) throws {
        super.init()

        var cause: NSException?
        objcTry {

            // Deserialize object
            self.unsafeMapping() {
                Mapper<ValidatableModel>().map(JSON: params, toObject: self)
            }

        }.objcCatch { e in

            // Update exception
            cause = self.injectNestedParams(e, params: params)
        }

        if let e = cause {
            throw JsonSyntaxError(message: e.reason, params: e.userInfo?[Inner.NestedParams] as? [String: AnyObject], cause: e)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public required init?(map: Map) {
        super.init()

        var result = false
        objcTry {

            // Deserialize object
            result = self.unsafeMapping() {
                self.mapping(map: map)
            }

        }.objcCatch { e in

            // Rethrow exception
            self.injectNestedParams(e, params: map.JSON).raise()
        }

        // Validate instance
        guard result else {
            return nil
        }
    }

// MARK: - Properties

    @available(*, deprecated, message: "\n• Write a description.")
    open var hashValue: Int {
        return self.hash ?? rehash()
    }

// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    open override func encodeObject(with encoder: NSCoder) -> Bool
    {
        // Parent processing
        let result = super.encodeObject(with: encoder)

        // Encode internal object's state
        if result {
            encoder.encode(Mapper().toJSON(self))
        }

        // Done
        return result
    }

    @available(*, deprecated, message: "\n• Write a description.")
    open override func decodeObject(with decoder: NSCoder) -> Bool
    {
        // Parent processing
        guard !frozen() && super.decodeObject(with: decoder) else {
            return false
        }

        var result = false
        objcTry {

            // Decode internal object's state
            if let json = decoder.decodeObject() as? [String: AnyObject]
            {
                result = self.unsafeMapping() {
                    Mapper<ValidatableModel>().map(JSON: json, toObject: self)
                }
            }

        }.objcCatch { e in
            // Do nothing
        }

        // Done
        return result
    }

    @available(*, deprecated, message: "\n• Write a description.")
    open func mapping(map: Map) {
        // Do nothing
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public final func frozen() -> Bool {
        return self.freeze
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public final func rehash() -> Int
    {
        // Encode serializable object
        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(self)

        // Writing a good Hashable implementation in Swift
        // @link http://stackoverflow.com/a/24240011

        self.hash = (31 &* NSStringFromClass(type(of: self)).hashValue) &+ (data as Data).md5().hashValue
        return self.hash
    }

// MARK: - Private Methods

    /**
     * NOTE: Throws NSException from Objective-C
     */
    @available(*, deprecated, message: "\n• Write a description.")
    @discardableResult
    private func unsafeMapping(block: @escaping () -> Void) -> Bool
    {
        guard !frozen() else {
            return false
        }

        // TODO
        // if (obj is IPostValidatable instance && instance.IsShouldPostValidate()) {
        //     try {
        //         instance.Validate();
        //     }
        //     catch (CheckException e) {
        //         throw new JsonSerializationException(e.Message, e);
        //     }
        // }

        var cause: NSException?
        objcTry {

            // Deserialize object
            block()

            // Validate converted object
            if self.isShouldPostValidate() {
                do {
                    try self.validate()
                }
                catch let error as CheckError {
                    Roxie.fatalError(error.message ?? "Couldn't validate converted object", file: error.file, line: error.line)
                }
                catch {
                    Roxie.fatalError("Unexpected error is thrown", error: error)
                }
            }

            // Prevent further modifications
            self.freeze = true

        }.objcCatch { e in
            cause = e
        }

        if let exception = cause {
            exception.raise()
        }

        // Done
        return frozen()
    }

    @available(*, deprecated, message: "\n• Write a description.")
    private func injectNestedParams(_ e: NSException, params: [String: Any]) -> NSException
    {
        var cause = e
        if e.userInfo?[Inner.NestedParams] == nil {

            // Add params to an exception
            var dict = e.userInfo ?? [:]
            dict[Inner.NestedParams] = params

            // Create new exception with nested params
            cause = NSException(name: e.name, reason: e.reason, userInfo: dict)
        }

        // Done
        return cause
    }

// MARK: - Constants

    private struct Inner {
        static let NestedParams = CommonKeys.Prefix.Extra + "nested_params"
    }

// MARK: - Variables

    private var freeze = false

    private var hash: Int!
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Validatable
// ----------------------------------------------------------------------------

extension ValidatableModel: Validatable
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    open func isValid() -> Bool {
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
}

// ----------------------------------------------------------------------------
// MARK: - @protocol PostValidatable
// ----------------------------------------------------------------------------

extension ValidatableModel: PostValidatable
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    open func isShouldPostValidate() -> Bool {
        return true
    }

    /// Checks attribute values or a combination of attribute values for correctness (cross validation).
    open func validate() throws {
        // Do nothing
    }
}

// ----------------------------------------------------------------------------
// MARK: - @protocol NSCopying
// ----------------------------------------------------------------------------

extension ValidatableModel: NSCopying
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public func copy(with zone: NSZone? = nil) -> Any {
        return self.copy()
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func copy() -> Self {
        return try! type(of: self).init(params: Mapper().toJSON(self))
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
