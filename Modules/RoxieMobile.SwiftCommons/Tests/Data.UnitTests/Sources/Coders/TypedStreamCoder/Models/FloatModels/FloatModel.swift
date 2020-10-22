// ----------------------------------------------------------------------------
//
//  FloatModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class FloatModel: ValidatableModel {
// MARK: - Construction

    static let shared = try! FloatModel(from: Constants.floatModelValue)

// MARK: - Properties

    private(set) var float: Float = 0.0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.float <~ map[JsonKeys.float]
    }
}

// ----------------------------------------------------------------------------
