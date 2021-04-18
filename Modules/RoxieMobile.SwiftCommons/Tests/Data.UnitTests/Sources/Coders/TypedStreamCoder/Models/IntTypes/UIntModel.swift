// ----------------------------------------------------------------------------
//
//  UIntModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class UIntModel: ValidatableModel {

// MARK: - Construction

    static let shared = try! UIntModel(from: Constants.unsignedIntegerValues)

// MARK: - Properties

    private(set) var uint: UInt = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.uint <~ map[JsonKeys.uint]
    }
}
