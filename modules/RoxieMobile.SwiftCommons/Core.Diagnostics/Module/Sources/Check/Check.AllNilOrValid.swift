// ----------------------------------------------------------------------------
//
//  Check.AllNilOrValid.swift
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
using System.Linq;
using RoxieMobile.CSharpCommons.Abstractions.Models;
using RoxieMobile.CSharpCommons.Extensions;

namespace RoxieMobile.CSharpCommons.Diagnostics
{
    /// <summary>
    /// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
    /// </summary>
    public partial class Check
    {
// MARK: - Methods

        /// <summary>
        /// Checks that all an objects in array is `nil` or valid.
        /// </summary>
        /// - objects: An array of objects.
        /// - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
        /// - Throws: CheckError
        public static void AllNullOrValid(IValidatable[] objects, string message = null)
        {
            if (!TryAllNullOrValid(objects)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that all an objects in array is `nil` or valid.
        /// </summary>
        /// - objects: An array of objects.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void AllNullOrValid(IValidatable[] objects, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!TryAllNullOrValid(objects)) {
                throw NewCheckException(block());
            }
        }

// MARK: - Private Methods

        private static bool TryAllNullOrValid(IValidatable[] objects) =>
            objects.IsEmpty() || objects.All(s => s.IsNullOrValid());
    }
}
*/

extension Check
{
// MARK: - Methods

//    // TODO
//    @available(*, deprecated)
//    public static func isAllNilOrValid(_ objects: [Validatable]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNilOrValid(_ objects: [Validatable?]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNilOrValid<T:Validatable>(_ objects: [T]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNilOrValid<T:Validatable>(_ objects: [T?]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
//        }
//    }

//    /**
//     Checks that all an objects in array is `nil` or not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNilOrValid(_ objects: [Validatable]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
//        }
//    }
//
//    /**
//     Checks that all an objects in array is `nil` or not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNilOrValid(_ objects: [Validatable?]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
//        }
//    }
//
//    /**
//     Checks that all an objects in array is `nil` or not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNilOrValid<T:Validatable>(_ objects: [T]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
//        }
//    }
//
//    /**
//     Checks that all an objects in array is `nil` or not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNilOrValid<T:Validatable>(_ objects: [T?]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
//        }
//    }
}

// ----------------------------------------------------------------------------
