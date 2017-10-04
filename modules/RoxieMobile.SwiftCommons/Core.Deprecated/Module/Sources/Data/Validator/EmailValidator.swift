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

// Commonly used regular expression patterns
// @link http://grepcode.com/file/repository.grepcode.com/java/ext/com.google.android/android/5.1.1_r1/android/util/Patterns.java#Patterns.0EMAIL_ADDRESS

// ----------------------------------------------------------------------------

@available(*, deprecated)
public final class EmailValidator: NonCreatable, StaticValidator
{
// MARK: - Methods

    @available(*, deprecated)
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

    @available(*, deprecated)
    private struct Inner
    {
        struct Pattern
        {
            /// Regular expression strings for Emails.
            // @formatter:off
            static let EmailAddress = ""
                + "^"
                    + "[a-zA-Z0-9\\.\\_\\%\\-\\+]{1,256}"
                    + "\\@"
                    + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                    + "(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})*"
                + "$"
            // @formatter:on
        }

        /// RegexValidator for matching Emails.
        static let Validator = RegexValidator(Pattern.EmailAddress)
    }
}

// ----------------------------------------------------------------------------
