// ----------------------------------------------------------------------------
//
//  STCMixedModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class STCMixedModel: ValidatableModel
{
// MARK: - Construction

    static let shared = try! STCMixedModel(from: Constants.dictionaryMixed)

// MARK: - Properties

    fileprivate(set) var number: Int = 0

    fileprivate(set) var string: String = ""

    fileprivate(set) var array: [Any] = []

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.number <~ (map[JsonKeys.number])
        self.string <~ (map[JsonKeys.string])
        self.array  <~ (map[JsonKeys.array])
    }
}

// ----------------------------------------------------------------------------
