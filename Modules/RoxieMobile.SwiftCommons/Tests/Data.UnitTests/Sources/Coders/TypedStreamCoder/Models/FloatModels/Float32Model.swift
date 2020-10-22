// ----------------------------------------------------------------------------
//
//  Float32Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class Float32Model: ValidatableModel
{
// MARK: - Construction

    static let shared = try! Float32Model(from: Constants.dictionaryOfFloat32)

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
