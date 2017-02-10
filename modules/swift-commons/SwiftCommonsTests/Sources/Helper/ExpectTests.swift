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
        expectThrowsException("isTrue") {
            try Expect.isTrue(1 > 2)

        }

        expectNotThrowsException("isTrue") {
            try Expect.isTrue(2 > 1)
        }
    }

    func testIsFalse()
    {
        expectThrowsException("isFalse") {
            try Expect.isFalse(2 > 1)
        }

        expectNotThrowsException("isFalse") {
            try Expect.isFalse(1 > 2)
        }
    }

// MARK: - Tests

    func testIsEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsException("isEqual") {
            try Expect.isEqual(1, 2)
        }
        expectThrowsException("isEqual") {
            try Expect.isEqual(string, nilString)
        }

        expectNotThrowsException("isEqual") {
            try Expect.isEqual(2, 2)
        }
        expectNotThrowsException("isEqual") {
            try Expect.isEqual(string, string)
        }
    }

    func testIsNotEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsException("isNotEqual") {
            try Expect.isNotEqual(2, 2)
        }
        expectThrowsException("isNotEqual") {
            try Expect.isNotEqual(string, string)
        }

        expectNotThrowsException("isNotEqual") {
            try Expect.isNotEqual(1, 2)
        }
        expectNotThrowsException("isNotEqual") {
            try Expect.isNotEqual(string, nilString)
        }
    }

// MARK: - Tests

    func testIsSame()
    {
        let view = UIView()
        let otherView = UIView()


        expectThrowsException("isSame") {
            try Expect.isSame(view, otherView)
        }

        expectNotThrowsException("isSame") {
            try Expect.isSame(view, view)
        }
    }

    func testIsNotSame()
    {
        let view = UIView()
        let otherView = UIView()


        expectThrowsException("isNotSame") {
            try Expect.isNotSame(view, view)
        }

        expectNotThrowsException("isNotSame") {
            try Expect.isNotSame(view, otherView)
        }
    }

// MARK: - Tests

    func testIsNil()
    {
        expectThrowsException("isNil") {
            try Expect.isNil(2)
        }

        expectNotThrowsException("isNil") {
            try Expect.isNil(nil)
        }
    }

    func testIsNotNil()
    {
        expectThrowsException("isNotNil") {
            try Expect.isNotNil(nil)
        }

        expectNotThrowsException("isNotNil") {
            try Expect.isNotNil(2)
        }
    }

// MARK: - Tests

    func testIsNilOrEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsException("isNilOrEmpty") {
            try Expect.isNilOrEmpty(string)
        }

        expectNotThrowsException("isNilOrEmpty") {
            try Expect.isNilOrEmpty(nilString, nilString)
        }
        expectNotThrowsException("isNilOrEmpty") {
            try Expect.isNilOrEmpty(nilString, emptyString)
        }
    }

    func testIsNilOrEmpty_Array()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""

        let array: [String]? = [string]


        expectThrowsException("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty([string])
        }
        expectThrowsException("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty([nilString, string])
        }
        expectThrowsException("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty(nil, array)
        }
        expectThrowsException("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty(array, [emptyString])
        }

        expectNotThrowsException("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty([nilString])
        }
        expectNotThrowsException("isNilOrEmpty_Array") {
            try Expect.isNilOrEmpty([String]())
        }
    }

    func testIsNilOrEmpty_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        expectThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty([string])
        }
        expectThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty([string, nilString])
        }
        expectThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty([string, emptyString])
        }
        expectThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty(nil, arrayOfOptionals)
        }

        expectNotThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            try Expect.isNilOrEmpty([nilString, emptyString])
        }
    }

