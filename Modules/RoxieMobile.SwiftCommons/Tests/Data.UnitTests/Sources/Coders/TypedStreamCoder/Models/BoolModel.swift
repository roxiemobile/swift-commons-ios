// ----------------------------------------------------------------------------
//
//  BoolModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class BoolModel: ValidatableModel
{
// MARK: - Construction

    static let shared = try! BoolModel(from: Constants.booleanModelValue)

// MARK: - Properties

    private(set) var bool: Bool = true

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.bool <~ map[JsonKeys.bool]
    }
}

// ----------------------------------------------------------------------------
