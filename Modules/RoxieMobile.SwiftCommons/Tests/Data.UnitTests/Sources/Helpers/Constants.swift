// ----------------------------------------------------------------------------
//
//  Constants.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

internal final class Constants
{
// MARK: -  Integer Values

    static let intMax = Int8.max
    static let intMin = Int8.min

    static let uintMax = UInt8.max
    static let uintMin = UInt8.min

// MARK: -  Boolean Values
    static let boolTrue = true
    static let boolFalse: Bool = false

// MARK: -  Other Values

    static let notValidValue = "notValidValue"
    static var dateValue = Date(timeIntervalSinceReferenceDate: -123456789.0)

// MARK: - Enum Values

    static let enumObjectAnother: String = "Another"
    static let enumObjectDefault: String = "Default"
}

// ----------------------------------------------------------------------------
