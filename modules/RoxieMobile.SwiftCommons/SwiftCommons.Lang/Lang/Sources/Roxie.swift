// ----------------------------------------------------------------------------
//
//  Roxie.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public final class Roxie: NonCreatable
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public static func demangledTypeName(_ object: Any) -> String {
        return String(describing: type(of: object))
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func typeName(_ object: Any) -> String {
        return demangledTypeName(object).components(separatedBy: ".").last!
    }

    @available(*, deprecated, message: "\n• Code refactoring is required;\n• Write a description.")
    public static func fullTypeName<T : Any>(_ obj: T) -> String {
        return String(reflecting: T.self)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func briefTypeName<T : Any>(_ obj: T) -> String {
        var typeName = fullTypeName(obj)

        let typePrefix = "Swift."
        if typeName.hasPrefix(typePrefix) {
            typeName = typeName.substringFrom(index: typePrefix.characters.count)
        }

        let typeSuffix = ".Type"
        if typeName.hasSuffix(typeSuffix) {
            typeName = typeName.substringUpto(index: typeName.characters.count - typeSuffix.characters.count)
        }

        return typeName
    }

    @available(*, deprecated, message: "\n• Code refactoring is required;\n• Write a description.")
    public static func className(_ clazz: AnyClass) -> String {
        return NSStringFromClass(clazz).components(separatedBy: ".").last!
    }

// MARK: - Methods

    // How can I create instances of managed object subclasses in a NSManagedObject extension?
    // @link http://stackoverflow.com/q/27109268

    @available(*, deprecated, message: "\n• Write a description.")
    public static func typeCheck<T>(object: AnyObject?, type: T.Type) -> Bool {
        return (object is T)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func typeCast<T>(object: AnyObject, type: T.Type) -> T {
        return (object as! T)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func optionalTypeCast<T>(object: AnyObject?, type: T.Type) -> T? {
        return (object as? T)
    }
}

// ----------------------------------------------------------------------------
