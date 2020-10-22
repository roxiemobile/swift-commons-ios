// ----------------------------------------------------------------------------
//
//  UnsignedInteger8Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class UnsignedInteger8Model: ValidatableModel
{
// MARK: - Construction

    static let shared = try! UnsignedInteger8Model(from: Constants.unsignedInteger8ModelValue)

// MARK: - Properties

    private(set) var uint8: UInt8 = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.uint8 <~ map[JsonKeys.uint8]
    }
}

// ----------------------------------------------------------------------------
