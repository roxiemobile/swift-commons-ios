// ----------------------------------------------------------------------------
//
//  ParkingModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsDiagnostics

// ----------------------------------------------------------------------------

class ParkingModel: ValidatableModel
{
// MARK: - Properties

    fileprivate(set) var watcher: String?

    fileprivate(set) var vehicles: [VehicleModel]!

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

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
