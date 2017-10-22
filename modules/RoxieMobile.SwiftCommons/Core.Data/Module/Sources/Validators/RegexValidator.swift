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
import SwiftCommons

// ----------------------------------------------------------------------------

/// Validates whether a value match or not given regexp pattern.
public class RegexValidator: Validator
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public init?(pattern: String, options: NSRegularExpression.Options = .caseInsensitive)
    {
        // Init instance variables
        self.regex = try? NSRegularExpression(pattern: pattern, options: options)

        // Validate instance
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
