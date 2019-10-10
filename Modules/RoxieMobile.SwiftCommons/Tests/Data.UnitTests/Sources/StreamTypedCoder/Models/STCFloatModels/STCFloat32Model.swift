// ----------------------------------------------------------------------------
//
//  STCFloat32Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class STCFloat32Model: ValidatableModel
{
// MARK: - Construction

    static let shared = try! STCFloat32Model(from: Constants.dictionaryOfSTCFloat32)

// MARK: - Properties

    fileprivate(set) var float32: Float32 = 0.0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.float32 <~ map[JsonKeys.float32]
    }
}

// ----------------------------------------------------------------------------
