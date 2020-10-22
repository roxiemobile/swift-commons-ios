// ----------------------------------------------------------------------------
//
//  UnsignedInteger16Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class UnsignedInteger16Model: ValidatableModel {
// MARK: - Construction

    static let shared = try! UnsignedInteger16Model(from: Constants.unsignedInteger16ModelValue)

// MARK: - Properties

    private(set) var uint16: UInt16 = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.uint16 <~ map[JsonKeys.uint16]
    }
}
