// ----------------------------------------------------------------------------
//
//  UInt64Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class UInt64Model: ValidatableModel {

// MARK: - Construction

    static let shared = try! UInt64Model(from: Constants.unsignedIntegerValues)

// MARK: - Properties

    private(set) var uint64: UInt64 = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.uint64 <~ map[JsonKeys.uint64]
    }
}
