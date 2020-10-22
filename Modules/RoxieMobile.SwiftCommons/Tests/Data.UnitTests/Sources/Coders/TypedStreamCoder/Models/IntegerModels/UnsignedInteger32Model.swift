// ----------------------------------------------------------------------------
//
//  UnsignedInteger32Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class UnsignedInteger32Model: ValidatableModel {
// MARK: - Construction

    static let shared = try! UnsignedInteger32Model(from: Constants.unsignedInteger32ModelValue)

// MARK: - Properties

    private(set) var uint32: UInt32 = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.uint32 <~ map[JsonKeys.uint32]
    }
}
