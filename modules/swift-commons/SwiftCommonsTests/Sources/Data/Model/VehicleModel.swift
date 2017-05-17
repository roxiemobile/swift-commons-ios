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

open class VehicleModel: ValidatableModel
{
// MARK: - Properties

    open fileprivate(set) var model: String!

    open fileprivate(set) var color: String!

// MARK: - Methods

    open override func mapping(_ map: Map) {
        super.mapping(map)

        // (De)serialize to/from json
        self.model <~ map["model"]
        self.color <~ map["color"]
    }

    open override func validate() throws {
        try super.validate()

        // Validate instance
        try Expect.isAllNotBlank([self.model, self.color])
    }
}

// ----------------------------------------------------------------------------
