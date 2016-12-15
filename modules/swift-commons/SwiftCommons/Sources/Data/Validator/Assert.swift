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

public final class Assert
{
// MARK: - Functions

    public static func isTrue(condition: Bool, message: String?) throws
    {
        if !(condition) {
            try fail(message)
        }
    }

    public static func isTrue(condition: Bool) throws {
        try isTrue(condition, message: nil)
    }

    public static func isFalse(condition: Bool, message: String?) throws {
        try isTrue(!condition, message: message)
    }

    public static func isFalse(condition: Bool) throws {
        try isTrue(!condition)
    }

    public static func fail(message: String?) throws
    {
        if let message = message {
            throw AssertionError(message: message)
        }
        throw AssertionError(message: nil)
    }

    public static func fail() throws {
        try fail(nil)
    }

    public static func isEquals<T: Equatable>(expected: T?, actual: T?, message: String?) throws
    {
        if !equalsRegardingNil(expected, actual: actual) {
            throw AssertionError(message: message)
        }
    }

    public static func isNotEquals<T: Equatable>(unexpected: T?, actual: T?, message: String?) throws
    {
        if equalsRegardingNil(unexpected, actual: actual) {
            throw AssertionError(message: message)
        }
    }

    public static func isNotNil(object: AnyObject?, message: String?) throws {
        try isTrue(object != nil, message: message)
    }

    public static func isNil(object: AnyObject?, message: String?) throws {
        try isTrue(object == nil, message: message)
    }

    public static func isValid(array: ParcelableModel? ...) throws
    {
        for obj in array
        {
            guard let obj = obj else { throw AssertionError(message: "Object cannot be nil") }
            try obj.validate()
        }
    }
    
    public static func isValid(array: [ParcelableModel]? ...) throws
    {
        for arr in array
        {
            guard let arr = arr else { throw AssertionError(message: "Object cannot be nil") }
            for obj in arr {
                try obj.validate()
            }
        }
    }
    
    public static func isValid(array: [ParcelableModel?]? ...) throws
    {
        for arr in array
        {
            guard let arr = arr else { throw AssertionError(message: "Object cannot be nil") }
            for obj in arr {
                guard let obj = obj else { throw AssertionError(message: "Object cannot be nil") }
                try obj.validate()
            }
        }
    }

    public static func isNilOrValid(array: ParcelableModel? ...) throws
    {
        for obj in array {
            guard let obj = obj else { return }
            try obj.validate()
        }
    }
    
    public static func isNilOrValid(array: [ParcelableModel]? ...) throws
    {
        for arr in array
        {
            guard let arr = arr else { return }
            for obj in arr {
                try obj.validate()
            }
        }
    }
    
    public static func isNilOrValid(array: [ParcelableModel?]? ...) throws
    {
        for arr in array
        {
            guard let arr = arr else { return }
            for obj in arr {
                guard let obj = obj else { throw AssertionError(message: "Object cannot be nil") }
                try obj.validate()
            }
        }
    }

    public static func isNotEmpty(array: String? ...) throws
    {
        for obj in array
        {
            guard let obj = obj where !(obj.isEmpty) else { throw AssertionError(message: "String cannot be empty") }
        }
    }

    public static func isNotEmpty(array: [String]? ...) throws
    {
        for arr in array
        {
            guard let arr = arr else { throw AssertionError(message: "Object cannot be nil") }
            for obj in arr {
                if obj.isEmpty {
                    throw AssertionError(message: "String cannot be empty")
                }
            }
        }
    }

    public static func isNotEmpty(array: [String?]? ...) throws
    {
        for arr in array
        {
            guard let arr = arr else { throw AssertionError(message: "Object cannot be nil") }
            for obj in arr {
                guard let obj = obj where !(obj.isEmpty) else { throw AssertionError(message: "Object cannot be nil") }
            }
        }
    }

    public static func isNotEmptyAtLeastOne(array: [String?]) throws
    {
        var result = false
        for obj in array
        {
            if let obj = obj where !(obj.isEmpty) {
                result = true
                return
            }
        }
        if !result {
            throw AssertionError(message: "Array should have at least one non empty member")
        }
    }

    public static func isEmpty(array: [String]? ...) throws
    {
        for obj in array
        {
            guard let obj = obj where (obj.isEmpty) else { throw AssertionError(message: "String cannot be empty") }
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
