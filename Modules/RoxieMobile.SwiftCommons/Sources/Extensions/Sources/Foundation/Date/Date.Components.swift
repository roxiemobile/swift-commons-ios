// ----------------------------------------------------------------------------
//
//  Date.Components.swift
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
// MARK: - Properties

    /// Date year.
    var year: Int {
        return get(component: .year, from: Calendar.current)
    }

    /// Date month.
    var month: Int {
        return get(component: .month, from: Calendar.current)
    }

    /// Date weekday.
    var weekday: Int {
        return get(component: .weekday, from: Calendar.current)
    }

    /// Date weekMonth.
    var weekMonth: Int {
        return get(component: .weekOfMonth, from: Calendar.current)
    }

    /// Date days.
    var days: Int {
        return get(component: .day, from: Calendar.current)
    }

    /// Date hours.
    var hours: Int {
        return get(component: .hour, from: Calendar.current)
    }

    /// Date minutes.
    var minutes: Int {
        return get(component: .minute, from: Calendar.current)
    }

    /// Date seconds.
    var seconds: Int {
        return get(component: .second, from: Calendar.current)
    }

// MARK: - Methods

    /// Returns the value of the `Date` component.
    func get(component: Calendar.Component, from calendar: Calendar) -> Int {
        let components = calendar.dateComponents(Set([component]), from: self)
        return components.value(for: component)!
    }
}

// ----------------------------------------------------------------------------
