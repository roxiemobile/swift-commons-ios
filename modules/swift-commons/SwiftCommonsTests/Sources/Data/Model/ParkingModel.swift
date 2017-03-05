// ----------------------------------------------------------------------------
//
//  ParkingModel.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

public class ParkingModel: ValidatableModel
{
// MARK: - Properties

    public private(set) var watcher: String?

    public private(set) var vehicles: [VehicleModel]!

// MARK: - Methods

    public override func mapping(map: Map) {
        super.mapping(map)

        // (De)serialize to/from json
        self.watcher  <~ map["watcher"]
        self.vehicles <~ map["vehicles"]
    }

    public override func validate() throws {
        try super.validate()

        // Validate instance
        try Expect.isNotBlank(self.watcher)
        try Expect.isNotEmpty(self.vehicles)
        try Expect.isAllValid(self.vehicles)
    }
}

// ----------------------------------------------------------------------------
