// ----------------------------------------------------------------------------
//
//  Check.AllNotValid.swift
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
    public static partial class Check
    {
// MARK: - Methods

        /// <summary>
        /// Checks that all an objects in array is not `nil` and not valid.
        /// </summary>
        /// - objects: An array of objects.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void AllNotValid(IValidatable[] objects, string message = null)
        {
            if (!TryAllNotValid(objects)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that all an objects in array is not `nil` and not valid.
        /// </summary>
        /// - objects: An array of objects.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void AllNotValid(IValidatable[] objects, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!TryAllNotValid(objects)) {
                throw NewCheckException(block());
            }
        }

// MARK: - Private Methods

        private static bool TryAllNotValid(IValidatable[] objects) =>
            objects.IsEmpty() || objects.All(o => o?.IsNotValid() ?? false);
    }
}
*/

extension Check
{
// MARK: - Methods

//    // TODO
//    @available(*, deprecated)
//    public static func isAllNotValid(_ objects: [Validatable]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNotValid(_ objects: [Validatable?]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNotValid<T:Validatable>(_ objects: [T]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNotValid<T:Validatable>(_ objects: [T?]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }

//    /**
//     Checks that all an objects in array is not `nil` and not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNotValid(_ objects: [Validatable]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
//
//    /**
//     Checks that all an objects in array is not `nil` and not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNotValid(_ objects: [Validatable?]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
//
//    /**
//     Checks that all an objects in array is not `nil` and not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNotValid<T:Validatable>(_ objects: [T]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
//
//    /**
//     Checks that all an objects in array is not `nil` and not valid.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNotValid<T:Validatable>(_ objects: [T?]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
}

// ----------------------------------------------------------------------------
