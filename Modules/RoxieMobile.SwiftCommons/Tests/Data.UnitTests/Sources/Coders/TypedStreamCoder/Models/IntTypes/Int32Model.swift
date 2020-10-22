// ----------------------------------------------------------------------------
//
//  Int32Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class Int32Model: ValidatableModel {

// MARK: - Construction

    static let shared = try! Int32Model(from: Constants.dictionaryOfSignedInteger32)

// MARK: - Properties

    fileprivate(set) var int32: Int32 = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.int32 <~ map[JsonKeys.int32]
    }
}
