// ----------------------------------------------------------------------------
//
//  Check.AllEmpty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/*
/// <summary>
/// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
/// </summary>
public static partial class Check
{
// MARK: - Methods

    /// <summary>
    /// Checks that all a string objects in array is <c>null</c> or empty.
    /// </summary>
    /// <param name="values">An array of string objects.</param>
    /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay).</param>
    /// <exception cref="CheckException" />
    public static void AllEmpty(string[] values, string message = null)
    {
        if (!TryAllEmpty(values)) {
            throw NewCheckException(message);
        }
    }

    /// <summary>
    /// Checks that all a string objects in array is <c>null</c> or empty.
    /// </summary>
    /// <param name="values">An array of string objects.</param>
    /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/>.</param>
    /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
    /// <exception cref="CheckException" />
    public static void AllEmpty(string[] values, Func<string> block)
    {
        if (block == null) {
            throw new ArgumentNullException(nameof(block));
        }

        if (!TryAllEmpty(values)) {
            throw NewCheckException(block());
        }
    }

// MARK: - Private Methods

    private static bool TryAllEmpty(string[] values) =>
        values.IsEmpty() || values.All(s => s.IsEmpty());
}
*/

extension Check
{
// MARK: - Methods

//    // TODO
//    @available(*, deprecated)
//    public static func isAllEmpty(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(values) {
//            try isTrue(StringUtils.isAllEmpty(values), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllEmpty(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(values) {
//            try isTrue(StringUtils.isAllEmpty(values), message, file, line)
//        }
//    }
}

// ----------------------------------------------------------------------------
