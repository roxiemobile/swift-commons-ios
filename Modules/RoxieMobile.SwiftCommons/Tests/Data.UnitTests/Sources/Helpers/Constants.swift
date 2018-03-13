// ----------------------------------------------------------------------------
//
//  Constants.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

internal final class Constants
{
// MARK: -  Integer Values

    static let maxInt = Int8.max
    static let minInt = Int8.min

    static let maxUInt = UInt8.max
    static let minUInt = UInt8.min

// MARK: -  Not Valid Values

    static let notValidValue = "notValidValue"
    static var dateValue = Date(timeIntervalSinceReferenceDate: -123456789.0)

// MARK: - Enum Values

    static let enumObjectAnother = "Another"
    static let enumObjectDefault = "Default"
}

// ----------------------------------------------------------------------------
