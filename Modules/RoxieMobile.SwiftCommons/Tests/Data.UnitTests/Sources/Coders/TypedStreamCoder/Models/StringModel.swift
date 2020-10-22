// ----------------------------------------------------------------------------
//
//  StringModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class StringModel: ValidatableModel {
// MARK: - Construction

    static let shared = try! StringModel(from: Constants.stringModelValue)

// MARK: - Properties

    private(set) var string: String = ""

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.string <~ map[JsonKeys.string]
    }
}

// ----------------------------------------------------------------------------
