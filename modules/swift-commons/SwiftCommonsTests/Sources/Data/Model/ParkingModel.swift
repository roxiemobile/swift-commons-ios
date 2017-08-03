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

open class ParkingModel: ValidatableModel
{
// MARK: - Properties

    open fileprivate(set) var watcher: String?

    open fileprivate(set) var vehicles: [VehicleModel]!

// MARK: - Methods

    open override func mapping(_ map: Map) {
        super.mapping(map)

        // (De)serialize to/from json
        self.watcher  <~ map["watcher"]
        self.vehicles <~ map["vehicles"]
    }

    open override func validate() throws {
        try super.validate()

        // Validate instance
        try Expect.isNotBlank(self.watcher)
        try Expect.isNotEmpty(self.vehicles)
        try Expect.isAllValid(self.vehicles)
    }
}

// ----------------------------------------------------------------------------
