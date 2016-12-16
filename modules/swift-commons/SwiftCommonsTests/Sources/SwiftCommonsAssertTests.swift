// ----------------------------------------------------------------------------
//
//  SwiftCommonsAssertTests.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

class SwiftCommonsAssertTests: XCTestCase
{    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIsTrue()
    {
        do {
            try Assert.isTrue( 2 > 1 )
        }
        catch {
            XCTFail("isTrue function fails")
        }
    }

    func testIsTrueWithMessage()
    {
        do {
            try Assert.isTrue( 2 > 1, message: "Should pass")
        }
        catch {
            XCTFail("isTrue with message function fails")
        }
    }

    func testIsFalse()
    {
        do {
            try Assert.isFalse( 2 < 1)
        }
        catch {
            XCTFail("isFalse function fails")
        }
    }

    func testIsFalseWithMessage()
    {
        do {
            try Assert.isFalse( 2 < 1, message: "Should pass")
        }
        catch {
            XCTFail("isFalse with message function fails")
        }
    }

    func testIsEqualsBothNil()
    {
        let nilModel: String? = nil
        let nilModel2: String? = nil

        do {
            try Assert.isEquals(nilModel, actual: nilModel2, message: nil)
        }
        catch {
            XCTFail("isEqualsBothNil function fails")
        }
    }

    func testIsEqualsBothNonNil()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try? ParkingModel(params: json)

