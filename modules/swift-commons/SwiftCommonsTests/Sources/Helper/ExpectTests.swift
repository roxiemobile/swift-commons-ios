// ----------------------------------------------------------------------------
//
//  ExpectTests.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons
import UIKit
import XCTest

// ----------------------------------------------------------------------------

class ExpectTests: XCTestCase
{
// MARK: - Tests

    func testIsTrue()
    {
        expectThrowsError("isTrue") {
            try Expect.isTrue(2 > 1)
        }

        expectNotThrowsError("isTrue") {
            try Expect.isTrue(1 > 2)
        }
    }

    func testIsFalse()
    {
        expectThrowsError("isFalse") {
            try Expect.isFalse(1 > 2)
        }

        expectNotThrowsError("isFalse") {
            try Expect.isFalse(2 > 1)
        }
    }

// MARK: - Tests

    func testIsEqual()
    {
        let string = "value"
        let nilString: String? = nil

        expectThrowsError("isEqual") {
            try Expect.isEqual(2, 2)
        }
        expectThrowsError("isEqual") {
            try Expect.isEqual(string, string)
        }

        expectNotThrowsError("isEqual") {
            try Expect.isEqual(1, 2)
        }
        expectNotThrowsError("isEqual") {
            try Expect.isEqual(string, nilString)
        }
    }

    func testIsNotEqual()
    {
        let string = "value"
        let nilString: String? = nil

        expectThrowsError("isNotEqual") {
            try Expect.isNotEqual(1, 2)
        }
        expectThrowsError("isNotEqual") {
            try Expect.isNotEqual(string, nilString)
        }

        expectNotThrowsError("isNotEqual") {
            try Expect.isNotEqual(2, 2)
        }
        expectNotThrowsError("isNotEqual") {
            try Expect.isNotEqual(string, string)
        }
    }

// MARK: - Tests

    func testIsNil()
    {
        expectThrowsError("isNil") {
            try Expect.isNil(nil)
        }

        expectNotThrowsError("isNil") {
            try Expect.isNil(2)
        }
    }

    func testIsNotNil()
    {
        expectThrowsError("isNotNil") {
            try Expect.isNotNil(2)
        }

        expectNotThrowsError("isNotNil") {
            try Expect.isNotNil(nil)
        }
    }

// MARK: - Tests

    func testIsNilOrEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsError("isNilOrEmpty") {
            try Expect.isNilOrEmpty(emptyString)
        }
        expectThrowsError("isNilOrEmpty") {
            try Expect.isNilOrEmpty(string, nilString)
        }
        expectThrowsError("isNilOrEmpty") {
            try Expect.isNilOrEmpty(string, emptyString)
        }

        expectNotThrowsError("isNilOrEmpty") {
            try Expect.isNilOrEmpty(string, string)
        }
    }

    func testIsNilOrEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [string]


        expectThrowsError("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty([emptyString])
        }
        expectThrowsError("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty([string, emptyString])
        }
        expectThrowsError("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty(nil, array)
        }
        expectThrowsError("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty(array, [emptyString])
        }

        expectNotThrowsError("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty(array, [string])
        }
    }

    func testIsNilOrEmpty_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        expectThrowsError("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty([emptyString])
        }
        expectThrowsError("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty([string, nilString])
        }
        expectThrowsError("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty([string, emptyString])
        }
        expectThrowsError("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty(nil, arrayOfOptionals)
        }

        expectNotThrowsError("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty(arrayOfOptionals, [string])
        }
    }

// MARK: - Tests

    func testIsNilOrWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        expectThrowsError("isNilOrWhiteSpace") {
            try Expect.isNilOrWhiteSpace(whitespaceString)
        }
        expectThrowsError("isNilOrWhiteSpace") {
            try Expect.isNilOrWhiteSpace(string, nilString)
        }
        expectThrowsError("isNilOrWhiteSpace") {
            try Expect.isNilOrWhiteSpace(string, emptyString)
        }
        expectThrowsError("isNilOrWhiteSpace") {
            try Expect.isNilOrWhiteSpace(string, whitespaceString)
        }

        expectNotThrowsError("isNilOrWhiteSpace") {
            try Expect.isNilOrWhiteSpace(string, string)
        }
    }

    func testIsNilOrWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [string]


        expectThrowsError("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace([whitespaceString])
        }
        expectThrowsError("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace([string, emptyString])
        }
        expectThrowsError("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace([string, whitespaceString])
        }
        expectThrowsError("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(nil, array)
        }
        expectThrowsError("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(array, [whitespaceString])
        }

        expectNotThrowsError("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(array, [string])
        }
    }

    func testIsNilOrWhiteSpace_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        expectThrowsError("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace([whitespaceString])
        }
        expectThrowsError("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace([string, nilString])
        }
        expectThrowsError("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace([string, emptyString])
        }
        expectThrowsError("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace([string, whitespaceString])
        }
        expectThrowsError("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace(nil, arrayOfOptionals)
        }

        expectNotThrowsError("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace(arrayOfOptionals, [string])
        }
    }

