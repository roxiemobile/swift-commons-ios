// ----------------------------------------------------------------------------
//
//  ExpectTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons
import UIKit
import XCTest

// ----------------------------------------------------------------------------

final class ExpectTests: XCTestCase
{
// MARK: - Private Methods

    private func expectThrowsError(method: String, errorType: ErrorType.Type = ExpectationError.self, line: UInt = #line, block: () throws -> ()) {
        var cause: ErrorType? = nil

        do {
            try block()
        }
        catch {
            cause = error
        }

        if let err = cause
        {
            if err.dynamicType == errorType {
                // Do nothing
            }
            else {
                XCTFail("Line: \(line) - \(method): Unknown error is thrown")
            }
        }
        else {
            XCTFail("Line: \(line) - \(method): Method not thrown an error")
        }
    }

    private func expectNotThrowsError(method: String, errorType: ErrorType.Type = ExpectationError.self, line: UInt = #line, block: () throws -> ()) {
        var cause: ErrorType? = nil

        do {
            try block()
        }
        catch {
            cause = error
        }

        if let err = cause
        {
            if err.dynamicType == errorType {
                XCTFail("Line: \(line) - \(method): Method thrown an error")
            }
            else {
                XCTFail("Line: \(line) - \(method): Unknown error is thrown")
            }
        }
        else {
            // Do nothing
        }
    }

    private func loadJson(filename: String) -> [String: AnyObject]? {
        var jsonObject: [String: AnyObject]? = nil

        if let filepath = NSBundle(forClass: self.dynamicType).pathForResource(filename, ofType: "json") {
            do {
                if  let data = NSData(contentsOfFile: filepath) {
                    let object = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)

                    jsonObject = object as? [String: AnyObject]
                    if jsonObject == nil {
                        XCTFail("Could not parse JSON from file: \(filename).json")
                    }
                }
            }
            catch {
                XCTFail("Could not load file: \(filename).json")
            }
        }
        return jsonObject
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsTrue()
    {
        expectThrowsError("isTrue") {
            try Expect.isTrue(1 > 2)
        }

        expectNotThrowsError("isTrue") {
            try Expect.isTrue(2 > 1)
        }
    }

