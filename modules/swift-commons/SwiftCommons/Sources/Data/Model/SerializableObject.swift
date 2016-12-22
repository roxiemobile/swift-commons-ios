// ----------------------------------------------------------------------------
//
//  SerializableObject.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class SerializableObject: Serializable, Mappable, Hashable, Validatable
{
// MARK: - Construction

    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    public required init(params: [String : AnyObject]) throws {
        super.init()

        var cause: NSException?
        Try {

            // Deserialize object
            self.unsafeMapping() {
                Mapper().map(params, toObject: self)
            }

        }.Catch { e in

            // Update exception
            cause = self.injectNestedParams(e, params: params)
        }

        if let e = cause {
            throw JsonSyntaxError(message: e.reason, params: e.userInfo?[Inner.NestedParams] as? [String: AnyObject], cause: e)
        }
    }

    public required init?(_ map: Map) {
        super.init()

        var result = false
        Try {

            // Deserialize object
            result = self.unsafeMapping() {
                self.mapping(map)
            }

        }.Catch { e in

            // Rethrow exception
            self.injectNestedParams(e, params: map.JSONDictionary).raise()
        }

        // Validate instance
        if !result { return nil }
    }

// MARK: - Properties

    public var hashValue: Int {
        return self.hash ?? rehash()
    }

// MARK: - Methods

    public override func encode(coder encoder: NSCoder) -> Bool
    {
        // Parent processing
        let result = super.encode(coder: encoder)

        // Encode internal object's state
        if result {
            encoder.encodeObject(Mapper().toJSON(self))
        }

        // Done
        return result
    }

    public override func decode(coder decoder: NSCoder) -> Bool
    {
        // Parent processing
        if frozen() || !super.decode(coder: decoder) {
            return false
        }

        var result = false
        Try {

            // Decode internal object's state
            if let json = decoder.decodeObject() as? [String: AnyObject]
            {
                result = self.unsafeMapping() {
                    Mapper().map(json, toObject: self)
                }
            }

        }.Catch { e in
            // Do nothing
        }

        // Done
        return result
    }

    public func mapping(map: Map) {
        // Do nothing
    }

    public final func frozen() -> Bool {
        return self.freeze
    }

    public final func rehash() -> Int
    {
        // Encode serializable object
        let data = NSMutableData()
        StreamTypedEncoder(forWritingWithMutableData: data).encodeRootObject(self)

        // Writing a good Hashable implementation in Swift
        // @link http://stackoverflow.com/a/24240011

        self.hash = (31 &* NSStringFromClass(self.dynamicType).hashValue) &+ data.mdc_md5String.hashValue
        return self.hash
    }

    public func isValid() -> Bool
    {
        do {
            try validate()
        }
        catch {
            return false
        }
        return true
    }

    public func validate() throws {
        // Do nothing
    }

// MARK: - Private Methods

    /**
     * NOTE: Throws NSException from Objective-C
     */
    private func unsafeMapping(block: dispatch_block_t) -> Bool
    {
        if frozen() { return false }

        var cause: NSException?
        Try {

            // Deserialize object
            block()

            // Validate converted object
            let defaultMessage = "Couldn't validate converted object"
            do {
                try self.validate()
            }
            catch let error as ExpectationError {
                mdc_fatalError(error.message ?? defaultMessage, file: error.file, line: error.line)
            }
            catch {
                mdc_fatalError(defaultMessage)
            }

            // Prevent further modifications
            self.freeze = true

        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            exception.raise()
        }

        // Done
        return frozen()
    }

    private func injectNestedParams(e: NSException, params: [String: AnyObject]) -> NSException
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
        static let NestedParams = SharedKeys.Prefix.Extra + "nested_params"
    }

// MARK: - Variables

    private var freeze = false

    private var hash: Int!

}

// ----------------------------------------------------------------------------
// MARK: - @protocol NSCopying
// ----------------------------------------------------------------------------

extension SerializableObject: NSCopying
{
// MARK: - Methods

    @objc public func copyWithZone(zone: NSZone) -> AnyObject {
        return self.copy()
    }

    public func copy() -> Self {
        return try! self.dynamicType.init(params: Mapper().toJSON(self))
    }

}

// ----------------------------------------------------------------------------
// MARK: - @protocol Equatable
// ----------------------------------------------------------------------------

public func == (lhs: SerializableObject, rhs: SerializableObject) -> Bool
{
    if (lhs === rhs) {
        return true
    }
    else if (lhs.dynamicType !== rhs.dynamicType) {
        return false
    }
    else {
        return (lhs.hashValue == rhs.hashValue)
    }
}

// ----------------------------------------------------------------------------
