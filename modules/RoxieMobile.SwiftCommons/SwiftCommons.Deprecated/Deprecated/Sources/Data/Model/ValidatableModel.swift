// ----------------------------------------------------------------------------
//
//  ValidatableModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

@available(*, deprecated)
open class ValidatableModel: Serializable, Mappable, Hashable, Validatable
{
// MARK: - Construction

    @available(*, deprecated)
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    @available(*, deprecated)
    public required init(params: [String : Any]) throws {
        super.init()

        var cause: NSException?
        objcTry {

            // Deserialize object
            self.unsafeMapping() {
                let _ = Mapper<ValidatableModel>().map(JSON: params, toObject: self)
            }

        }.objcCatch { e in

            // Update exception
            cause = self.injectNestedParams(e, params: params)
        }

        if let e = cause {
            throw JsonSyntaxError(message: e.reason, params: e.userInfo?[Inner.NestedParams] as? [String: AnyObject], cause: e)
        }
    }

    @available(*, deprecated)
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
        if !result { return nil }
    }

// MARK: - Properties

    @available(*, deprecated)
    open var hashValue: Int {
        return self.hash ?? rehash()
    }

// MARK: - Methods

    @available(*, deprecated)
    public override func encode(coder encoder: NSCoder) -> Bool
    {
        // Parent processing
        let result = super.encode(coder: encoder)

        // Encode internal object's state
        if result {
            encoder.encode(Mapper().toJSON(self))
        }

        // Done
        return result
    }

    @available(*, deprecated)
    public override func decode(coder decoder: NSCoder) -> Bool
    {
        // Parent processing
        if frozen() || !super.decode(coder: decoder) {
            return false
        }

        var result = false
        objcTry {

            // Decode internal object's state
            if let json = decoder.decodeObject() as? [String: AnyObject]
            {
                result = self.unsafeMapping() {
                    let _ = Mapper<ValidatableModel>().map(JSON: json, toObject: self)
                }
            }

        }.objcCatch { e in
            // Do nothing
        }

        // Done
        return result
    }

    @available(*, deprecated)
    open func mapping(map: Map) {
        // Do nothing
    }

    @available(*, deprecated)
    public final func frozen() -> Bool {
        return self.freeze
    }

    @available(*, deprecated)
    public final func rehash() -> Int
    {
        // Encode serializable object
        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(self)

        // Writing a good Hashable implementation in Swift
        // @link http://stackoverflow.com/a/24240011

        self.hash = (31 &* NSStringFromClass(type(of: self)).hashValue) &+ (data as Data).rxm_md5String.hashValue
        return self.hash
    }

    /**
     * TODO
     */
    @available(*, deprecated)
    open func isValid() -> Bool {
        var result = true

        do {
            // Check object's state
            try validate()
        }
        catch {
            let className = typeName(self)
            result = false

            // Log validation error
            Logger.w(className, "\(className) is invalid", error)
        }

        // Done
        return result
    }

    /**
     * Checks attribute values or a combination of attribute values for correctness (cross validation).
     */
    @available(*, deprecated)
    open func validate() throws {
        // Do nothing
    }

// MARK: - Private Methods

    /**
     * NOTE: Throws NSException from Objective-C
     */
    @available(*, deprecated)
    @discardableResult private func unsafeMapping(block: @escaping () -> Void) -> Bool
    {
        if frozen() { return false }

        var cause: NSException?
        objcTry {

            // Deserialize object
            block()

            // Validate converted object
            let defaultMessage = "Couldn't validate converted object"
            do {
                try self.validate()
            }
            catch let error as ExpectationError {
                roxie_fatalError(message: error.message ?? defaultMessage, file: error.file, line: error.line)
            }
            catch {
                roxie_fatalError(message: defaultMessage)
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

    @available(*, deprecated)
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

    @available(*, deprecated)
    private struct Inner {
        static let NestedParams = CommonKeys.Prefix.Extra + "nested_params"
    }

// MARK: - Variables

    private var freeze = false

    private var hash: Int!
}

// ----------------------------------------------------------------------------
// MARK: - @protocol NSCopying
// ----------------------------------------------------------------------------

@available(*, deprecated)
extension ValidatableModel: NSCopying
{
// MARK: - Methods

    @available(*, deprecated)
    public func copy(with zone: NSZone? = nil) -> Any {
        return self.copy()
    }

    @available(*, deprecated)
    public func copy() -> Self {
        return try! type(of: self).init(params: Mapper().toJSON(self))
    }
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Equatable
// ----------------------------------------------------------------------------

@available(*, deprecated)
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
