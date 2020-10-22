// ----------------------------------------------------------------------------
//
//  SignedIntegerModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class SignedIntegerModel: ValidatableModel
{
// MARK: - Construction

    static let shared = try! SignedIntegerModel(from: Constants.dictionaryOfSignedInteger)

// MARK: - Properties

    fileprivate(set) var int: Int = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.int <~ map[JsonKeys.int]
    }
}

// ----------------------------------------------------------------------------
