// ----------------------------------------------------------------------------
//
//  EmailValidator.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/// Validates that a given character sequence (e.g. string) is a well-formed email address.
public final class EmailValidator: NonCreatable, StaticValidator
{
// MARK: - Methods

    /// Validates that a given value is a well-formed email address.
    ///
    /// - Parameters:
    ///   - value: The value to validate.
    ///
    /// - Returns:
    ///   `true` if value is a email address; otherwise, `false`.
    ///
    public class func isValid(_ value: Any?) -> Bool {
        var result = false

        // Validate incoming value
        if let validator = Inner.Validator {
            result = validator.isValid(value)
        }

        // Done
        return result
    }

// MARK: - Constants

    private struct Inner
    {
        // Commonly used regular expression patterns
        // @link http://grepcode.com/file/repository.grepcode.com/java/ext/com.google.android/android/5.1.1_r1/android/util/Patterns.java#Patterns.0EMAIL_ADDRESS

        struct Pattern
        {
            /// Regular expression strings for Emails.
            // @formatter:off
            static let EmailAddress = ""
                + "^"
                    + "[a-zA-Z0-9_\\.\\%\\-\\+]{1,256}"
                    + "\\@"
                    + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                    + "(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})*"
                + "$"
            // @formatter:on
        }

        /// RegexValidator for matching Emails.
        static let Validator = RegexValidator(pattern: Pattern.EmailAddress)
    }
}

// ----------------------------------------------------------------------------
