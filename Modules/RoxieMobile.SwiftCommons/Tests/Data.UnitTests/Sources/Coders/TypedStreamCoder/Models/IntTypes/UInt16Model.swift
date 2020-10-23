// ----------------------------------------------------------------------------
//
//  UInt16Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class UInt16Model: ValidatableModel {

// MARK: - Construction

    static let shared = try! UInt16Model(from: Constants.unsignedIntegerValues)

// MARK: - Properties

    private(set) var uint16: UInt16 = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.uint16 <~ map[JsonKeys.uint16]
    }
}
