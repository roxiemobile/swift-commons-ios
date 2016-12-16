// ----------------------------------------------------------------------------
//
//  Assert.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public final class Assert: NonCreatable
{
// MARK: - Functions

    public static func isTrue(condition: Bool, message: String?, line: UInt? = #line, file: String? = #file) throws
    {
        if !(condition) {
            try fail(message, line: line, file: file)
        }
    }

    public static func isTrue(condition: Bool, line: UInt? = #line, file: String? = #file) throws {
        try isTrue(condition, message: nil, line: line, file: file)
    }

    public static func isFalse(condition: Bool, message: String?, line: UInt? = #line, file: String? = #file) throws {
        try isTrue(!condition, message: message, line: line, file: file)
    }

    public static func isFalse(condition: Bool, line: UInt? = #line, file: String? = #file) throws {
        try isTrue(!condition, line: line, file: file)
    }

    public static func fail(message: String?, line: UInt? = #line, file: String? = #file) throws
    {
        if let message = message {
            throw AssertionError(message: message, line: line, file: file)
        }
        throw AssertionError(message: nil, line: line, file: file)
    }

    public static func fail(line: UInt? = #line, file: String? = #file) throws {
        try fail(nil, line: line, file: file)
    }

    public static func isEquals<T: Equatable>(expected: T?, actual: T?, message: String?, line: UInt? = #line, file: String? = #file) throws
    {
        if !equalsRegardingNil(expected, actual: actual) {
            throw AssertionError(message: message, line: line, file: file)
        }
    }

    public static func isNotEquals<T: Equatable>(unexpected: T?, actual: T?, message: String?, line: UInt? = #line, file: String? = #file) throws
    {
        if equalsRegardingNil(unexpected, actual: actual) {
            throw AssertionError(message: message, line: line, file: file)
        }
    }

    public static func isNotNil(object: AnyObject?, message: String?, line: UInt? = #line, file: String? = #file) throws {
        try isTrue(object != nil, message: message, line: line, file: file)
    }

    public static func isNil(object: AnyObject?, message: String?, line: UInt? = #line, file: String? = #file) throws {
        try isTrue(object == nil, message: message, line: line, file: file)
    }

    public static func isValid(array: ParcelableModel? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj else { throw AssertionError(message: "Object[\(index)] cannot be nil", line: line, file: file) }
            try obj.validate()
        }
    }
    
    public static func isValid(array: [ParcelableModel]? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw AssertionError(message: "Object[\(index)] cannot be nil", line: line, file: file) }
            for obj in arr {
                try obj.validate()
            }
        }
    }
    
    public static func isValid(array: [ParcelableModel?]? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw AssertionError(message: "Object[\(index)] cannot be nil", line: line, file: file) }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { throw AssertionError(message: "Object[\(index), \(index2)] cannot be nil", line: line, file: file) }
                try obj.validate()
            }
        }
    }

    public static func isNilOrValid(array: ParcelableModel? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for obj in array
        {
            guard let obj = obj else { return }
            try obj.validate()
        }
    }
    
    public static func isNilOrValid(array: [ParcelableModel]? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for arr in array
        {
            guard let arr = arr else { return }
            for obj in arr {
                try obj.validate()
            }
        }
    }
    
    public static func isNilOrValid(array: [ParcelableModel?]? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { return }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { throw AssertionError(message: "Object[\(index), \(index2)] cannot be nil", line: line, file: file) }
                try obj.validate()
            }
        }
    }

    public static func isNotEmpty(array: String? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj where !(obj.isEmpty) else { throw AssertionError(message: "String[\(index)] cannot be empty", line: line, file: file) }
        }
    }

    public static func isNotEmpty(array: [String]? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw AssertionError(message: "Object[\(index)] cannot be nil", line: line, file: file) }
            for (index2, obj) in arr.enumerate()
            {
                if obj.isEmpty {
                    throw AssertionError(message: "String[\(index), \(index2)] cannot be empty", line: line, file: file)
                }
            }
        }
    }

    public static func isNotEmpty(array: [String?]? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { throw AssertionError(message: "Object[\(index)] cannot be nil", line: line, file: file) }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { throw AssertionError(message: "Object[\(index), \(index2)] cannot be nil", line: line, file: file) }
                if obj.isEmpty {
                    throw AssertionError(message: "Object[\(index), \(index2)] cannot be empty", line: line, file: file)
                }
            }
        }
    }

    public static func isEmpty(array: [String?]? ..., line: UInt? = #line, file: String? = #file) throws
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj where (obj.isEmpty) else { throw AssertionError(message: "String[\(index)] cannot be empty", line: line, file: file) }
        }
    }

// MARK: - Actions

    // ...

// MARK: - Private Functions

    private static func equalsRegardingNil<T: Equatable>(expected: T?, actual: T?) -> Bool
    {
        if expected == nil && actual == nil {
            return true
        }
        guard let expected = expected, let actual = actual else { return false }
        return expected == actual
    }

// MARK: - Inner Types

    // ...

// MARK: - Constants

    // ...

// MARK: - Variables

    // ...

}

// ----------------------------------------------------------------------------