    func testIsFalse()
    {
        expectThrowsError("isFalse") {
            try Expect.isFalse(2 > 1)
        }

        expectNotThrowsError("isFalse") {
            try Expect.isFalse(1 > 2)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsError("isEqual") {
            try Expect.isEqual(1, 2)
        }
        expectThrowsError("isEqual") {
            try Expect.isEqual(string, nilString)
        }

        expectNotThrowsError("isEqual") {
            try Expect.isEqual(2, 2)
        }
        expectNotThrowsError("isEqual") {
            try Expect.isEqual(string, string)
        }
    }

    func testIsNotEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsError("isNotEqual") {
            try Expect.isNotEqual(2, 2)
        }
        expectThrowsError("isNotEqual") {
            try Expect.isNotEqual(string, string)
        }

        expectNotThrowsError("isNotEqual") {
            try Expect.isNotEqual(1, 2)
        }
        expectNotThrowsError("isNotEqual") {
            try Expect.isNotEqual(string, nilString)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsSame()
    {
        let view = UIView()
        let otherView = UIView()


        expectThrowsError("isSame") {
            try Expect.isSame(view, otherView)
        }

        expectNotThrowsError("isSame") {
            try Expect.isSame(view, view)
        }
    }

    func testIsNotSame()
    {
        let view = UIView()
        let otherView = UIView()


        expectThrowsError("isNotSame") {
            try Expect.isNotSame(view, view)
        }

        expectNotThrowsError("isNotSame") {
            try Expect.isNotSame(view, otherView)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsNil()
    {
        expectThrowsError("isNil") {
            try Expect.isNil(2)
        }

        expectNotThrowsError("isNil") {
            try Expect.isNil(nil)
        }
    }

    func testIsNotNil()
    {
        expectThrowsError("isNotNil") {
            try Expect.isNotNil(nil)
        }

        expectNotThrowsError("isNotNil") {
            try Expect.isNotNil(2)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsError("isEmpty") {
            try Expect.isEmpty(string)
        }

        expectNotThrowsError("isEmpty") {
            try Expect.isEmpty(nilString)
        }
        expectNotThrowsError("isEmpty") {
            try Expect.isEmpty(emptyString)
        }

        // --

        let array = ["value", "otherValue"]
        let nilArray: [String]? = nil
        let emptyArray = [String]()

        expectThrowsError("isEmpty_Array") {
            try Expect.isEmpty(array)
        }

        expectNotThrowsError("isEmpty_Array") {
            try Expect.isEmpty(nilArray)
        }
        expectNotThrowsError("isEmpty_Array") {
            try Expect.isEmpty(emptyArray)
        }

        // --

        let map = ["key": "value", "otherKey": "otherValue"]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        expectThrowsError("isEmpty_Map") {
            try Expect.isEmpty(map)
        }

        expectNotThrowsError("isEmpty_Map") {
            try Expect.isEmpty(nilMap)
        }
        expectNotThrowsError("isEmpty_Map") {
            try Expect.isEmpty(emptyMap)
        }
    }

    func testIsAllEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [emptyString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        expectThrowsError("isAllEmpty_Array") {
            try Expect.isAllEmpty([string])
        }
        expectThrowsError("isAllEmpty_Array") {
            try Expect.isAllEmpty([emptyString, string])
        }

        expectNotThrowsError("isAllEmpty_Array") {
            try Expect.isAllEmpty(array)
        }
        expectNotThrowsError("isAllEmpty_Array") {
            try Expect.isAllEmpty(nilArray)
        }
        expectNotThrowsError("isAllEmpty_Array") {
            try Expect.isAllEmpty(emptyArray)
        }
    }

    func testIsAllEmpty_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let array: [String?]? = [nilString, emptyString]
        let nilArray: [String?]? = nil
        let emptyArray = [String?]()


        expectThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Expect.isAllEmpty([string])
        }
        expectThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Expect.isAllEmpty([nilString, string])
        }
        expectThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Expect.isAllEmpty([emptyString, string])
        }

        expectNotThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Expect.isAllEmpty(array)
        }
        expectNotThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Expect.isAllEmpty(nilArray)
        }
        expectNotThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Expect.isAllEmpty(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsNotEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsError("isNotEmpty") {
            try Expect.isNotEmpty(nilString)
        }
        expectThrowsError("isNotEmpty") {
            try Expect.isNotEmpty(emptyString)
        }

        expectNotThrowsError("isNotEmpty") {
            try Expect.isNotEmpty(string)
        }

        // --

        let array = ["value", "otherValue"]
        let nilArray: [String]? = nil
        let emptyArray = [String]()

        expectThrowsError("isNotEmpty_Array") {
            try Expect.isNotEmpty(nilArray)
        }
        expectThrowsError("isNotEmpty_Array") {
            try Expect.isNotEmpty(emptyArray)
        }

        expectNotThrowsError("isNotEmpty_Array") {
            try Expect.isNotEmpty(array)
        }

        // --

        let map = ["key": "value", "otherKey": "otherValue"]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        expectThrowsError("isNotEmpty_Map") {
            try Expect.isNotEmpty(nilMap)
        }
        expectThrowsError("isNotEmpty_Map") {
            try Expect.isNotEmpty(emptyMap)
        }

        expectNotThrowsError("isNotEmpty_Map") {
            try Expect.isNotEmpty(map)
        }
    }

    func testIsAllNotEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let otherString = "otherValue"
        let array: [String]? = [string, otherString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        expectThrowsError("isAllNotEmpty_Array") {
            try Expect.isAllNotEmpty([string, emptyString])
        }

        expectNotThrowsError("isAllNotEmpty_Array") {
            try Expect.isAllNotEmpty(array)
        }
        expectNotThrowsError("isAllNotEmpty_Array") {
            try Expect.isAllNotEmpty(nilArray)
        }
        expectNotThrowsError("isAllNotEmpty_Array") {
            try Expect.isAllNotEmpty(emptyArray)
        }
    }

