// ----------------------------------------------------------------------------
//
//  Guard.AllNilOrNotValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/*using System;
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
        /// Checks that all an objects in array is `nil` or not valid.
        /// </summary>
        /// - objects: An array of objects.
        /// - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
        /// - Throws: GuardException
        public static void AllNullOrNotValid(IValidatable[] objects, string message = null)
        {
            if (TryIsFailure(() => Check.AllNullOrNotValid(objects), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that all an objects in array is `nil` or not valid.
        /// </summary>
        /// - objects: An array of objects.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void AllNullOrNotValid(IValidatable[] objects, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.AllNullOrNotValid(objects), out Exception cause)) {
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
//    public static func isAllNilOrNotValid(_ objects: [Validatable]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNilOrNotValid(_ objects: [Validatable?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
//    }

//    /**
//     Checks that all an objects in array is `nil` or not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNilOrNotValid(_ objects: [Validatable]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allNilOrNotValid(objects) }
//    }
//
//    /**
//     Checks that all an objects in array is `nil` or not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNilOrNotValid(_ objects: [Validatable?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allNilOrNotValid(objects) }
//    }
//
//    /**
//     Checks that all an objects in array is `nil` or not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNilOrNotValid<T:Validatable>(_ objects: [T]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allNilOrNotValid(objects) }
//    }
//
//    /**
//     Checks that all an objects in array is `nil` or not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNilOrNotValid<T:Validatable>(_ objects: [T?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allNilOrNotValid(objects) }
//    }
}

// ----------------------------------------------------------------------------
