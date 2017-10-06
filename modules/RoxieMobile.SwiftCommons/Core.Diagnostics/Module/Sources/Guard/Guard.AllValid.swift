// ----------------------------------------------------------------------------
//
//  Guard.AllValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/*
using System;
using RoxieMobile.CSharpCommons.Abstractions.Models;

namespace RoxieMobile.CSharpCommons.Diagnostics
{
    /// <summary>
    /// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
    /// </summary>
    public partial class Guard
    {
// MARK: - Methods

        /// <summary>
        /// Checks that all an objects in array is not `nil` and valid.
        /// </summary>
        /// - objects: An array of objects.
        /// - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
        /// - Throws: GuardException
        public static void AllValid(IValidatable[] objects, string message = null)
        {
            if (TryIsFailure(() => Check.AllValid(objects), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that all an objects in array is not `nil` and valid.
        /// </summary>
        /// - objects: An array of objects.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void AllValid(IValidatable[] objects, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.AllValid(objects), out Exception cause)) {
                throw NewGuardError(block(), cause);
            }
        }
    }
}
*/

extension Guard
{
// MARK: - Methods

//    // TODO
//    @available(*, deprecated)
//    public static func isAllValid(_ objects: [Validatable]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllValid(_ objects: [Validatable?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllValid<T:Validatable>(_ objects: [T]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllValid<T:Validatable>(_ objects: [T?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
//    }

//    /**
//     Checks that all an objects in array is not `nil` and valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allValid(_ objects: [Validatable]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allValid(objects) }
//    }
//
//    /**
//     Checks that all an objects in array is not `nil` and valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allValid(_ objects: [Validatable?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allValid(objects) }
//    }
//
//    /**
//     Checks that all an objects in array is not `nil` and valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allValid<T:Validatable>(_ objects: [T]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allValid(objects) }
//    }
//
//    /**
//     Checks that all an objects in array is not `nil` and valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allValid<T:Validatable>(_ objects: [T?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allValid(objects) }
//    }
}

// ----------------------------------------------------------------------------
