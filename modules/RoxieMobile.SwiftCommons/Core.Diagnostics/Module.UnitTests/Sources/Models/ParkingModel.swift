// ----------------------------------------------------------------------------
//
//  ParkingModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

class ParkingModel: ValidatableModel
{
// MARK: - Properties

    fileprivate(set) var watcher: String?

    fileprivate(set) var vehicles: [VehicleModel]!

// MARK: - Methods

    open override func mapping(map: Map) {
        super.mapping(map: map)

        // (De)serialize to/from json
        self.watcher  <~ map["watcher"]
        self.vehicles <~ map["vehicles"]
    }

    open override func validate() throws {
        try super.validate()

        // Validate instance state
        try Check.notBlank(self.watcher)
        try Check.notEmpty(self.vehicles)
        try Check.allValid(self.vehicles)
    }
}

// ----------------------------------------------------------------------------
