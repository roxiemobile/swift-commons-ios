// ----------------------------------------------------------------------------
//
//  UInt32Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class UInt32Model: ValidatableModel {

// MARK: - Construction

    static let shared = try! UInt32Model(from: Constants.unsignedIntegerValues)

// MARK: - Properties

    private(set) var uint32: UInt32 = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.uint32 <~ map[JsonKeys.uint32]
    }
}
