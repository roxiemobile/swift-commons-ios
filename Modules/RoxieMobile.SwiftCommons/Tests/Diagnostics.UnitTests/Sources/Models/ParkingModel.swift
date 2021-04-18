// ----------------------------------------------------------------------------
//
//  ParkingModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsDiagnostics

// ----------------------------------------------------------------------------

class ParkingModel: ValidatableModel {

// MARK: - Properties

    private(set) var watcher: String?

    private(set) var vehicles: [VehicleModel]!

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // @formatter:off
        self.watcher  <~ map["watcher"]
        self.vehicles <~ map["vehicles"]
        // @formatter:on
    }

    open override func validate() throws {
        try super.validate()

        // Validate instance state
        try Check.notBlank(self.watcher)
        try Check.notEmpty(self.vehicles)
        try Check.allValid(self.vehicles)
    }
}
