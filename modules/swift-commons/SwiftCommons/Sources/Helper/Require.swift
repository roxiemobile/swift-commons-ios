// ----------------------------------------------------------------------------
//
//  Require.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class Require: NonCreatable
{
// MARK: - Private Methods
//
//    private static func rethrowOnSuccess(message: String?, file: StaticString, line: UInt, block: () throws -> ()) rethrows
//    {
//        var cause: NSException?
//        Try {
//            block()
//        }.Catch { e in
//            cause = e
//        }
//
//        if cause != nil {
//            try throwError(message, file, line)
//        }
//    }
//
//    private static func rethrowOnFailure(message: String?, file: StaticString, line: UInt, block: () throws -> ()) rethrows
//    {
//        var cause: NSException?
//        Try {
//            block()
//        }.Catch { e in
//            cause = e
//        }
//
//        if cause == nil {
//            try throwError(message, file, line)
//        }
//    }
//
//    private static func throwError(message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        throw ValidationError(message ?? "", file: file, line: line)
//    }
}

// ----------------------------------------------------------------------------
//
//extension Require
//{
//// MARK: - Methods
//
//    public static func isTrue(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnFailure(message, file: file, line: line) {
//            try Expect.isTrue(condition)
//        }
//    }
//
//    public static func isFalse(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnFailure(message, file: file, line: line) {
//            Require.isFalse(condition)
//        }
//    }
//}
//
//// ----------------------------------------------------------------------------
//
//extension Require
//{
//// MARK: - Methods
//
//    public static func isEqual<T:Equatable>(expected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnFailure(message, file: file, line: line) {
//            Require.isEqual(expected, actual)
//        }
//    }
//
//    public static func isNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnFailure(message, file: file, line: line) {
//            Require.isNotEqual(unexpected, actual)
//        }
//    }
//}
//
//// ----------------------------------------------------------------------------
//
//extension Require
//{
//// MARK: - Methods
//
//    public static func isNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnFailure(message, file: file, line: line) {
//            Require.isNil(object)
//        }
//    }
//
//    public static func isNotNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnFailure(message, file: file, line: line) {
//            Require.isNotNil(object)
//        }
//    }
//}
//
//// ----------------------------------------------------------------------------
//
//extension Require
//{
//// MARK: - Methods
//
//    public static func isNilOrEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isNotEmpty($0)
//            }
//        }
//    }
//
//    public static func isNilOrEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isNotEmpty($0)
//            }
//        }
//    }
//
//    public static func isNilOrEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isNotEmpty($0)
//            }
//        }
//    }
//}
//
//// ----------------------------------------------------------------------------
//
//extension Require
//{
//// MARK: - Methods
//
//    public static func isNilOrWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isNotWhiteSpace($0)
//            }
//        }
//    }
//
//    public static func isNilOrWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isNotWhiteSpace($0)
//            }
//        }
//    }
//
//    public static func isNilOrWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isNotWhiteSpace($0)
//            }
//        }
//    }
//}
//
//// ----------------------------------------------------------------------------
//
//extension Require
//{
//// MARK: - Methods
//
//    public static func isNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isNilOrValid($0)
//            }
//        }
//    }
//
//    public static func isNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isNilOrValid($0)
//            }
//        }
//    }
//
//    public static func isNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isNilOrValid($0)
//            }
//        }
//    }
//}
//
//// ----------------------------------------------------------------------------
//
//extension Require
//{
//// MARK: - Methods
//
//    public static func isNilOrNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isValid($0)
//            }
//        }
//    }
//
//    public static func isNilOrNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isValid($0)
//            }
//        }
//    }
//
//    public static func isNilOrNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
//    {
//        try rethrowOnSuccess(message, file: file, line: line) {
//            array.forEach {
//                Require.isValid($0)
//            }
//        }
//    }
//}
//
//// ----------------------------------------------------------------------------
