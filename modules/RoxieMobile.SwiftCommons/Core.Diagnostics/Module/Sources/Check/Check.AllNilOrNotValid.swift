// ----------------------------------------------------------------------------
//
//  Check.AllNilOrNotValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

extension Check
{
// MARK: - Methods

    /// Checks that all an objects in collection is `nil` or not valid.
    ///
    /// - Parameters:
    ///   - objects: An collection of an objects.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func allNilOrNotValid<T:Collection>(
            _ objects: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) throws where T.Element == Optional<Validatable> {
        // objects: Collection<Validatable?>?

        if let collection = objects, collection.isNotEmpty {
            guard collection.all({ $0.isNilOrNotValid }) else {
                throw newCheckError(message, file, line)
            }
        }
    }

    /// Checks that all an objects in collection is `nil` or not valid.
    ///
    /// - Parameters:
    ///   - objects: An collection of an objects.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func allNilOrNotValid<T:Collection, V:Validatable>(
            _ objects: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) throws where T.Element == Optional<V> {
        // objects: Collection<Subtype: Validatable?>?

        if let collection = objects, collection.isNotEmpty {
            guard collection.all({ ($0 as Validatable?).isNilOrNotValid }) else {
                throw newCheckError(message, file, line)
            }
        }
    }
}

// ----------------------------------------------------------------------------
