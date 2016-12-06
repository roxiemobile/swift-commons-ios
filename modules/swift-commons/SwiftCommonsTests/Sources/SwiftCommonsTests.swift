// ----------------------------------------------------------------------------
//
//  SwiftCommonsTests.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons
import UIKit
import XCTest

// ----------------------------------------------------------------------------

class SwiftCommonsTests: XCTestCase
{
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testModelWithoutRequiredField()
    {
        let model = VehicleModelTest(params: [JsonKeys.Model : "KAMAZ"])

        XCTAssertNil(model, "model should be nil")
    }

    func testModelWithRequiredFields()
    {
        let model = VehicleModelTest(params: [
            JsonKeys.Model : "KAMAZ",
            JsonKeys.Color : "Black"])

        XCTAssertNotNil(model, "model shouldn't be nil")
    }

    func testModelWithRequiredArrayFieldWithNonValidModel()
    {
        if let json = getJSON("ParkingModelWithOneNonValidVehicleInArray")
        {
            let parking = ParkingModelTest(params:json)
            XCTAssertNil(parking, "model should be nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testModelWithRequiredArrayFieldWithValidModel()
    {
        if let json = getJSON("ParkingModelWithValidVehiclesInArray")
        {
            let parking = ParkingModelTest(params:json)
            XCTAssertNotNil(parking, "model should be non nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testModelWithOptionalArrayFieldWithNonValidModel()
    {
        if let json = getJSON("ParkingModelWithOneNonValidVehicleInArray")
        {
            let parking = ParkingModelWithOptionalVehicles(params:json)
            XCTAssertNil(parking, "model should be nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testModelWithOptionalArrayFieldWithValidModel()
    {
        if let json = getJSON("ParkingModelWithValidVehiclesInArray")
        {
            let parking = ParkingModelWithOptionalVehicles(params:json)
            XCTAssertNotNil(parking, "model should be non nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

    func getJSON(fileName: String) -> [String : AnyObject]?
    {
        if let filePath = NSBundle(forClass: self.dynamicType).pathForResource(fileName, ofType: "json") {
            do {
                let data = NSData(contentsOfFile: filePath)
                if let data = data {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)

                    return json as? [String : AnyObject]
                }
            }
            catch let error as NSError {
                print("error loading contentsOf url \(filePath)")
                print(error.localizedDescription)
                return nil
            }
        }
        else {
            return nil
        }

        return nil
    }

}

// ----------------------------------------------------------------------------
