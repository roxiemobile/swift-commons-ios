// ----------------------------------------------------------------------------
//
//  Date.Format.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsLang

// ----------------------------------------------------------------------------

private final class DateFormatterProvider
{
// MARK: - Construction

    fileprivate static let shared = DateFormatterProvider()

    private init() {
        // Do nothing
    }

// MARK: - Methods

    fileprivate func formatter(with dateFormat: String?, locale: Locale?, timeZone: TimeZone?) -> DateFormatter {

        let dateFormatValue = dateFormat ?? Inner.DefaultDateFormat
        let localeValue = locale ?? Inner.DefaultLocale
        let timeZoneValue = timeZone ?? Inner.DefaultTimeZone

        let key = (31 &* dateFormatValue.hashValue) &+ localeValue.hashValue &+ timeZoneValue.hashValue
        if let formatter = self.formatters[key] {
            return formatter
        }

        let formatter = DateFormatter()
        self.formatters[key] = formatter

        // Init formatter's object
        formatter.dateFormat = dateFormatValue
        formatter.formatterBehavior = .behavior10_4
        formatter.locale = localeValue
        formatter.timeZone = timeZoneValue

        // Done
        return formatter
    }

// MARK: - Constants

    private struct Inner
    {
        static let DefaultDateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        static let DefaultLocale = Locale.autoupdatingCurrent
        static let DefaultTimeZone = NSTimeZone.system
    }

// MARK: - Variables

    private var formatters: [Int: DateFormatter] = [:]
}

// ----------------------------------------------------------------------------

public extension Date
{
// MARK: - Methods

    /// Returns a string representation of date formatted using the given date format string.
    ///
    /// - Parameters:
    ///   - string: The date format string.
    ///
    func format(with string: String? = nil, locale: Locale? = nil, timeZone: TimeZone? = nil) -> String {
        return DateFormatterProvider.shared.formatter(with: string, locale: locale, timeZone: timeZone).string(from: self)
    }
}

// ----------------------------------------------------------------------------