    func testIsAllNotEmpty_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let otherString: String? = "otherValue"
        let array: [String?]? = [string, otherString]
        let nilArray: [String?]? = nil
        let emptyArray = [String?]()


        expectThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Expect.isAllNotEmpty([string, nilString])
        }
        expectThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Expect.isAllNotEmpty([string, emptyString])
        }

        expectNotThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Expect.isAllNotEmpty(array)
        }
        expectNotThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Expect.isAllNotEmpty(nilArray)
        }
        expectNotThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Expect.isAllNotEmpty(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsBlank()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        expectThrowsError("isBlank") {
            try Expect.isBlank(string)
        }

        expectNotThrowsError("isBlank") {
            try Expect.isBlank(nilString)
        }
        expectNotThrowsError("isBlank") {
            try Expect.isBlank(emptyString)
        }
        expectNotThrowsError("isBlank") {
            try Expect.isBlank(whitespaceString)
        }
    }

    func testIsAllBlank_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String] = [emptyString, whitespaceString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        expectThrowsError("isAllBlank_Array") {
            try Expect.isAllBlank([string])
        }
        expectThrowsError("isAllBlank_Array") {
            try Expect.isAllBlank([emptyString, string])
        }
        expectThrowsError("isAllBlank_Array") {
            try Expect.isAllBlank([whitespaceString, string])
        }

        expectNotThrowsError("isAllBlank_Array") {
            try Expect.isAllBlank(array)
        }
        expectNotThrowsError("isAllBlank_Array") {
            try Expect.isAllBlank(nilArray)
        }
        expectNotThrowsError("isAllBlank_Array") {
            try Expect.isAllBlank(emptyArray)
        }
    }

    func testIsAllBlank_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let array: [String?]? = [nilString, emptyString, whitespaceString]
        let nilArray: [String?]? = nil
        let emptyArray = [String?]()


        expectThrowsError("isAllBlank_ArrayOfOptionals") {
            try Expect.isAllBlank([string])
        }
        expectThrowsError("isAllBlank_ArrayOfOptionals") {
            try Expect.isAllBlank([nilString, string])
        }
        expectThrowsError("isAllBlank_ArrayOfOptionals") {
            try Expect.isAllBlank([emptyString, string])
        }
        expectThrowsError("isAllBlank_ArrayOfOptionals") {
            try Expect.isAllBlank([whitespaceString, string])
        }

        expectNotThrowsError("isAllBlank_ArrayOfOptionals") {
            try Expect.isAllBlank(array)
        }
        expectNotThrowsError("isAllBlank_ArrayOfOptionals") {
            try Expect.isAllBlank(nilArray)
        }
        expectNotThrowsError("isAllBlank_ArrayOfOptionals") {
            try Expect.isAllBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsNotBlank()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        expectThrowsError("isNotBlank") {
            try Expect.isNotBlank(nilString)
        }
        expectThrowsError("isNotBlank") {
            try Expect.isNotBlank(emptyString)
        }
        expectThrowsError("isNotBlank") {
            try Expect.isNotBlank(whitespaceString)
        }

        expectNotThrowsError("isNotBlank") {
            try Expect.isNotBlank(string)
        }
    }

    func testIsAllNotBlank_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let otherString = "otherValue"
        let array: [String]? = [string, otherString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        expectThrowsError("isAllNotBlank_Array") {
            try Expect.isAllNotBlank([emptyString])
        }
        expectThrowsError("isAllNotBlank_Array") {
            try Expect.isAllNotBlank([whitespaceString])
        }
        expectThrowsError("isAllNotBlank_Array") {
            try Expect.isAllNotBlank([string, whitespaceString])
        }

        expectNotThrowsError("isAllNotBlank_Array") {
            try Expect.isAllNotBlank(array)
        }
        expectNotThrowsError("isAllNotBlank_Array") {
            try Expect.isAllNotBlank(nilArray)
        }
        expectNotThrowsError("isAllNotBlank_Array") {
            try Expect.isAllNotBlank(emptyArray)
        }
    }

    func testIsAllNotBlank_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let otherString: String? = "otherValue"
        let array: [String?]? = [string, otherString]
        let nilArray: [String?]? = nil
        let emptyArray = [String?]()


        expectThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Expect.isAllNotBlank([nilString])
        }
        expectThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Expect.isAllNotBlank([emptyString])
        }
        expectThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Expect.isAllNotBlank([whitespaceString])
        }
        expectThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Expect.isAllNotBlank([string, whitespaceString])
        }

        expectNotThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Expect.isAllNotBlank(array)
        }
        expectNotThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Expect.isAllNotBlank(nilArray)
        }
        expectNotThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Expect.isAllNotBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsValid()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        expectThrowsError("isValid") {
            try Expect.isValid(notValidObject)
        }

        expectNotThrowsError("isValid") {
            try Expect.isValid(validObject)
        }
    }

    func testIsAllValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable]? = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        expectThrowsError("isAllValid_Array") {
            try Expect.isAllValid([notValidObject])
        }
        expectThrowsError("isAllValid_Array") {
            try Expect.isAllValid([validObject, notValidObject])
        }

        expectNotThrowsError("isAllValid_Array") {
            try Expect.isAllValid(array)
        }
        expectNotThrowsError("isAllValid_Array") {
            try Expect.isAllValid(nilArray)
        }
        expectNotThrowsError("isAllValid_Array") {
            try Expect.isAllValid(emptyArray)
        }
    }

    func testIsAllValid_ArrayOfOptionals()
    {
        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: [Validatable?]? = [validObject]
        let nilArray: [Validatable?]? = nil
        let emptyArray = [Validatable?]()


        expectThrowsError("isAllValid_ArrayOfOptionals") {
            try Expect.isAllValid([notValidObject])
        }
        expectThrowsError("isAllValid_ArrayOfOptionals") {
            try Expect.isAllValid([validObject, nilObject])
        }
        expectThrowsError("isAllValid_ArrayOfOptionals") {
            try Expect.isAllValid([validObject, notValidObject])
        }

        expectNotThrowsError("isAllValid_ArrayOfOptionals") {
            try Expect.isAllValid(array)
        }
        expectNotThrowsError("isAllValid_ArrayOfOptionals") {
            try Expect.isAllValid(nilArray)
        }
        expectNotThrowsError("isAllValid_ArrayOfOptionals") {
            try Expect.isAllValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsNotValid()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()


        expectThrowsError("isNotValid") {
            try Expect.isNotValid(validObject)
        }

        expectNotThrowsError("isNotValid") {
            try Expect.isNotValid(notValidObject)
        }
    }

    func testIsAllNotValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        expectThrowsError("isAllNotValid_Array") {
            try Expect.isAllNotValid([validObject])
        }
        expectThrowsError("isAllNotValid_Array") {
            try Expect.isAllNotValid([notValidObject, validObject])
        }

        expectNotThrowsError("isAllNotValid_Array") {
            try Expect.isAllNotValid(array)
        }
        expectNotThrowsError("isAllNotValid_Array") {
            try Expect.isAllNotValid(nilArray)
        }
        expectNotThrowsError("isAllNotValid_Array") {
            try Expect.isAllNotValid(emptyArray)
        }
    }

    func testIsAllNotValid_ArrayOfOptionals()
    {
        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: [Validatable?]? = [notValidObject]
        let nilArray: [Validatable?]? = nil
        let emptyArray = [Validatable?]()

        expectThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Expect.isAllNotValid([validObject])
        }
        expectThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Expect.isAllNotValid([nilObject])
        }
        expectThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Expect.isAllNotValid([notValidObject, validObject])
        }

        expectNotThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Expect.isAllNotValid(array)
        }
        expectNotThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Expect.isAllNotValid(nilArray)
        }
        expectNotThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Expect.isAllNotValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsNilOrValid()
    {
        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        expectThrowsError("isNilOrValid") {
            try Expect.isNilOrValid(notValidObject)
        }

        expectNotThrowsError("isNilOrValid") {
            try Expect.isNilOrValid(validObject)
        }
        expectNotThrowsError("isNilOrValid") {
            try Expect.isNilOrValid(nilObject)
        }
    }

    func testIsAllNilOrValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        expectThrowsError("isAllNilOrValid_Array") {
            try Expect.isAllNilOrValid([notValidObject])
        }
        expectThrowsError("isAllNilOrValid_Array") {
            try Expect.isAllNilOrValid([validObject, notValidObject])
        }

        expectNotThrowsError("isAllNilOrValid_Array") {
            try Expect.isAllNilOrValid(array)
        }
        expectNotThrowsError("isAllNilOrValid_Array") {
            try Expect.isAllNilOrValid(nilArray)
        }
        expectNotThrowsError("isAllNilOrValid_Array") {
            try Expect.isAllNilOrValid(emptyArray)
        }
    }

    func testIsAllNilOrValid_ArrayOfOptionals()
    {
        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: [Validatable?]? = [validObject, nilObject]
        let nilArray: [Validatable?]? = nil
        let emptyArray = [Validatable?]()


        expectThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Expect.isAllNilOrValid([notValidObject])
        }
        expectThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Expect.isAllNilOrValid([validObject, notValidObject])
        }
        expectThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Expect.isAllNilOrValid([nilObject, notValidObject])
        }

        expectNotThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Expect.isAllNilOrValid(array)
        }
        expectNotThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Expect.isAllNilOrValid(nilArray)
        }
        expectNotThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Expect.isAllNilOrValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsNilOrNotValid()
    {
        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        expectThrowsError("isNilOrNotValid") {
            try Expect.isNilOrNotValid(validObject)
        }

        expectNotThrowsError("isNilOrNotValid") {
            try Expect.isNilOrNotValid(nilObject)
        }
        expectNotThrowsError("isNilOrNotValid") {
            try Expect.isNilOrNotValid(notValidObject)
        }
    }

    func testIsAllNilOrNotValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        expectThrowsError("isAllNilOrNotValid_Array") {
            try Expect.isAllNilOrNotValid([validObject])
        }
        expectThrowsError("isAllNilOrNotValid_Array") {
            try Expect.isAllNilOrNotValid([notValidObject, validObject])
        }

        expectNotThrowsError("isAllNilOrNotValid_Array") {
            try Expect.isAllNilOrNotValid(array)
        }
        expectNotThrowsError("isAllNilOrNotValid_Array") {
            try Expect.isAllNilOrNotValid(nilArray)
        }
        expectNotThrowsError("isAllNilOrNotValid_Array") {
            try Expect.isAllNilOrNotValid(emptyArray)
        }
    }

    func testIsAllNilOrNotValid_ArrayOfOptionals()
    {
        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: [Validatable?]? = [notValidObject, nilObject]
        let nilArray: [Validatable?]? = nil
        let emptyArray = [Validatable?]()


        expectThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Expect.isAllNilOrNotValid([validObject])
        }
        expectThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Expect.isAllNilOrNotValid([nilObject, validObject])
        }
        expectThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Expect.isAllNilOrNotValid([notValidObject, validObject])
        }

        expectNotThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Expect.isAllNilOrNotValid(array)
        }
        expectNotThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Expect.isAllNilOrNotValid(nilArray)
        }
        expectNotThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Expect.isAllNilOrNotValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension ExpectTests
{
// MARK: - Tests

    func testIsValidModel() {
        var parking: ParkingModel? = nil

        if let jsonObject = loadJson("test_parking_model_with_valid_vehicles_in_array") {
            expectNotThrowsError("isValidModel", errorType: ExpectationError.self) {
                parking = try ParkingModel(params: jsonObject)
            }
        }

        XCTAssertNotNil(parking)
        XCTAssertTrue(parking!.isValid())
    }

    func testIsNotValidModel() {
        var parking: ParkingModel? = nil

        if let jsonObject = loadJson("test_parking_model_with_one_non_valid_vehicle_in_array") {
            expectThrowsError("isNotValidModel", errorType: JsonSyntaxError.self) {
                parking = try ParkingModel(params: jsonObject)
            }
        }

        XCTAssertNil(parking)
    }
}

// ----------------------------------------------------------------------------
