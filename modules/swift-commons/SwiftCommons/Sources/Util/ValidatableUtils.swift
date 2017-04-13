// ----------------------------------------------------------------------------
//
//  ValidatableUtils.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public final class ValidatableUtils: NonCreatable
{
// MARK: - Methods

    // TODO
    public static func isValid(_ object: Validatable?) -> Bool {
        return (object != nil) && object!.isValid()
    }

    // TODO
    public static func isAllValid(_ objects: [Validatable]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isValid($0) }
    }

    public static func isAllValid(_ objects: [Validatable?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isValid($0) }
    }

    public static func isAllValid<T:Validatable>(_ objects: [T]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isValid($0) }
    }

    public static func isAllValid<T:Validatable>(_ objects: [T?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isValid($0) }
    }

// MARK: -

    // TODO
    public static func isNotValid(_ object: Validatable?) -> Bool {
        return (object != nil) && !object!.isValid()
    }

    // TODO
    public static func isAllNotValid(_ objects: [Validatable]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNotValid($0) }
    }

    public static func isAllNotValid(_ objects: [Validatable?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNotValid($0) }
    }

    public static func isAllNotValid<T:Validatable>(_ objects: [T]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNotValid($0) }
    }

    public static func isAllNotValid<T:Validatable>(_ objects: [T?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNotValid($0) }
    }

// MARK: -

    // TODO
    public static func isNilOrValid(_ object: Validatable?) -> Bool {
        return (object == nil) || object!.isValid()
    }

    // TODO
    public static func isAllNilOrValid(_ objects: [Validatable]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrValid($0) }
    }

    public static func isAllNilOrValid(_ objects: [Validatable?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrValid($0) }
    }

    public static func isAllNilOrValid<T:Validatable>(_ objects: [T]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrValid($0) }
    }

    public static func isAllNilOrValid<T:Validatable>(_ objects: [T?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrValid($0) }
    }

// MARK: -

    // TODO
    public static func isNilOrNotValid(_ object: Validatable?) -> Bool {
        return (object == nil) || !object!.isValid()
    }

    // TODO
    public static func isAllNilOrNotValid(_ objects: [Validatable]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrNotValid($0) }
    }

    public static func isAllNilOrNotValid(_ objects: [Validatable?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrNotValid($0) }
    }

    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrNotValid($0) }
    }

    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrNotValid($0) }
    }
}

// ----------------------------------------------------------------------------
