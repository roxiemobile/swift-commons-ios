// ----------------------------------------------------------------------------
//
//  VehicleModel.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

// @deprecated
internal class VehicleModel: SerializableObject
{
// MARK: - Properties

    internal private(set) var model: String!

    internal private(set) var color: String!

// MARK: - Methods

    internal override func mapping(map: Map) {
        super.mapping(map)

        // (De)serialize to/from json
        self.model <~ map[JsonKeys.Model]
        self.color <~ map[JsonKeys.Color]
    }

    internal override func validate() throws {
        try super.validate()

        // Validate instance
        try Expect.isNilOrWhiteSpace(self.model, self.color)
    }

}

// ----------------------------------------------------------------------------
