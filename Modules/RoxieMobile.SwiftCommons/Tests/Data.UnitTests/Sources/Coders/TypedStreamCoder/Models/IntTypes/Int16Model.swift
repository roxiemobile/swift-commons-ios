// ----------------------------------------------------------------------------
//
//  Int16Model.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class Int16Model: ValidatableModel {

// MARK: - Construction

    static let shared = try! Int16Model(from: Constants.integerValues)

// MARK: - Properties

    fileprivate(set) var int16: Int16 = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.int16 <~ map[JsonKeys.int16]
    }
}
