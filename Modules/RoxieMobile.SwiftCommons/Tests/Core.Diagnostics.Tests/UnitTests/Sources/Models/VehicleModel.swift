// ----------------------------------------------------------------------------
//
//  VehicleModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsCoreData
import SwiftCommonsCoreDiagnostics

// ----------------------------------------------------------------------------

class VehicleModel: ValidatableModel
{
// MARK: - Properties

    fileprivate(set) var model: String!

    fileprivate(set) var color: String!

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.model <~ map["model"]
        self.color <~ map["color"]
    }

    open override func validate() throws {
        try super.validate()

        // Validate instance state
        try Check.allNotBlank([self.model, self.color])
    }
}

// ----------------------------------------------------------------------------
