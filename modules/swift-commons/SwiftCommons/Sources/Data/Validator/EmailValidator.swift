// ----------------------------------------------------------------------------
//
//  EmailValidator.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// Commonly used regular expression patterns
// @link http://grepcode.com/file/repository.grepcode.com/java/ext/com.google.android/android/5.0.2_r1/android/util/Patterns.java

// ----------------------------------------------------------------------------

public final class EmailValidator: NonCreatable, StaticValidator
{
// MARK: - Methods

    public class func isValid(value: AnyObject?) -> Bool
    {
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
        struct Pattern
        {
            static let EmailAddress = ""
                + "^"
                    + "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}"
                    + "\\@"
                    + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                    + "(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+"
                + "$"
        }

        static let Validator = RegexValidator(Pattern.EmailAddress)
    }

}

// ----------------------------------------------------------------------------