            do {
                try Assert.isEquals(parking, actual: parking, message: nil)
            }
            catch {
                XCTFail("isEqualsBothNonNil function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

    func testIsNotEqualsBothNil()
    {
        let nilModel: String? = nil
        let nilModel2: String? = nil

        do {
            try Assert.isNotEquals(nilModel, actual: nilModel2, message: nil)
            XCTFail("isNotEqualsBothNil function fails")
        }
        catch {
        }
    }

    func testIsNotEqualsBothNonNil()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
            let json2 = getJSON("test_parking_model_with_valid_vehicles_in_array2")
        {
            let parking = try! ParkingModel(params: json)
            let parking2 = try! ParkingModel(params: json2)

            do {
                try Assert.isNotEquals(parking, actual: parking2, message: nil)
            }
            catch {
                XCTFail("isNotEqualsBothNonNil function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

    func testIsNil()
    {
        let nilModel: String? = nil

        do {
            try Assert.isNil(nilModel, message: nil)
        }
        catch {
            XCTFail("isNil function fails")
        }
    }

    func testIsNotNil()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try? ParkingModel(params: json)

            do {
                try Assert.isNotNil(parking, message: nil)
            }
            catch {
                XCTFail("isNotNil function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

// MARK: - isValid models tests

    func testIsValidArrayOfOptionals()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
            let json2 = getJSON("test_parking_model_with_valid_vehicles_in_array2")
        {
            let parking = try! ParkingModel(params: json)
            let parking2 = try! ParkingModel(params: json2)

            do {
                try Assert.isValid(parking, parking2)
            }
            catch {
                XCTFail("isValidArrayOfOptionals function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

    func testIsValidArrayOfOptionalsWithNilObject()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try! ParkingModel(params: json)

            do {
                try Assert.isValid(parking, nil)
                XCTFail("isValidArrayOfOptionalsWithNilObject function fails")
            }
            catch {

            }
        }
        else {
            fatalError("no such file")
        }
    }

    func testIsValidArrayOfOptionalsArrays()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
            let json2 = getJSON("test_parking_model_with_valid_vehicles_in_array2")
        {
            let parking = try! ParkingModel(params: json)
            let parking2 = try! ParkingModel(params: json2)

            do {
                try Assert.isValid([parking], [parking2])
            }
            catch {
                XCTFail("isValidArrayOfOptionals function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

    func testIsValidArrayOfOptionalsArraysWithNilObject()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try! ParkingModel(params: json)

            do {
                try Assert.isValid([parking], nil)
                XCTFail("isValidArrayOfOptionalsWithNilObject function fails")
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
    func testIsValidArrayOfOptionalsArraysOfOptionalsWithNilObject()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try! ParkingModel(params: json)

            do {
                try Assert.isValid([parking, nil], [parking])
                XCTFail("isValidArrayOfOptionalsArraysOfOptionalsWithNilObject function fails")
            }
            catch {

            }
        }
        else {
            fatalError("no such file")
        }
    }

// MARK: - isNilOrValid models tests

    func testIsNilOrValidArrayOfOptionals()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
            let json2 = getJSON("test_parking_model_with_valid_vehicles_in_array2")
        {
            let parking = try? ParkingModel(params: json)
            let parking2 = try? ParkingModel(params: json2)

            do {
                try Assert.isNilOrValid(parking, parking2)
            }
            catch {
                XCTFail("isNilOrValidArrayOfOptionals function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

    func testIsNilOrValidArrayOfOptionalsWithNilObject()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try? ParkingModel(params: json)

            do {
                try Assert.isNilOrValid(parking, nil)
            }
            catch {
                XCTFail("isNilOrValidArrayOfOptionalsWithNilObject function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

    func testIsNilOrValidArrayOfOptionalsArrays()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array"),
            let json2 = getJSON("test_parking_model_with_valid_vehicles_in_array2")
        {
            let parking = try! ParkingModel(params: json)
            let parking2 = try! ParkingModel(params: json2)

            do {
                try Assert.isNilOrValid([parking], [parking2])
            }
            catch {
                XCTFail("isNilOrValidArrayOfOptionals function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

    func testIsNilOrValidArrayOfOptionalsArraysWithNilObject()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try! ParkingModel(params: json)

            do {
                try Assert.isNilOrValid([parking], nil)
            }
            catch {
                XCTFail("isNilOrValidArrayOfOptionalsWithNilObject function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

    // If one or more models in array are nil than should fail
    // func isValid(array: [ParcelableModel?]? ...)
    func testIsNilOrValidArrayOfOptionalsArraysOfOptionalsWithNilObject()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try? ParkingModel(params: json)

            do {
                try Assert.isNilOrValid([parking, nil], [parking])
                XCTFail("isNilOrValidArrayOfOptionalsWithNilObject function fails")
            }
            catch {
            }
        }
        else {
            fatalError("no such file")
        }
    }

    // If one of arrays is nil - ok
    // func isValid(array: [ParcelableModel?]? ...)
    func testIsNilOrValidArrayOfOptionalsArraysOfOptionalsWithNilArray()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try? ParkingModel(params: json)
            do {
                try Assert.isNilOrValid([parking, parking], nil)
            }
            catch {
                XCTFail("isNilOrValidArrayOfOptionalsArraysOfOptionalsWithNilArray function fails")
            }
        }
        else {
            fatalError("no such file")
        }
    }

// MARK: - String tests

    func testIsNotEmpty()
    {
        let string1 = "string1"
        let string2 = "string2"

        do {
            try Assert.isNotEmpty(string1, string2)
        }
        catch {
            XCTFail("isNotEmpty function fails")
        }
    }

    func testIsNotEmptyWithEmptyString()
    {
        let string1 = "string1"
        let string2 = ""

        do {
            try Assert.isNotEmpty(string1, string2)
            XCTFail("isNotEmptyWithEmptyString function fails")
        }
        catch {
        }
    }

    // MARK: func isNotEmpty(array: [String]? ...)
    func testIsNotEmptyArrayOfOptionalArraysOfString()
    {
        let string1 = "string1"
        let string2 = "string2"

        do {
            try Assert.isNotEmpty([string1], [string2])
        }
        catch {
            XCTFail("isNotEmptyArrayOfOptionalArraysOfString function fails")
        }
    }

    // MARK: func isNotEmpty(array: [String]? ...)
    func testIsNotEmptyArrayOfOptionalArraysOfStringWithNilArray()
    {
        let string = "string1"

        do {
            try Assert.isNotEmpty([string], nil)
            XCTFail("isNotEmptyArrayOfOptionalArraysOfStringWithNilArray function fails")
        }
        catch {
        }
    }

    // MARK: func isNotEmpty(array: [String]? ...)
    func testIsNotEmptyArrayOfOptionalArraysOfStringWithEmptyStringInArray()
    {
        let emptyString = ""
        let filledString = "filledString"

        do {
            try Assert.isNotEmpty([emptyString], [filledString])
            XCTFail("isNotEmptyArrayOfOptionalArraysOfStringWithNilArray function fails")
        }
        catch {
        }
    }

    //MARK: func isNotEmpty(array: [String?]? ...)
    func testIsNotEmptyArrayOfOptionalArraysOfStringWithNilStringInArray()
    {
        let emptyString: String? = nil
        let filledString = "filledString"

        do {
            try Assert.isNotEmpty([emptyString], [filledString])
            XCTFail("isNotEmptyArrayOfOptionalArraysOfStringWithNilStringInArray function fails")
        }
        catch {
        }
    }

    func testIsNotEmptyAtLeastOne()
    {
        let nilString: String? = nil
        let emptyString = ""
        let string = "string"

        do {
            try Assert.isNotEmptyAtLeastOne([nilString, emptyString, string])
        }
        catch {
            XCTFail("isNotEmptyAtLeastOne function fails")
        }
    }

    func testIsNotEmptyAtLeastOneAllNonValid()
    {
        let nilString: String? = nil
        let emptyString = ""

        do {
            try Assert.isNotEmptyAtLeastOne([nilString, emptyString])
            XCTFail("isNotEmptyAtLeastOne function fails")
        }
        catch {
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