// MARK: - Tests

    func testIsNotEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsException("isEmpty") {
            try Expect.isNotEmpty(nilString)
        }
        expectThrowsException("isEmpty") {
            try Expect.isNotEmpty(emptyString)
        }

        expectNotThrowsException("isEmpty") {
            try Expect.isNotEmpty(string)
        }
    }

    func testIsNotEmpty_Array()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""

        let array: [String]? = [string]


        expectThrowsException("isEmpty_Array") {
            try Expect.isNotEmpty([nilString])
        }
        expectThrowsException("isEmpty_Array") {
            try Expect.isNotEmpty([string, emptyString])
        }
        expectThrowsException("isEmpty_Array") {
            try Expect.isNotEmpty(nil, array)
        }
        expectThrowsException("isEmpty_Array") {
            try Expect.isNotEmpty(array, [emptyString])
        }

        expectNotThrowsException("isEmpty_Array") {
            try Expect.isNotEmpty([string])
        }
    }

    func testIsNotEmpty_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        expectThrowsException("isEmpty_ArrayOfOptionals") {
            try Expect.isNotEmpty([nilString])
        }
        expectThrowsException("isEmpty_ArrayOfOptionals") {
            try Expect.isNotEmpty([string, nilString])
        }
        expectThrowsException("isEmpty_ArrayOfOptionals") {
            try Expect.isNotEmpty([string, emptyString])
        }
        expectThrowsException("isEmpty_ArrayOfOptionals") {
            try Expect.isNotEmpty(nil, arrayOfOptionals)
        }

        expectNotThrowsException("isEmpty_ArrayOfOptionals") {
            try Expect.isNotEmpty([string])
        }
    }

// MARK: - Tests

    func testIsNilOrWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        expectThrowsException("isNilOrWhiteSpace") {
            try Expect.isNilOrWhiteSpace(string)
        }

        expectNotThrowsException("isNilOrWhiteSpace") {
            try Expect.isNilOrWhiteSpace(nilString)
        }
        expectNotThrowsException("isNilOrWhiteSpace") {
            try Expect.isNilOrWhiteSpace(emptyString)
        }
        expectNotThrowsException("isNilOrWhiteSpace") {
            try Expect.isNilOrWhiteSpace(whitespaceString)
        }
    }

    func testIsNilOrWhiteSpace_Array()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String?] = [nilString, emptyString, whitespaceString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        expectThrowsException("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(string)
        }
        expectThrowsException("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(string, nilString)
        }
        expectThrowsException("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(string, emptyString)
        }
        expectThrowsException("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(string, whitespaceString)
        }
        expectThrowsException("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(nilArray)
        }

        expectNotThrowsException("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(array)
        }
        expectNotThrowsException("isNilOrWhiteSpace_Array") {
            try Expect.isNilOrWhiteSpace(emptyArray)
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


        expectThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace(arrayOfOptionals, [string])
        }
        expectThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace([string, nilString])
        }
        expectThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace([string, emptyString])
        }
        expectThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace([string, whitespaceString])
        }
        expectThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace(nil, arrayOfOptionals)
        }

        expectNotThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            try Expect.isNilOrWhiteSpace([whitespaceString])
        }
    }

// MARK: - Tests

    func testIsNotWhiteSpace()
    {
        let string = "value"
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"


        expectThrowsException("isNotWhiteSpace") {
            try Expect.isNotBlank(emptyString)
        }
        expectThrowsException("isNotWhiteSpace") {
            try Expect.isNotBlank(whitespaceString)
        }

        expectNotThrowsException("isNotWhiteSpace") {
            try Expect.isNotBlank(string)
        }
    }

    func testIsNotWhiteSpace_Array1()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String] = [string, string]
        let emptyArray = [String]()


//        expectThrowsException("isNotWhiteSpace_Array") {
//            try Expect.isNotBlank([emptyString])
//        }
//        expectThrowsException("isNotWhiteSpace_Array") {
//            try Expect.isNotBlank([whitespaceString])
//        }
//        expectThrowsException("isNotWhiteSpace_Array") {
//            try Expect.isNotBlank([string, whitespaceString])
//        }
        expectThrowsException("isNotWhiteSpace_Array") {
            try Expect.isNotBlank(emptyArray)
        }
