// ----------------------------------------------------------------------------
//
//  Check.Empty.swift
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
        /// Checks that a string is `nil` or empty.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
        /// - Throws: CheckError
        public static void Empty(string value, string message = null)
        {
            if (!value.IsEmpty()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that a string is `nil` or empty.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void Empty(string value, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!value.IsEmpty()) {
                throw NewCheckException(block());
            }
        }

// MARK: - Methods: Array

        /// <summary>
        /// Checks that an array is `nil` or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - array: The array to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
        /// - Throws: CheckError
        public static void Empty<T>(T[] array, string message = null)
        {
            if (!array.IsEmpty()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that an array is `nil` or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - array: The array to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void Empty<T>(T[] array, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!array.IsEmpty()) {
                throw NewCheckException(block());
            }
        }

// MARK: - Methods: Collection

        /// <summary>
        /// Checks that a collection is `nil` or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - collection: The collection to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
        /// - Throws: CheckError
        public static void Empty<T>(ICollection<T> collection, string message = null)
        {
            if (!collection.IsEmpty()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that a collection is `nil` or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - collection: The collection to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void Empty<T>(ICollection<T> collection, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!collection.IsEmpty()) {
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
//    public static func isEmpty(_ value: String?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(value.isEmpty, message, file, line)
//    }

//    // TODO
//    @available(*, deprecated)
//    public static func isEmpty<T>(_ array: [T]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isEmpty(array), message, file, line)
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isEmpty<T>(_ set: Set<T>?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isEmpty(set), message, file, line)
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isEmpty(map), message, file, line)
//    }

//// MARK: - Methods: String
//
//    /**
//     Checks that a string is `nil` or empty.
//
//     - Parameter value: The string to check or `nil`.
//     */
//    public static func empty(_ value: String?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(StringUtils.isEmpty(value), message, file, line)
//    }
//
//// MARK: - Methods: Array
//
//    /**
//     Checks that a array is `nil` or empty.
//
//     - Parameter value: The array to check or `nil`.
//     */
//    public static func empty<T>(_ array: [T]?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isEmpty(array), message, file, line)
//    }
//
//// MARK: - Methods: Set
//    /**
//     Checks that a string is `nil` or empty.
//
//     - Parameter value: The set to check or `nil`.
//     */
//    public static func empty<T>(_ set: Set<T>?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isEmpty(set), message, file, line)
//    }
//
//// MARK: - Methods: Dictionary
//
//    /**
//     Checks that a dictionary is `nil` or empty.
//
//     - Parameter value: The dictionary to check or `nil`.
//     */
//    public static func empty<K, V>(_ map: Dictionary<K, V>?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(CollectionUtils.isEmpty(map), message, file, line)
//    }
}

// ----------------------------------------------------------------------------
