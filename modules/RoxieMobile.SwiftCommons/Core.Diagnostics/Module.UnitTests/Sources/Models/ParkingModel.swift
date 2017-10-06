// ----------------------------------------------------------------------------
//
//  ParkingModel.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

//import SwiftCommons

// ----------------------------------------------------------------------------

/*
using System.ComponentModel.DataAnnotations;
using RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Models.Abstractions;

namespace RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Models
{
    public class ParkingModel : AbstractValidatableModel
    {
// MARK: - Properties

        [Required]
        public string Watcher { get; set; }

        [Required]
        public VehicleModel[] Vehicles { get; set; }

// MARK: - Methods

        public override void Validate()
        {
            // Validate instance variables
            Check.NotBlank(this.Watcher);
            Check.NotEmpty(this.Vehicles);
            Check.AllValid(this.Vehicles);
        }
    }
}
*/

//open class ParkingModel: ValidatableModel
//{
//// MARK: - Properties
//
//
//    open fileprivate(set) var watcher: String?
//
//    open fileprivate(set) var vehicles: [VehicleModel]!
//
//// MARK: - Methods
//
//    open override func mapping(_ map: Map) {
//        super.mapping(map)
//
//        // (De)serialize to/from json
//        self.watcher  <~ map["watcher"]
//        self.vehicles <~ map["vehicles"]
//    }
//
//    open override func validate() throws {
//        try super.validate()
//
//        // Validate instance
//        try Check.notBlank(self.watcher)
//        try Check.notEmpty(self.vehicles)
//        try Check.allValid(self.vehicles)
//    }
//}

// ----------------------------------------------------------------------------
