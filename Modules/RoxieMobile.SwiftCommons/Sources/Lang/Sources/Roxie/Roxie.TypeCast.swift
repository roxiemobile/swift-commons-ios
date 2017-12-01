// ----------------------------------------------------------------------------
//
//  Roxie.TypeCast.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension Roxie
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public static func type<T>(of object: AnyObject?, is _: T.Type) -> Bool {
        return (object is T)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func forceCast<T>(_ object: AnyObject?, to type: T.Type) -> T {
        return (object as! T)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func conditionalCast<T>(_ object: AnyObject?, to type: T.Type) -> T? {
        return (object as? T)
    }
}

// ----------------------------------------------------------------------------
