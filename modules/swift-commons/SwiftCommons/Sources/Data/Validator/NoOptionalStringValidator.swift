// ----------------------------------------------------------------------------
//
//  NoOptionalStringValidator.swift
//
//  @author     Vasily Ivanov <IvanovVF@ekassir.com>
//  @copyright  Copyright (c) 2015, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// @deprecated
public final class NoOptionalStringValidator: NonCreatable, StaticValidator
{
// MARK: - Methods

    public class func isValid(value: AnyObject?) -> Bool
    {
        guard let validator = Inner.Validator else {
            MDLog.e("Inner.Validator isn't initialized correctly in \(#function)")
            return false
        }

        guard let string = value as? String else {
            MDLog.e("Input type is not a string: \(value), \(value.dynamicType)")
            return false
        }

        return !validator.isValid(string)
    }

// MARK: - Constants

    private struct Inner
    {
        struct Pattern {
            static let OptionalString = ".*Optional\\(.+\\).*"
        }

        static let Validator = RegexValidator(Pattern.OptionalString, options: NSRegularExpressionOptions())
    }

}

// ----------------------------------------------------------------------------