// MARK: - Tests

    func testIsNotValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsError("isNotValid") {
            try Expect.isNotValid(notValidObject)
        }
        expectThrowsError("isNotValid") {
            try Expect.isNotValid(validObject, notValidObject)
        }
        expectThrowsError("isNotValid") {
            try Expect.isNotValid(nilObject, notValidObject)
        }

        expectNotThrowsError("isNotValid") {
            try Expect.isNotValid(validObject, nilObject)
        }
    }

    func testIsNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject, validObject]


        expectThrowsError("isNotValid_Array") {
            try Expect.isNotValid([notValidObject])
        }
        expectThrowsError("isNotValid_Array") {
            try Expect.isNotValid([validObject, notValidObject])
        }
        expectThrowsError("isNotValid_Array") {
            try Expect.isNotValid(nil, array)
        }

        expectNotThrowsError("isNotValid_Array") {
            try Expect.isNotValid(array, [validObject])
        }
    }

    func testIsNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, nilObject]


        expectThrowsError("isNotValid_ArrayOfOptionals") {
            try Expect.isNotValid([notValidObject])
        }
        expectThrowsError("isNotValid_ArrayOfOptionals") {
            try Expect.isNotValid([validObject, notValidObject])
        }
        expectThrowsError("isNotValid_ArrayOfOptionals") {
            try Expect.isNotValid(nil, arrayOfOptionals)
        }

        expectNotThrowsError("isNotValid_ArrayOfOptionals") {
            try Expect.isNotValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Tests

    func testIsNilOrNotValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsError("isNilOrNotValid") {
            try Expect.isNilOrNotValid(notValidObject)
        }
        expectThrowsError("isNilOrNotValid") {
            try Expect.isNilOrNotValid(validObject, nilObject)
        }
        expectThrowsError("isNilOrNotValid") {
            try Expect.isNilOrNotValid(validObject, notValidObject)
        }

        expectNotThrowsError("isNilOrNotValid") {
            try Expect.isNilOrNotValid(validObject)
        }
    }

    func testIsNilOrNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject]


        expectThrowsError("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid([notValidObject])
        }
        expectThrowsError("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid([validObject, notValidObject])
        }
        expectThrowsError("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid(nil, array)
        }
        expectThrowsError("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid(array, [notValidObject])
        }

        expectNotThrowsError("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid(array, [validObject])
        }
    }

    func testIsNilOrNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject]


        expectThrowsError("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid([notValidObject])
        }
        expectThrowsError("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid([validObject, nilObject])
        }
        expectThrowsError("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid([validObject, notValidObject])
        }
        expectThrowsError("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid(nil, arrayOfOptionals)
        }

        expectNotThrowsError("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid(arrayOfOptionals, [validObject])
        }
    }


// MARK: - Tests

    func testNotisValidModel()
    {
        if let validModelJson = loadJson("test_parking_model_with_valid_vehicles_in_array")
        {
            expectNotThrowsError("isNonValidModel") {
                let _ = try ParkingModel(params: validModelJson)
            }
        }
    }

    func testIsNotValidModel()
    {
        if let nonValidModelJson = loadJson("test_parking_model_with_one_non_valid_vehicle_in_array")
        {
            expectThrowsError("isNonValidModel", errorType: JsonSyntaxError.self) {
                let _ = try ParkingModel(params: nonValidModelJson)
            }
        }
    }

// MARK: - Private Methods

    private func expectThrowsError(method: String, errorType: ErrorType.Type = ValidationError.self, line: UInt = #line, block: () throws -> ())
    {
        do {
            try block()

            XCTFail("Line: \(line) - \(method): Method not thrown an error")
        }
        catch let error
        {
            if error.dynamicType != errorType {
                XCTFail("Line: \(line) - \(method): Unknown error is thrown")
            }
        }
    }

    private func expectNotThrowsError(method: String, errorType: ErrorType.Type = ValidationError.self, line: UInt = #line, block: () throws -> ())
    {
        do {
            try block()
        }
        catch let error
        {
            if error.dynamicType == errorType {
                XCTFail("Line: \(line) - \(method): Method thrown an error")
            }
            else {
                XCTFail("Line: \(line) - \(method): Unknown error is thrown")
            }
        }
    }

    private func loadJson(string: String) -> [String : AnyObject]?
    {
        if let filePath = NSBundle(forClass: self.dynamicType).pathForResource(string, ofType: "json") {
            do {
                if let data = NSData(contentsOfFile: filePath) {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                    return json as? [String: AnyObject]
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

// ----------------------------------------------------------------------------

private struct ValidModel : Validatable
{
    func isValid() -> Bool {
        return true
    }
}

// ----------------------------------------------------------------------------

private struct NotValidModel : Validatable
{
    func isValid() -> Bool {
        return false
    }
}

// ----------------------------------------------------------------------------
