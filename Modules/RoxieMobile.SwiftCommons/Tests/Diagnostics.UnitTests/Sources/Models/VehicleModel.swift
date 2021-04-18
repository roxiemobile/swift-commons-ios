// ----------------------------------------------------------------------------
//
//  VehicleModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsDiagnostics

// ----------------------------------------------------------------------------

class VehicleModel: ValidatableModel {

// MARK: - Properties

    private(set) var model: String!

    private(set) var color: String!

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // @formatter:off
        self.model <~ map["model"]
        self.color <~ map["color"]
        // @formatter:on
    }

    open override func validate() throws {
        try super.validate()

        // Validate instance state
        try Check.allNotBlank([self.model, self.color])
    }
}
