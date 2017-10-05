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
        /// Checks that all an objects in array is <c>null</c> or not valid.
        /// </summary>
        /// <param name="objects">An array of objects.</param>
        /// <param name="message">The identifying message for the <see cref="GuardError"/> (<c>null</c> okay).</param>
        /// <exception cref="GuardError" />
        public static void AllNullOrNotValid(IValidatable[] objects, string message = null)
        {
            if (TryIsFailure(() => Check.AllNullOrNotValid(objects), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that all an objects in array is <c>null</c> or not valid.
        /// </summary>
        /// <param name="objects">An array of objects.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="GuardError"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="GuardError" />
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
//    public static func isAllNilOrNotValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNilOrNotValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
//    }
}

// ----------------------------------------------------------------------------
