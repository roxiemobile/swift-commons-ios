// ----------------------------------------------------------------------------
//
//  Roxie.TypeCast.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension Roxie {
// MARK: - Methods

    /// Checks whether an instance is of a certain type.
    public static func type<T, U>(of object: T?, is type: U.Type) -> Bool {
        return (object is U)
    }

    /// Force downcast of an object to a specified type.
    public static func forceCast<T, U>(_ object: T?, to type: U.Type) -> U {
        guard let result = object as? U else { Roxie.fatalError("Unable to cast \(String(describing: object)) to type \(type)") }
        return result
    }

    /// Conditional downcast of an object to a specified type.
    public static func conditionalCast<T, U>(_ object: T?, to type: U.Type) -> U? {
        return (object == nil) ? nil : (object as? U)
    }
}

// ----------------------------------------------------------------------------
