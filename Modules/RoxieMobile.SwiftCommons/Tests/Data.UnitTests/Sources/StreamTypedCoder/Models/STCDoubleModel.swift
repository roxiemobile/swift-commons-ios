// ----------------------------------------------------------------------------
//
//  STCDoubleModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class STCDoubleModel: ValidatableModel
{
// MARK: - Construction

    static let shared = try! STCDoubleModel(from: Constants.dictionaryForSTCDouble)

// MARK: - Properties

    fileprivate(set) var double: Double = 0.0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.double <~ map[JsonKeys.double]
    }
}

// ----------------------------------------------------------------------------
