// ----------------------------------------------------------------------------
//
//  UInt8Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class UInt8Model: ValidatableModel {

// MARK: - Construction

    static let shared = try! UInt8Model(from: Constants.unsignedIntegerValues)

// MARK: - Properties

    fileprivate(set) var uint8: UInt8 = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.uint8 <~ map[JsonKeys.uint8]
    }
}
