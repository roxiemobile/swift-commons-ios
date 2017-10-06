// ----------------------------------------------------------------------------
//
//  Check.NotEmpty.swift
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
using System.Collections.Generic;
using RoxieMobile.CSharpCommons.Extensions;

namespace RoxieMobile.CSharpCommons.Diagnostics
{
    /// <summary>
    /// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
    /// </summary>
    public static partial class Check
    {
// MARK: - Methods: String

        /// <summary>
        /// Checks that a string is not `nil` and not empty.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void NotEmpty(string value, string message = null)
        {
            if (!value.IsNotEmpty()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that a string is not `nil` and not empty.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void NotEmpty(string value, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!value.IsNotEmpty()) {
                throw NewCheckException(block());
            }
        }

// MARK: - Methods: Array

        /// <summary>
        /// Checks that an array is not `nil` and not empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - array: The array to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void NotEmpty<T>(T[] array, string message = null)
        {
            if (!array.IsNotEmpty()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that an array is not `nil` and not empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - array: The array to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void NotEmpty<T>(T[] array, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!array.IsNotEmpty()) {
                throw NewCheckException(block());
            }
        }

// MARK: - Methods: Generic Collection

        /// <summary>
        /// Checks that a collection is not `nil` and not empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - collection: The collection to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void NotEmpty<T>(ICollection<T> collection, string message = null)
        {
            if (!collection.IsNotEmpty()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that a collection is not `nil` and not empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - collection: The collection to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void NotEmpty<T>(ICollection<T> collection, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!collection.IsNotEmpty()) {
                throw NewCheckException(block());
            }
        }
    }
}
*/

extension Check
{
// MARK: - Methods

//    // TODO
//    @available(*, deprecated)
//    public static func isNotEmpty(_ value: String?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(value.isNotEmpty, message, file, line)
//    }

//    // TODO
//    @available(*, deprecated)
//    public static func isNotEmpty<T>(_ array: [T]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isNotEmpty(array), message, file, line)
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isNotEmpty<T>(_ set: Set<T>?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isNotEmpty(set), message, file, line)
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isNotEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isNotEmpty(map), message, file, line)
//    }

//// MARK: - Methods: String
//
//    /**
//     Checks that a string is not `nil` and not empty.
//
//     - Parameter value: The string to check or `nil`.
//     */
//    public static func notEmpty(_ value: String?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(StringUtils.isNotEmpty(value), message, file, line)
//    }
//
//// MARK: - Methods: Array
//
//    /**
//     Checks that an array is not `nil` and not empty.
//
//     - Parameter array: The array to check or `nil`.
//     */
//    public static func notEmpty<T>(_ array: [T]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isNotEmpty(array), message, file, line)
//    }
//
//// MARK: - Methods: Set
//
//    /**
//     Checks that a set is not `nil` and not empty.
//
//     - Parameter set: The set to check or `nil`.
//     */
//    public static func notEmpty<T>(_ set: Set<T>?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isNotEmpty(set), message, file, line)
//    }
//
//// MARK: - Methods: Dictionary
//    /**
//     Checks that a dictionary is not `nil` and not empty.
//
//     - Parameter map: The dictionary to check or `nil`.
//     */
//    public static func notEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isNotEmpty(map), message, file, line)
//    }
}

// ----------------------------------------------------------------------------
