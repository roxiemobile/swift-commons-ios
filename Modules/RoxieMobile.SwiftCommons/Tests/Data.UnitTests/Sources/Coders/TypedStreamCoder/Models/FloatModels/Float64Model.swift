// ----------------------------------------------------------------------------
//
//  Float64Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class Float64Model: ValidatableModel {
// MARK: - Construction

    static let shared = try! Float64Model(from: Constants.float64ModelValue)

// MARK: - Properties

    private(set) var float64: Float64 = 0.0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.float64 <~ map[JsonKeys.float64]
    }
}