//
//        expectNotThrowsException("isNotWhiteSpace_Array") {
//            try Expect.isNotBlank(array)
//        }
    }

    func testIsNotWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String] = [string, string]
        let emptyArray = [String]()


        expectThrowsException("isNotWhiteSpace_Array") {
            try Expect.isNotBlank([emptyString])
        }
        expectThrowsException("isNotWhiteSpace_Array") {
            try Expect.isNotBlank([whitespaceString])
        }
        expectThrowsException("isNotWhiteSpace_Array") {
            try Expect.isNotBlank([string, whitespaceString])
        }
        expectThrowsException("isNotWhiteSpace_Array") {
            try Expect.isNotBlank(emptyArray)
        }

        expectNotThrowsException("isNotWhiteSpace_Array") {
            try Expect.isNotBlank(array)
        }
    }

    func testIsNotWhiteSpace_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        expectThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            try Expect.isNotBlank([nilString])
        }
        expectThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            try Expect.isNotBlank([emptyString])
        }
        expectThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            try Expect.isNotBlank([whitespaceString])
        }
        expectThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            try Expect.isNotBlank([string, whitespaceString])
        }

        expectNotThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            try Expect.isNotBlank(arrayOfOptionals)
        }
    }
// MARK: - Tests

    func testIsValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        expectThrowsException("isValid") {
            try Expect.isValid(notValidObject)
        }

        expectNotThrowsException("isValid") {
            try Expect.isValid(validObject)
        }
    }

    func testIsValid_Array()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject, validObject]


        expectThrowsException("isValid_Array") {
            try Expect.isValid([notValidObject])
        }
        expectThrowsException("isValid_Array") {
            try Expect.isValid([validObject, nilObject])
        }
        expectThrowsException("isValid_Array") {
            try Expect.isValid([validObject, notValidObject])
        }

        expectNotThrowsException("isValid_Array") {
            try Expect.isValid(array)
        }
        expectNotThrowsException("isValid_Array") {
            try Expect.isValid([Validatable]())
        }
    }

    func testIsValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, nilObject]


        expectThrowsException("isValid_ArrayOfOptionals") {
            try Expect.isValid([notValidObject])
        }
        expectThrowsException("isValid_ArrayOfOptionals") {
            try Expect.isValid([validObject, notValidObject])
        }
        expectThrowsException("isValid_ArrayOfOptionals") {
            try Expect.isValid(nil, arrayOfOptionals)
        }

        expectNotThrowsException("isValid_ArrayOfOptionals") {
            try Expect.isValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Tests

    func testIsNotValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()


        expectThrowsException("isNotValid") {
            try Expect.isNotValid(validObject)
        }
        expectThrowsException("isNotValid") {
            try Expect.isNotValid(validObject, notValidObject)
        }

        expectNotThrowsException("isNotValid") {
            try Expect.isNotValid(validObject)
        }
    }

    func testIsNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject, validObject]


        expectThrowsException("isNotValid_Array") {
            try Expect.isNotValid([validObject])
        }
        expectThrowsException("isNotValid_Array") {
            try Expect.isNotValid([validObject, notValidObject])
        }
        expectThrowsException("isNotValid_Array") {
            try Expect.isNotValid(nil, array)
        }

        expectNotThrowsException("isNotValid_Array") {
            try Expect.isNotValid([notValidObject])
        }
    }

    func testIsNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, nilObject]


        expectThrowsException("isNotValid_ArrayOfOptionals") {
            try Expect.isNotValid([validObject])
        }
        expectThrowsException("isNotValid_ArrayOfOptionals") {
            try Expect.isNotValid([validObject, notValidObject])
        }
        expectThrowsException("isNotValid_ArrayOfOptionals") {
            try Expect.isNotValid(nil, arrayOfOptionals)
        }

        expectNotThrowsException("isNotValid_ArrayOfOptionals") {
            try Expect.isNotValid([notValidObject])
        }
    }

