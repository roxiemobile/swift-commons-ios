// ----------------------------------------------------------------------------
//
//  SwiftCommonsExpectableTests.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

class SwiftCommonsExpectableTests: XCTestCase, Expectable
{
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testThrowIfFalse()
    {
        do {
            try throwIfFalse(2 > 1)
        }
        catch {
            XCTFail("testThrowIfFalse function fails")
        }
    }

        func testThrowIfFalseWithMessage()
        {
            do {
                try throwIfFalse(2 > 1, message: "Should pass")
            }
            catch {
                XCTFail("testThrowIfFalseWithMessage function fails")
            }
        }
    
        func testThrowIfTrue()
        {
            do {
                try throwIfTrue(2 < 1)
            }
            catch {
                XCTFail("testThrowIfTrue function fails")
            }
        }
    
        func testThrowIfTrueWithMessage()
        {
            do {
                try throwIfTrue(2 < 1, message: "Should pass")
            }
            catch {
                XCTFail("testThrowIfTrueWithMessage function fails")
            }
        }
    
        func testThrowIfNotEquals()
        {
            let nilModel: String? = nil
            let otherNilModel: String? = nil
    
            do {
                try throwIfNotEquals(nilModel, actual: otherNilModel, message: nil)
            }
            catch {
                XCTFail("testThrowIfNotEquals function fails")
            }
        }
    
