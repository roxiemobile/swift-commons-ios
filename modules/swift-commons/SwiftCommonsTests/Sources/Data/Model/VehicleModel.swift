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

public class VehicleModel: SerializableObject, Expectable
{
// MARK: - Properties

    public private(set) var model: String!

    public private(set) var color: String!

// MARK: - Methods

    public override func mapping(map: Map) {
        super.mapping(map)

        // (De)serialize to/from json
        self.model <~ map[JsonKeys.Model]
        self.color <~ map[JsonKeys.Color]
    }

    public override func validate() throws {
        try super.validate()

        // Validate instance
        try throwIfNilOrWhiteSpace(self.model, self.color)
    }

}

// ----------------------------------------------------------------------------
