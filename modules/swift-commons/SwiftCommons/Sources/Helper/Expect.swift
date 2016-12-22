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
// MARK: - Methods

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

    public static func isValidArray(array: [Validatable?], file: StaticString = #file, line: UInt = #line)
    {
        if vld_isValid(array) {
            try fail(file, line: line)
        }
    }

    public static func isValid(array: Validatable? ..., file: StaticString = #file, line: UInt = #line) {
        isValidArray(array, file: file, line: line)
    }

    public static func isValidArray(array: [[Validatable]?], file: StaticString = #file, line: UInt = #line)
    {
        if vld_isValid(array) {
            try fail(file, line: line)
        }
    }
    
    public static func isValid(array: [Validatable]? ..., file: StaticString = #file, line: UInt = #line) {
        isValidArray(array, file: file, line: line)
    }

    public static func isValidArray(array: [[Validatable?]?], file: StaticString = #file, line: UInt = #line)
    {
        if vld_isValid(array) {
            fail(file, line: line)
        }
    }

    public static func isValid(array: [Validatable?]? ..., file: StaticString = #file, line: UInt = #line) {
        isValidArray(array, file: file, line: line)
    }

    public static func isNilOrValidArray(array: [Validatable?], file: StaticString = #file, line: UInt = #line)
    {
        if vld_isNilOrValid(array) {
            fail(file, line: line)
        }
    }

    public static func isNilOrValid(array: Validatable? ..., file: StaticString = #file, line: UInt = #line) {
        isNilOrValidArray(array, file: file, line: line)
    }

    public static func isNilOrValidArray(array: [[Validatable]?], file: StaticString = #file, line: UInt = #line)
    {
        if vld_isNilOrValid(array) {
            fail(file, line: line)
        }
    }

    public static func isNilOrValid(array: [Validatable]? ..., file: StaticString = #file, line: UInt = #line) {
        isNilOrValidArray(array, file: file, line: line)
    }

    public static func isNilOrValidArray(array: [[Validatable?]?], file: StaticString = #file, line: UInt = #line)
    {
        if vld_isNilOrValid(array) {
            fail(file, line: line)
        }
    }

    public static func isNilOrValid(array: [Validatable?]? ..., file: StaticString = #file, line: UInt = #line) {
        isNilOrValidArray(array, file: file, line: line)
    }

    public static func isNotEmptyArray(array: [String?], file: StaticString = #file, line: UInt = #line)
    {
        if !str_isNotEmpty(array)  {
            fail(file, line: line)
        }
    }

    public static func isNotEmpty(array: String? ..., file: StaticString = #file, line: UInt = #line) {
        isNotEmptyArray(array, file: file, line: line)
    }

    public static func isNotEmptyArray(array: [[String]?], file: StaticString = #file, line: UInt = #line)
    {
        if !str_isNotEmpty(array)  {
            fail(file, line: line)
        }
    }

    public static func isNotEmpty(array: [String]? ..., file: StaticString = #file, line: UInt = #line) {
        isNotEmptyArray(array, file: file, line: line)
    }

    public static func isNotEmptyArray(array: [[String?]?], file: StaticString = #file, line: UInt = #line)
    {
        if !str_isNotEmpty(array)  {
            fail(file, line: line)
        }
    }

    public static func isNotEmpty(array: [String?]? ..., file: StaticString = #file, line: UInt = #line) {
        isNotEmptyArray(array, file: file, line: line)
    }

    public static func isEmpty(array: [String?]? ..., file: StaticString = #file, line: UInt = #line)
    {
        for (index, obj) in array.enumerate() {
            guard let obj = obj where (obj.isEmpty) else { fail("String[\(index)] cannot be empty", file: file, line: line)
            return }
        }
    }

// MARK: - Private Methods

    private static func equalsRegardingNil<T: Equatable>(expected: T?, actual: T?) -> Bool
    {
        if expected == nil && actual == nil {
            return true
        }
        guard let expected = expected, let actual = actual else { return false }
        return expected == actual
    }

}

// ----------------------------------------------------------------------------
