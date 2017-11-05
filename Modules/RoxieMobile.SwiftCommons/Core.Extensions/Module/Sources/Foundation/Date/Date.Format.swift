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

// ----------------------------------------------------------------------------

public extension Date
{
// MARK: - Methods

    @available(*, deprecated)
    public func format(_ dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> String {

        struct Singleton
        {
            static let dateFormatter: DateFormatter = {
                let formatter = DateFormatter()

                // Init instance
                formatter.formatterBehavior = .behavior10_4
                formatter.locale = Locale.autoupdatingCurrent
                formatter.timeZone = NSTimeZone.system

                // Done
                return formatter
            }()
        }

        // Init date formatter
        let formatter = Singleton.dateFormatter
        formatter.dateFormat = dateFormat

        // Done
        return formatter.string(from: self)
    }
}

// ----------------------------------------------------------------------------
