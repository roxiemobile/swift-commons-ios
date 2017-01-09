// ----------------------------------------------------------------------------
//
//  ParkingModelWithOptionalVehicles.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

// @deprecated
internal class ParkingModelWithOptionalVehicles: SerializableObject, Inspectable
{
// MARK: - Properties

    internal private(set) var watcher: String?

    internal private(set) var vehicles: [VehicleModel]?

// MARK: - Methods

    internal override func mapping(map: Map) {
        super.mapping(map)

        // (De)serialize to/from json
        self.watcher  <~ map[JsonKeys.Watcher]
        self.vehicles <~ map[JsonKeys.Vehicles]
    }

    internal override func validate() throws {
        try super.validate()

        // Validate instance
        if self.watcher != nil {
            try throwIfNilOrWhiteSpace(self.watcher)
        }
    }

}

// ----------------------------------------------------------------------------
