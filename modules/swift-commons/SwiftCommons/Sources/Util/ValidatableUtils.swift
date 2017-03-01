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
    public static func isValid(object: Validatable?) -> Bool {
        return (object != nil) && object!.isValid()
    }

    // TODO
    public static func isAllValid(objects: [Validatable]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isValid($0) }
    }

    public static func isAllValid(objects: [Validatable?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isValid($0) }
    }

    public static func isAllValid<T:Validatable>(objects: [T]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isValid($0) }
    }

    public static func isAllValid<T:Validatable>(objects: [T?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isValid($0) }
    }

// MARK: -

    // TODO
    public static func isNotValid(object: Validatable?) -> Bool {
        return (object != nil) && !object!.isValid()
    }

    // TODO
    public static func isAllNotValid(objects: [Validatable]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNotValid($0) }
    }

    public static func isAllNotValid(objects: [Validatable?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNotValid($0) }
    }

    public static func isAllNotValid<T:Validatable>(objects: [T]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNotValid($0) }
    }

    public static func isAllNotValid<T:Validatable>(objects: [T?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNotValid($0) }
    }

// MARK: -

    // TODO
    public static func isNilOrValid(object: Validatable?) -> Bool {
        return (object == nil) || object!.isValid()
    }

    // TODO
    public static func isAllNilOrValid(objects: [Validatable]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrValid($0) }
    }

    public static func isAllNilOrValid(objects: [Validatable?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrValid($0) }
    }

    public static func isAllNilOrValid<T:Validatable>(objects: [T]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrValid($0) }
    }

    public static func isAllNilOrValid<T:Validatable>(objects: [T?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrValid($0) }
    }

// MARK: -

    // TODO
    public static func isNilOrNotValid(object: Validatable?) -> Bool {
        return (object == nil) || !object!.isValid()
    }

    // TODO
    public static func isAllNilOrNotValid(objects: [Validatable]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrNotValid($0) }
    }

    public static func isAllNilOrNotValid(objects: [Validatable?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrNotValid($0) }
    }

    public static func isAllNilOrNotValid<T:Validatable>(objects: [T]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrNotValid($0) }
    }

    public static func isAllNilOrNotValid<T:Validatable>(objects: [T?]?) -> Bool {
        return CollectionUtils.isNotEmpty(objects) && objects!.all { isNilOrNotValid($0) }
    }
}

// ----------------------------------------------------------------------------