// MARK: - Tests

    func testIsNilOrValid()
    {
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsException("isNilOrValid") {
            try Expect.isNilOrValid(notValidObject)
        }

        expectNotThrowsException("isNilOrValid") {
            try Expect.isNilOrValid(notValidObject)
        }
        expectNotThrowsException("isNilOrValid") {
            try Expect.isNilOrValid(nilObject)
        }
    }

    func testIsNilOrValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject]


        expectThrowsException("isNilOrValid_Array") {
            try Expect.isNilOrValid([notValidObject])
        }
        expectThrowsException("isNilOrValid_Array") {
            try Expect.isNilOrValid([validObject, notValidObject])
        }

        expectNotThrowsException("isNilOrValid_Array") {
            try Expect.isNilOrValid(nil, [validObject])
        }
        expectNotThrowsException("isNilOrValid_Array") {
            try Expect.isNilOrValid(array)
        }
        expectNotThrowsException("isNilOrValid_Array") {
            try Expect.isNilOrValid([Validatable]())
        }
    }

    func testIsNilOrValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let notValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject]


        expectThrowsException("isNilOrValid_ArrayOfOptionals") {
            try Expect.isNilOrValid([notValidObject])
        }
        expectThrowsException("isNilOrValid_ArrayOfOptionals") {
            try Expect.isNilOrValid([validObject, notValidObject])
        }
        expectThrowsException("isNilOrValid_ArrayOfOptionals") {
            try Expect.isNilOrValid([notValidObject], arrayOfOptionals)
        }

        expectNotThrowsException("isNilOrValid_ArrayOfOptionals") {
            try Expect.isNilOrValid(nil, arrayOfOptionals)
        }
    }

// MARK: - Tests

    func testIsNilOrNotValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsException("isNilOrNotValid") {
            try Expect.isNilOrNotValid(validObject)
        }
        expectThrowsException("isNilOrNotValid") {
            try Expect.isNilOrNotValid(validObject, nilObject)
        }
        expectThrowsException("isNilOrNotValid") {
            try Expect.isNilOrNotValid(validObject, notValidObject)
        }

        expectNotThrowsException("isNilOrNotValid") {
            try Expect.isNilOrNotValid(notValidObject)
        }
    }

    func testIsNilOrNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject]


        expectThrowsException("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid([validObject])
        }
        expectThrowsException("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid([validObject, notValidObject])
        }
        expectThrowsException("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid(nil, [notValidObject])
        }
        expectThrowsException("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid(array, [notValidObject])
        }

        expectNotThrowsException("isNilOrNotValid_Array") {
            try Expect.isNilOrNotValid(nil, [notValidObject])
        }
    }

    func testIsNilOrNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject]
        

        expectThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid([validObject])
        }
        expectThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid([validObject, nilObject])
        }
        expectThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid([validObject, notValidObject])
        }
        expectThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid(nil, arrayOfOptionals)
        }

        expectNotThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            try Expect.isNilOrNotValid(nil, [notValidObject])
        }
    }

// MARK: - Tests

    func testNotThrowIfValidModel()
    {
        if let validModelJson = loadJson("test_parking_model_with_valid_vehicles_in_array")
        {
            expectNotThrowsException("isNonValidModel") {
                let _ = try ParkingModel(params: validModelJson)
            }
        }
    }

    func testThrowIfNotValidModel()
    {
        if let nonValidModelJson = loadJson("test_parking_model_with_one_non_valid_vehicle_in_array")
        {
            expectThrowsException("isNonValidModel", errorType: JsonSyntaxError.self) {
                let _ = try ParkingModel(params: nonValidModelJson)
            }
        }
    }

// MARK: - Private Methods

    private func expectThrowsException(method: String, errorType: ErrorType.Type = ValidationError.self, line: UInt = #line, block: () throws -> ())
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

    private func expectNotThrowsException(method: String, errorType: ErrorType.Type = ValidationError.self, line: UInt = #line, block: () throws -> ())
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
