// ----------------------------------------------------------------------------
//
//  DoubleModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class DoubleModel: ValidatableModel {

// MARK: - Construction

    static let shared = try! DoubleModel(from: Constants.doubleValues)

// MARK: - Properties

    private(set) var double: Double = 0.0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.double <~ map[JsonKeys.double]
    }
}
