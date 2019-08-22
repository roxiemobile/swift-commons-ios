// ----------------------------------------------------------------------------
//
//  STCUnsignedIntegerModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class STCUnsignedIntegerModel: ValidatableModel
{
// MARK: - Construction

    static let shared = try! STCUnsignedIntegerModel(from: Constants.dictionaryOfSTCUnsignedInteger)

// MARK: - Properties

    fileprivate(set) var uint: UInt = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.uint <~ map[JsonKeys.uint]
    }
}

// ----------------------------------------------------------------------------
