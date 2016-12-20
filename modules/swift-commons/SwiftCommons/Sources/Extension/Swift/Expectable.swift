// ----------------------------------------------------------------------------
//
//  Expectable.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// @new
public protocol Expectable {
    // Do nothing
}

// ----------------------------------------------------------------------------

// @new
extension Expectable
{
// MARK: - Methods

    public static func throwIfTrue(condition: Bool, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
//        var cause: NSException?
//        Try {
//            Expect.isFalse(condition, message: message, file: file, line: line)
//        }.Catch { e in
//            cause = e
//        }
//
//        if cause != nil {
//            throw ExpectionError(message: message, file: file, line: line)
//        }

        try func2(message, file: file, line: line) {
            Expect.isFalse(condition, message: message, file: file, line: line)
        }
    }

    private static func func2(message: String?, file: StaticString, line: UInt, block: () -> ()) throws
    {
        var cause: NSException?
        Try {
//            Expect.isFalse(condition, message: message, file: file, line: line)
            block()
        }.Catch { e in
            cause = e
        }

        if cause != nil {
            throw ExpectionError(message: message, file: file, line: line)
        }
    }

    public static func throwIfTrue(condition: Bool, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Expect.isFalse(condition, message: nil, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if cause != nil {
            throw ExpectionError(message: nil, file: file, line: line)
        }
    }

    public static func throwIfFalse(condition: Bool, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Expect.isTrue(condition, message: message, file: file, line: line)
        }.Catch { e in
                cause = e
        }

        if cause != nil {
            throw ExpectionError(message: message, file: file, line: line)
        }
    }

    public static func throwIfFalse(condition: Bool, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Expect.isTrue(condition, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if cause != nil {
            throw ExpectionError(message: nil, file: file, line: line)
        }
    }

//    public static func fail(message: String?, file: StaticString = #file, line: UInt = #line) throws
//    {
//        if let message = message {
//            throw ExpectionError(message: message, file: file, line: line)
//        }
//        throw ExpectionError(message: nil, file: file, line: line)
//    }
//
//    public static func fail(file: StaticString = #file, line: UInt = #line) throws {
//        try fail(nil, file: file, line: line)
//    }

    public static func throwIfEquals<T: Equatable>(expected: T?, actual: T?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Expect.isNotEquals(expected, actual: actual, message: message, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if cause != nil {
            throw ExpectionError(message: nil, file: file, line: line)
        }
    }

    public static func throwIfNotEquals<T: Equatable>(unexpected: T?, actual: T?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Expect.isEquals(unexpected, actual: actual, message: message, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if cause != nil {
            throw ExpectionError(message: nil, file: file, line: line)
        }
    }

    public static func throwIfNotNil(object: AnyObject?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Expect.isNil(object, message: message, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if cause != nil {
            throw ExpectionError(message: nil, file: file, line: line)
        }
    }

    public static func throwIfNil(object: AnyObject?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Expect.isNotNil(object, message: message, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if cause != nil {
            throw ExpectionError(message: nil, file: file, line: line)
        }
    }

    public static func isValid(array: ParcelableModel? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj else { throw ExpectionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            try obj.validate()
        }
    }

    public static func isValid(array: [ParcelableModel]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw ExpectionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            for obj in arr {
                try obj.validate()
            }
        }
    }

    public static func isValid(array: [ParcelableModel?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw ExpectionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { throw ExpectionError(message: "Object[\(index), \(index2)] cannot be nil", file: file, line: line) }
                try obj.validate()
            }
        }
    }

    public static func isNilOrValid(array: ParcelableModel? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for obj in array
        {
            guard let obj = obj else { return }
            try obj.validate()
        }
    }

    public static func isNilOrValid(array: [ParcelableModel]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for arr in array
        {
            guard let arr = arr else { return }
            for obj in arr {
                try obj.validate()
            }
        }
    }

    public static func isNilOrValid(array: [ParcelableModel?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { return }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { throw ExpectionError(message: "Object[\(index), \(index2)] cannot be nil", file: file, line: line) }
                try obj.validate()
            }
        }
    }

    public static func isNotEmpty(array: String? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj where !(obj.isEmpty) else { throw ExpectionError(message: "String[\(index)] cannot be empty", file: file, line: line) }
        }
    }

    public static func isNotEmpty(array: [String]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw ExpectionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            for (index2, obj) in arr.enumerate()
            {
                if obj.isEmpty {
                    throw ExpectionError(message: "String[\(index), \(index2)] cannot be empty", file: file, line: line)
                }
            }
        }
    }

    public static func isNotEmpty(array: [String?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw ExpectionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { throw ExpectionError(message: "Object[\(index), \(index2)] cannot be nil", file: file, line: line) }
                if obj.isEmpty {
                    throw ExpectionError(message: "Object[\(index), \(index2)] cannot be empty", file: file, line: line)
                }
            }
        }
    }

    public static func isEmpty(array: [String?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj where (obj.isEmpty) else { throw ExpectionError(message: "String[\(index)] cannot be empty", file: file, line: line) }
        }
    }
}

// ----------------------------------------------------------------------------
