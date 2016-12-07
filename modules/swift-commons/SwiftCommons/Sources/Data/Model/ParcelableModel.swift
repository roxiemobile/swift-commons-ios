// ----------------------------------------------------------------------------
//
//  ParcelableModel.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class ParcelableModel: Parcelable, Mappable, Hashable,
                              Validatable, ValidatableThrowable
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
            let result = self.tryMapping() {
                Mapper().map(params, toObject: self)
            }

        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            throw JsonSyntaxException(cause: exception)
        }
    }

    public required init?(_ map: Map) {
        super.init()

        // Deserialize object
        let result = tryMapping() {
            self.mapping(map)
        }

        // Validate instance
        if !result { return nil }
    }

// MARK: - Properties

    public var hashValue: Int {
        return self.hash ?? rehash()
    }

// MARK: - Functions

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
            if let json = decoder.decodeObject() as? [String: AnyObject] {
                result = self.tryMapping() {
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
        // Do nothing ..
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

    public func validateThrowable() throws -> Bool
    {
        let result = validate()

        // Log validation error
        if !result
        {
            MDLog.w(String(format: "‘%@’ is invalid.", className(self.dynamicType)))
            throw NSError.modelIsInvalid
        }

        return result
    }

    public func validate() -> Bool
    {
        return true
    }

// MARK: - Private Functions

    private func tryMapping(block: dispatch_block_t) -> Bool
    {
        if frozen() { return false }

        var cause: NSException?
        Try {

            // Deserialize object
            block()

            // Prevent further modifications
            self.freeze = true

        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            exception.raise()
        }

        if !validate() {
            mdc_fatalError("Couldn't validate converted object")
        }

        // Done
        return frozen()
    }

    private func key(value: String) -> String {
        return className(self.dynamicType).mdc_md5String.substringToIndex(6) + "." + value
    }

// MARK: - Variables

    private var freeze = false

    private var hash: Int!

}

// ----------------------------------------------------------------------------
// MARK: - @protocol NSCopying
// ----------------------------------------------------------------------------

extension ParcelableModel: NSCopying
{
// MARK: - Functions

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

public func == (lhs: ParcelableModel, rhs: ParcelableModel) -> Bool
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
// MARK: - Global Functions
// ----------------------------------------------------------------------------

public func plm_isValid(array: ParcelableModel? ...) -> Bool
{
    // Validate objects
    return array.all { obj in (obj != nil) && obj!.validate() }
}

public func plm_isValid(array: [ParcelableModel]? ...) -> Bool
{
    // Validate objects
    return array.all { arr in (arr != nil) && arr!.all { obj in obj.validate() } }
}

public func plm_isValid(array: [ParcelableModel?]? ...) -> Bool
{
    // Validate objects
    return array.all { arr in (arr != nil) && arr!.all { obj in (obj != nil) && obj!.validate() } }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

public func plm_isNilOrValid(array: ParcelableModel? ...) -> Bool
{
    // Validate objects
    return array.all { obj in (obj == nil) || obj!.validate() }
}

public func plm_isNilOrValid(array: [ParcelableModel]? ...) -> Bool
{
    // Validate objects
    return array.all { arr in (arr == nil) || arr!.all { obj in obj.validate() } }
}

public func plm_isNilOrValid(array: [ParcelableModel?]? ...) -> Bool
{
    // Validate objects
    return array.all { arr in
        (arr == nil) || arr!.all { obj in
            guard let obj = obj else {
                return false
            }
            return obj.validate()
        }
    }
}

// ----------------------------------------------------------------------------
