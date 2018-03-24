// ----------------------------------------------------------------------------
//
//  RegexValidator.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsAbstractions

// ----------------------------------------------------------------------------

/// Validates whether a value match or not given regexp pattern.
public class RegexValidator: Validator
{
// MARK: - Construction

    /// Initializes and returns a newly created validator object.
    ///
    /// - Parameters:
    ///   - pattern: The regular expression pattern to compile.
    ///   - options: The regular expression options that are applied to the expression during matching.
    ///
    /// - Returns:
    ///   `nil` if the regular expression pattern is invalid.
    ///
    public init?(pattern: String, options: NSRegularExpression.Options = .caseInsensitive)
    {
        // Init instance
        self.regex = try? NSRegularExpression(pattern: pattern, options: options)

        // Validate instance state
        guard let _ = self.regex, pattern.isNotBlank else {
            return nil
        }
    }

// MARK: - Methods

    /// Validates whether a value match or not regexp pattern.
    ///
    /// - Parameters:
    ///   - value: The value to validate.
    ///
    /// - Returns:
    ///   `true` if value match regexp pattern; otherwise, `false`.
    ///
    public func isValid(_ value: Any?) -> Bool {
        var result = false

        // Validate incoming value
        if let str = (value as? String) {
            let matches = self.regex.matches(in: str, options: [], range: NSMakeRange(0, str.count))
            result = (matches.count > 0)
        }

        // Done
        return result
    }

// MARK: - Variables

    private let regex: NSRegularExpression!
}

// ----------------------------------------------------------------------------