        func testThrowIfNotEqualsBothNonNil()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
            {
                let parking = try? ParkingModel(params: json)
    
                do {
                    try throwIfNotEquals(parking, actual: parking, message: nil)
                }
                catch {
                    XCTFail("testThrowIfNotEqualsBothNonNil function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }
    
        func testThrowIfEqualsBothNil()
        {
            let nilModel: String? = nil
            let otherNilModel: String? = nil
    
            do {
                try throwIfEquals(nilModel, actual: otherNilModel, message: nil)
                XCTFail("testThrowIfEqualsBothNil function fails")
            }
            catch {
                // Do nothing
            }
        }
    
        func testThrowIfEqualsBothNonNil()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
               let otherJson = getJSON("test_parking_other_model_with_valid_vehicles_in_array")
            {
                let parking = try! ParkingModel(params: json)
                let otherParking = try! ParkingModel(params: otherJson)
    
                do {
                    try throwIfEquals(parking, actual: otherParking, message: nil)
                }
                catch {
                    XCTFail("testThrowIfEqualsBothNonNil function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }
    
        func testThrowIfNotNil()
        {
            let nilModel: String? = nil
    
            do {
                try throwIfNotNil(nilModel, message: nil) // assert.isNil(nilModel, message: nil)
            }
            catch {
                XCTFail("testThrowIfNotNil function fails")
            }
        }
    
        func testThrowIfNil()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
            {
                let parking = try? ParkingModel(params: json)
    
                do {
                    try throwIfNil(parking, message: nil)
                }
                catch {
                    XCTFail("isNotNil function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }
    
    // MARK: - throwIfNilOrNotValid models tests
    
        func testThrowIfNilOrNotValidArrayOfOptionals()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
                let otherJson = getJSON("test_parking_other_model_with_valid_vehicles_in_array")
            {
                let parking = try! ParkingModel(params: json)
                let otherParking = try! ParkingModel(params: otherJson)
    
                do {
                    try throwIfNilOrNotValid(parking, otherParking)
                }
                catch {
                    XCTFail("testThrowIfNilOrNotValidArrayOfOptionals function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }
    
        func testThrowIfNilOrNotValidArrayOfOptionalsWithNilObject()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
            {
                let parking = try! ParkingModel(params: json)
    
                do {
                    try throwIfNilOrNotValid(parking, nil)
                    XCTFail("testThrowIfNilOrNotValidArrayOfOptionalsWithNilObject function fails")
                }
                catch {
                    // Do nothing
                }
            }
            else {
                fatalError("no such file")
            }
        }

        func testThrowIfNilOrNotValidArrayOfOptionalsArrays()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
                let otherJson = getJSON("test_parking_other_model_with_valid_vehicles_in_array")
            {
                let parking = try! ParkingModel(params: json)
                let otherParking = try! ParkingModel(params: otherJson)
    
                do {
                    try throwIfNilOrNotValid([parking], [otherParking])
                }
                catch {
                    XCTFail("testThrowIfNilOrNotValidArrayOfOptionalsArrays function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }
    
        func testThrowIfNilOrNotValidArrayOfOptionalsArraysWithNilObject()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
            {
                let parking = try! ParkingModel(params: json)
    
                do {
                    try throwIfNilOrNotValid([parking], nil)
                    XCTFail("testThrowIfNilOrNotValidArrayOfOptionalsArraysWithNilObject function fails")
                }
                catch {
    
                }
            }
            else {
                fatalError("no such file")
            }
        }
    
        // If one of arrays is nil, or models in array is nil than should fail
        // func isValid(array: [ParcelableModel?]? ...)
        func testThrowIfNilOrNotValidArrayOfOptionalsArraysOfOptionalsWithNilObject()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
            {
                let parking = try! ParkingModel(params: json)
    
                do {
                    try throwIfNilOrNotValid([parking, nil], [parking])
                    XCTFail("isValidArrayOfOptionalsArraysOfOptionalsWithNilObject function fails")
                }
                catch {
                    // Do nothing
                }
            }
            else {
                fatalError("no such file")
            }
        }
    
    // MARK: - throwIfNotValid models tests
    
        func testThrowIfNotValidArrayOfOptionals()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
                let otherJson = getJSON("test_parking_other_model_with_valid_vehicles_in_array")
            {
                let parking = try? ParkingModel(params: json)
                let otherParking = try? ParkingModel(params: otherJson)
    
                do {
                    try throwIfNotValid(parking, otherParking)
                }
                catch {
                    XCTFail("testThrowIfNotValidArrayOfOptionals function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }

        func testThrowIfNotValidArrayOfOptionalsWithNilObject()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
            {
                let parking = try? ParkingModel(params: json)
    
                do {
                    try throwIfNotValid(parking, nil)
                }
                catch {
                    XCTFail("testThrowIfNotValidArrayOfOptionalsWithNilObject function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }

        func testThrowIfNotValidArrayOfOptionalsArrays()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
                let otherJson = getJSON("test_parking_other_model_with_valid_vehicles_in_array")
            {
                let parking = try! ParkingModel(params: json)
                let otherParking = try! ParkingModel(params: otherJson)
    
                do {
                    try throwIfNotValid([parking], [otherParking])
                }
                catch {
                    XCTFail("testThrowIfNotValidArrayOfOptionalsArrays function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }

        func testThrowIfNotValidArrayOfOptionalsArraysWithNilObject()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
            {
                let parking = try! ParkingModel(params: json)
    
                do {
                    try throwIfNotValid([parking], nil)
                }
                catch {
                    XCTFail("testThrowIfNotValidArrayOfOptionalsArraysWithNilObject function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }
    
        // If one or more models in array are nil than should fail
        // func throwIfNotValid(array: [ParcelableModel?]? ...)
        func testThrowIfNotValidArrayOfOptionalsArraysOfOptionalsWithNilObject()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
            {
                let parking = try? ParkingModel(params: json)
    
                do {
                    try throwIfNotValid([parking, nil], [parking])
                    XCTFail("testThrowIfNotValidArrayOfOptionalsArraysOfOptionalsWithNilObject function fails")
                }
                catch {
                    // Do nothing
                }
            }
            else {
                fatalError("no such file")
            }
        }

        // If one of arrays is nil - ok
        // func throwIfNotValid(array: [ParcelableModel?]? ...)
        func testThrowIfNotValidArrayOfOptionalsArraysOfOptionalsWithNilArray()
        {
            if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
            {
                let parking = try? ParkingModel(params: json)
                do {
                    try throwIfNotValid([parking, parking], nil)
                }
                catch {
                    XCTFail("testThrowIfNotValidArrayOfOptionalsArraysOfOptionalsWithNilArray function fails")
                }
            }
            else {
                fatalError("no such file")
            }
        }

    // MARK: - String tests

        func testThrowIfNilOrEmpty()
        {
            let string = "string"
            let otherString = "otherString"
    
            do {
                try throwIfNilOrEmpty(string, otherString)
            }
            catch {
                XCTFail("testThrowIfNilOrEmpty function fails")
            }
        }

        func testThrowIfNilOrEmptyWithEmptyString()
        {
            let string = "string"
            let emptyString = ""
    
            do {
                try throwIfNilOrEmpty(string, emptyString)
                XCTFail("testThrowIfNilOrEmptyWithEmptyString function fails")
            }
            catch {
                // Do nothing
            }
        }

        // func throwIfNilOrEmpty(array: [String]? ...)
        func testThrowIfNilOrEmptyArrayOfOptionalArraysOfString()
        {
            let string = "string"
            let otherString = "otherString"
    
            do {
                try throwIfNilOrEmpty([string], [otherString])
            }
            catch {
                XCTFail("testThrowIfNilOrEmptyArrayOfOptionalArraysOfString function fails")
            }
        }
    
        // func throwIfNilOrEmpty(array: [String]? ...)
        func testThrowIfNilOrEmptyArrayOfOptionalArraysOfStringWithNilArray()
        {
            let string = "string"
    
            do {
                try throwIfNilOrEmpty([string], nil)
                XCTFail("testThrowIfNilOrEmptyArrayOfOptionalArraysOfStringWithNilArray function fails")
            }
            catch {
                // Do nothing
            }
        }

        // func throwIfNilOrEmpty(array: [String]? ...)
        func testThrowIfNilOrEmptyArrayOfOptionalArraysOfStringWithEmptyStringInArray()
        {
            let emptyString = ""
            let filledString = "filledString"
    
            do {
                try throwIfNilOrEmpty([emptyString], [filledString])
                XCTFail("testThrowIfNilOrEmptyArrayOfOptionalArraysOfStringWithEmptyStringInArray function fails")
            }
            catch {
                // Do nothing
            }
        }
    
        //func throwIfNilOrEmpty(array: [String?]? ...)
        func testThrowIfNilOrEmptyArrayOfOptionalArraysOfStringWithNilStringInArray()
        {
            let emptyString: String? = nil
            let filledString = "filledString"
    
            do {
                try throwIfNilOrEmpty([emptyString], [filledString])
                XCTFail("testThrowIfNilOrEmptyArrayOfOptionalArraysOfStringWithNilStringInArray function fails")
            }
            catch {
                // Do nothing
            }
        }

    func testThrowIfNilOrWhiteSpace()
    {
        let string = "string"
        let otherString = "otherString"

        do {
            try throwIfNilOrWhiteSpace(string, otherString)
        }
        catch {
            XCTFail("testThrowIfNilOrEmpty function fails")
        }
    }

    func testThrowIfNilOrWhiteSpaceWithWhiteSpaceString()
    {
        let string = "string"
        let whiteSpaceString = "   "

        do {
            try throwIfNilOrWhiteSpace(string, whiteSpaceString)
            XCTFail("testThrowIfNilOrWhiteSpaceWithWhiteSpaceString function fails")
        }
        catch {
            // Do nothing
        }
    }

    func getJSON(string: String) -> [String : AnyObject]?
    {
        if let filePath = NSBundle(forClass: self.dynamicType).pathForResource(string, ofType: "json") {
            do {
                let data = NSData(contentsOfFile: filePath)
                if let data = data {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                    return json as? [String : AnyObject]
                }
                else {
                    return nil
                }
            }
            catch let error as NSError {
                print("error loading contentsOf url \(filePath)")
                print(error.localizedDescription)
            }
        }

        return nil
    }


}
