// ----------------------------------------------------------------------------
//
//  Expect.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// @new
public final class Expect: NonCreatable
{
// MARK: - Functions

    public static func isTrue(condition: Bool, message: String?, file: StaticString = #file, line: UInt = #line)
    {
        if !(condition) {
            fail(message, file: file, line: line)
        }
    }

    public static func isTrue(condition: Bool, file: StaticString = #file, line: UInt = #line) {
        isTrue(condition, message: nil, file: file, line: line)
    }

    public static func isFalse(condition: Bool, message: String?, file: StaticString = #file, line: UInt = #line) {
        isTrue(!condition, message: message, file: file, line: line)
    }

    public static func isFalse(condition: Bool, file: StaticString = #file, line: UInt = #line) {
        isTrue(!condition, file: file, line: line)
    }

    public static func fail(message: String?, file: StaticString = #file, line: UInt = #line) {
        mdc_fatalError(message ?? "", file: file, line: line)
    }

    public static func fail(file: StaticString = #file, line: UInt = #line) {
        fail(nil, file: file, line: line)
    }

    public static func isEquals<T: Equatable>(expected: T?, actual: T?, message: String?, file: StaticString = #file, line: UInt = #line)
    {
        if !equalsRegardingNil(expected, actual: actual) {
            fail(message, file: file, line: line)
        }
    }

    public static func isNotEquals<T: Equatable>(unexpected: T?, actual: T?, message: String?, file: StaticString = #file, line: UInt = #line)
    {
        if equalsRegardingNil(unexpected, actual: actual) {
            fail(message, file: file, line: line)
        }
    }

    public static func isNotNil(object: AnyObject?, message: String?, file: StaticString = #file, line: UInt = #line) {
        isTrue(object != nil, message: message, file: file, line: line)
    }

    public static func isNil(object: AnyObject?, message: String?, file: StaticString = #file, line: UInt = #line) {
        isTrue(object == nil, message: message, file: file, line: line)
    }

    public static func isValid(array: ParcelableModel? ..., file: StaticString = #file, line: UInt = #line)
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj else { fail("Object[\(index)] cannot be nil", file: file, line: line)
                return }
            do {
                try obj.validate()
            }
            catch {
                // Do nothing ..
            }
        }
    }
    
    public static func isValid(array: [ParcelableModel]? ..., file: StaticString = #file, line: UInt = #line)
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { fail("Object[\(index)] cannot be nil", file: file, line: line)
            return }
            for obj in arr {
                do {
                    try obj.validate()
                }
                catch {
                    // Do nothing ..
                }
            }
        }
    }
    
    public static func isValid(array: [ParcelableModel?]? ..., file: StaticString = #file, line: UInt = #line)
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { fail("Object[\(index)] cannot be nil", file: file, line: line)
            return }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { fail("Object[\(index), \(index2)] cannot be nil", file: file, line: line)
                return }
                do {
                    try obj.validate()
                }
                catch {
                    // Do nothing ..
                }
            }
        }
    }

    public static func isNilOrValid(array: ParcelableModel? ..., file: StaticString = #file, line: UInt = #line)
    {
        for obj in array
        {
            guard let obj = obj else { return }
            do {
                try obj.validate()
            }
            catch {
                // Do nothing ..
            }
        }
    }
    
    public static func isNilOrValid(array: [ParcelableModel]? ..., file: StaticString = #file, line: UInt = #line)
    {
        for arr in array
        {
            guard let arr = arr else { return }
            for obj in arr {
                do {
                    try obj.validate()
                }
                catch {
                    // Do nothing ..
                }
            }
        }
    }
    
    public static func isNilOrValid(array: [ParcelableModel?]? ..., file: StaticString = #file, line: UInt = #line)
    {

        
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { return }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { fail("Object[\(index), \(index2)] cannot be nil", file: file, line: line)
                return }
                do {
                    try obj.validate()
                }
                catch {
                    // Do nothing ..
                }
            }
        }
    }

    public static func isNotEmpty(array: String? ..., file: StaticString = #file, line: UInt = #line)
    {
        for (index, obj) in array.enumerate()
        {
            guard let obj = obj where !(obj.isEmpty) else { fail("String[\(index)] cannot be empty", file: file, line: line)
            return }
        }
    }

    public static func isNotEmpty(array: [String]? ..., file: StaticString = #file, line: UInt = #line)
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { fail("Object[\(index)] cannot be nil", file: file, line: line)
            return }
            for (index2, obj) in arr.enumerate()
            {
                if obj.isEmpty {
                    fail("String[\(index), \(index2)] cannot be empty", file: file, line: line)
                }
            }
        }
    }

    public static func isNotEmpty(array: [String?]? ..., file: StaticString = #file, line: UInt = #line)
    {
        for (index, arr) in array.enumerate()
        {
            guard let arr = arr else { fail("Object[\(index)] cannot be nil", file: file, line: line)
            return }
            for (index2, obj) in arr.enumerate()
            {
                guard let obj = obj else { fail("Object[\(index), \(index2)] cannot be nil", file: file, line: line)
                return }
                if obj.isEmpty {
                    fail("Object[\(index), \(index2)] cannot be empty", file: file, line: line)
                }
            }
        }
    }

    public static func isEmpty(array: [String?]? ..., file: StaticString = #file, line: UInt = #line)
    {
        for (index, obj) in array.enumerate() {
            guard let obj = obj where (obj.isEmpty) else { fail("String[\(index)] cannot be empty", file: file, line: line)
            return }
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
