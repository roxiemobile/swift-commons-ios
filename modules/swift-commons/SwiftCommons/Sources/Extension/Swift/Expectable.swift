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

public protocol Expectable {

    // Do nothing
    
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Functions

    public static func throwIfTrue(condition: Bool, message: String, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Except.isFalse(message, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            throw ExceptionError(message: message, file: file, line: line)
        }
    }

    public static func throwIfTrue(condition: Bool, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Except.isFalse(nil, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            throw ExceptionError(message: message, file: file, line: line)
        }
    }

    public static func throwIfFalse(condition: Bool, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Except.isTrue(condition, message: message, file: file, line: line)
        }.Catch { e in
                cause = e
        }

        if let exception = cause {
            throw ExceptionError(message: message, file: file, line: line)
        }
    }

    public static func throwIfFalse(condition: Bool, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Except.isTrue(condition, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            throw ExceptionError(message: nil, file: file, line: line)
        }
    }

//    public static func fail(message: String?, file: StaticString = #file, line: UInt = #line) throws
//    {
//        if let message = message {
//            throw ExceptionError(message: message, file: file, line: line)
//        }
//        throw ExceptionError(message: nil, file: file, line: line)
//    }
//
//    public static func fail(file: StaticString = #file, line: UInt = #line) throws {
//        try fail(nil, file: file, line: line)
//    }

    public static func throwIfEquals<T: Equatable>(expected: T?, actual: T?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Except.isNotEquals(expected, actual: actual, message: message, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            throw ExceptionError(message: nil, file: file, line: line)
        }
    }

    public static func throwIfNotEquals<T: Equatable>(unexpected: T?, actual: T?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Except.isEquals(unexpected, actual: actual, message: message, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            throw ExceptionError(message: nil, file: file, line: line)
        }
    }

    public static func throwIfNotNil(object: AnyObject?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Except.isNil(object, message: message, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            throw ExceptionError(message: nil, file: file, line: line)
        }
    }

    public static func throwIfNil(object: AnyObject?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        var cause: NSException?
        Try {
            Except.isNotNil(object, message: message, file: file, line: line)
        }.Catch { e in
            cause = e
        }

        if let exception = cause {
            throw ExceptionError(message: nil, file: file, line: line)
        }
    }

    public static func isValid(array: ParcelableModel? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj else { throw ExceptionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            try obj.validate()
        }
    }

    public static func isValid(array: [ParcelableModel]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw ExceptionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            for obj in arr {
                try obj.validate()
            }
        }
    }

    public static func isValid(array: [ParcelableModel?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw ExceptionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { throw ExceptionError(message: "Object[\(index), \(index2)] cannot be nil", file: file, line: line) }
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
                guard let obj = obj else { throw ExceptionError(message: "Object[\(index), \(index2)] cannot be nil", file: file, line: line) }
                try obj.validate()
            }
        }
    }

    public static func isNotEmpty(array: String? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj where !(obj.isEmpty) else { throw ExceptionError(message: "String[\(index)] cannot be empty", file: file, line: line) }
        }
    }

    public static func isNotEmpty(array: [String]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw ExceptionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            for (index2, obj) in arr.enumerate()
            {
                if obj.isEmpty {
                    throw ExceptionError(message: "String[\(index), \(index2)] cannot be empty", file: file, line: line)
                }
            }
        }
    }

    public static func isNotEmpty(array: [String?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw ExceptionError(message: "Object[\(index)] cannot be nil", file: file, line: line) }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { throw ExceptionError(message: "Object[\(index), \(index2)] cannot be nil", file: file, line: line) }
                if obj.isEmpty {
                    throw ExceptionError(message: "Object[\(index), \(index2)] cannot be empty", file: file, line: line)
                }
            }
        }
    }

    public static func isEmpty(array: [String?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj where (obj.isEmpty) else { throw ExceptionError(message: "String[\(index)] cannot be empty", file: file, line: line) }
        }
    }
}

// ----------------------------------------------------------------------------
