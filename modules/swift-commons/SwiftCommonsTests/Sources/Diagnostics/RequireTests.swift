// ----------------------------------------------------------------------------
//
//  RequireTests.swift
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

final class RequireTests: XCTestCase
{
// MARK: - Private Methods

    fileprivate func requireThrowsException(_ method: String, errorType: NSException.Type = RequirementException.self, line: UInt = #line, block: @escaping () -> ()) {
        var cause: NSException? = nil

        Try {
            block()
        }.Catch { exception in
            cause = exception
        }

        if let exc = cause
        {
            if type(of: exc) == errorType {
                // Do nothing
            }
            else {
                XCTFail("Line: \(line) - \(method): Unknown exception is thrown")
            }
        }
        else {
            XCTFail("Line: \(line) - \(method): Method not thrown an exception")
        }
    }

    fileprivate func requireNotThrowsException(_ method: String, errorType: NSException.Type = RequirementException.self, line: UInt = #line, block: @escaping () -> ()) {
        var cause: NSException? = nil

        Try {
            block()
        }.Catch { exception in
            cause = exception
        }

        if let exc = cause
        {
            if type(of: exc) == errorType {
                XCTFail("Line: \(line) - \(method): Method thrown an exception")
            }
            else {
                XCTFail("Line: \(line) - \(method): Unknown exception is thrown")
            }
        }
        else {
            // Do nothing
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsTrue()
    {
        requireThrowsException("isTrue") {
            Require.isTrue(1 > 2)
        }

        requireNotThrowsException("isTrue") {
            Require.isTrue(2 > 1)
        }
    }

    func testIsFalse()
    {
        requireThrowsException("isFalse") {
            Require.isFalse(2 > 1)
        }

        requireNotThrowsException("isFalse") {
            Require.isFalse(1 > 2)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsEqual()
    {
        let string = "value"
        let nilString: String? = nil


        requireThrowsException("isEqual") {
            Require.isEqual(1, 2)
        }
        requireThrowsException("isEqual") {
            Require.isEqual(string, nilString)
        }

        requireNotThrowsException("isEqual") {
            Require.isEqual(2, 2)
        }
        requireNotThrowsException("isEqual") {
            Require.isEqual(string, string)
        }
    }

    func testIsNotEqual()
    {
        let string = "value"
        let nilString: String? = nil


        requireThrowsException("isNotEqual") {
            Require.isNotEqual(2, 2)
        }
        requireThrowsException("isNotEqual") {
            Require.isNotEqual(string, string)
        }

        requireNotThrowsException("isNotEqual") {
            Require.isNotEqual(1, 2)
        }
        requireNotThrowsException("isNotEqual") {
            Require.isNotEqual(string, nilString)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsSame()
    {
        let view = UIView()
        let otherView = UIView()


        requireThrowsException("isSame") {
            Require.isSame(view, otherView)
        }

        requireNotThrowsException("isSame") {
            Require.isSame(view, view)
        }
    }

    func testIsNotSame()
    {
        let view = UIView()
        let otherView = UIView()


        requireThrowsException("isNotSame") {
            Require.isNotSame(view, view)
        }

        requireNotThrowsException("isNotSame") {
            Require.isNotSame(view, otherView)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsNil()
    {
        requireThrowsException("isNil") {
            Require.isNil(2)
        }

        requireNotThrowsException("isNil") {
            Require.isNil(nil)
        }
    }

    func testIsNotNil()
    {
        requireThrowsException("isNotNil") {
            Require.isNotNil(nil)
        }

        requireNotThrowsException("isNotNil") {
            Require.isNotNil(2)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        requireThrowsException("isEmpty") {
            Require.isEmpty(string)
        }

        requireNotThrowsException("isEmpty") {
            Require.isEmpty(nilString)
        }
        requireNotThrowsException("isEmpty") {
            Require.isEmpty(emptyString)
        }

        // --

        let array = ["value", "otherValue"]
        let nilArray: [String]? = nil
        let emptyArray = [String]()

        requireThrowsException("isEmpty_Array") {
            Require.isEmpty(array)
        }

        requireNotThrowsException("isEmpty_Array") {
            Require.isEmpty(nilArray)
        }
        requireNotThrowsException("isEmpty_Array") {
            Require.isEmpty(emptyArray)
        }

        // --

        let map = ["key": "value", "otherKey": "otherValue"]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        requireThrowsException("isEmpty_Map") {
            Require.isEmpty(map)
        }

        requireNotThrowsException("isEmpty_Map") {
            Require.isEmpty(nilMap)
        }
        requireNotThrowsException("isEmpty_Map") {
            Require.isEmpty(emptyMap)
        }
    }

    func testIsAllEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [emptyString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        requireThrowsException("isAllEmpty_Array") {
            Require.isAllEmpty([string])
        }
        requireThrowsException("isAllEmpty_Array") {
            Require.isAllEmpty([emptyString, string])
        }

        requireNotThrowsException("isAllEmpty_Array") {
            Require.isAllEmpty(array)
        }
        requireNotThrowsException("isAllEmpty_Array") {
            Require.isAllEmpty(nilArray)
        }
        requireNotThrowsException("isAllEmpty_Array") {
            Require.isAllEmpty(emptyArray)
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


        requireThrowsException("isAllEmpty_ArrayOfOptionals") {
            Require.isAllEmpty([string])
        }
        requireThrowsException("isAllEmpty_ArrayOfOptionals") {
            Require.isAllEmpty([nilString, string])
        }
        requireThrowsException("isAllEmpty_ArrayOfOptionals") {
            Require.isAllEmpty([emptyString, string])
        }

        requireNotThrowsException("isAllEmpty_ArrayOfOptionals") {
            Require.isAllEmpty(array)
        }
        requireNotThrowsException("isAllEmpty_ArrayOfOptionals") {
            Require.isAllEmpty(nilArray)
        }
        requireNotThrowsException("isAllEmpty_ArrayOfOptionals") {
            Require.isAllEmpty(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsNotEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        requireThrowsException("isNotEmpty") {
            Require.isNotEmpty(nilString)
        }
        requireThrowsException("isNotEmpty") {
            Require.isNotEmpty(emptyString)
        }

        requireNotThrowsException("isNotEmpty") {
            Require.isNotEmpty(string)
        }

        // --

        let array = ["value", "otherValue"]
        let nilArray: [String]? = nil
        let emptyArray = [String]()

        requireThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty(nilArray)
        }
        requireThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty(emptyArray)
        }

        requireNotThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty(array)
        }

        // --

        let map = ["key": "value", "otherKey": "otherValue"]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        requireThrowsException("isNotEmpty_Map") {
            Require.isNotEmpty(nilMap)
        }
        requireThrowsException("isNotEmpty_Map") {
            Require.isNotEmpty(emptyMap)
        }

        requireNotThrowsException("isNotEmpty_Map") {
            Require.isNotEmpty(map)
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


        requireThrowsException("isAllNotEmpty_Array") {
            Require.isAllNotEmpty([string, emptyString])
        }

        requireNotThrowsException("isAllNotEmpty_Array") {
            Require.isAllNotEmpty(array)
        }
        requireNotThrowsException("isAllNotEmpty_Array") {
            Require.isAllNotEmpty(nilArray)
        }
        requireNotThrowsException("isAllNotEmpty_Array") {
            Require.isAllNotEmpty(emptyArray)
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


        requireThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Require.isAllNotEmpty([string, nilString])
        }
        requireThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Require.isAllNotEmpty([string, emptyString])
        }

        requireNotThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Require.isAllNotEmpty(array)
        }
        requireNotThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Require.isAllNotEmpty(nilArray)
        }
        requireNotThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Require.isAllNotEmpty(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsBlank()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        requireThrowsException("isBlank") {
            Require.isBlank(string)
        }

        requireNotThrowsException("isBlank") {
            Require.isBlank(nilString)
        }
        requireNotThrowsException("isBlank") {
            Require.isBlank(emptyString)
        }
        requireNotThrowsException("isBlank") {
            Require.isBlank(whitespaceString)
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


        requireThrowsException("isAllBlank_Array") {
            Require.isAllBlank([string])
        }
        requireThrowsException("isAllBlank_Array") {
            Require.isAllBlank([emptyString, string])
        }
        requireThrowsException("isAllBlank_Array") {
            Require.isAllBlank([whitespaceString, string])
        }

        requireNotThrowsException("isAllBlank_Array") {
            Require.isAllBlank(array)
        }
        requireNotThrowsException("isAllBlank_Array") {
            Require.isAllBlank(nilArray)
        }
        requireNotThrowsException("isAllBlank_Array") {
            Require.isAllBlank(emptyArray)
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


        requireThrowsException("isAllBlank_ArrayOfOptionals") {
            Require.isAllBlank([string])
        }
        requireThrowsException("isAllBlank_ArrayOfOptionals") {
            Require.isAllBlank([nilString, string])
        }
        requireThrowsException("isAllBlank_ArrayOfOptionals") {
            Require.isAllBlank([emptyString, string])
        }
        requireThrowsException("isAllBlank_ArrayOfOptionals") {
            Require.isAllBlank([whitespaceString, string])
        }

        requireNotThrowsException("isAllBlank_ArrayOfOptionals") {
            Require.isAllBlank(array)
        }
        requireNotThrowsException("isAllBlank_ArrayOfOptionals") {
            Require.isAllBlank(nilArray)
        }
        requireNotThrowsException("isAllBlank_ArrayOfOptionals") {
            Require.isAllBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsNotBlank()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        requireThrowsException("isNotBlank") {
            Require.isNotBlank(nilString)
        }
        requireThrowsException("isNotBlank") {
            Require.isNotBlank(emptyString)
        }
        requireThrowsException("isNotBlank") {
            Require.isNotBlank(whitespaceString)
        }

        requireNotThrowsException("isNotBlank") {
            Require.isNotBlank(string)
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


        requireThrowsException("isAllNotBlank_Array") {
            Require.isAllNotBlank([emptyString])
        }
        requireThrowsException("isAllNotBlank_Array") {
            Require.isAllNotBlank([whitespaceString])
        }
        requireThrowsException("isAllNotBlank_Array") {
            Require.isAllNotBlank([string, whitespaceString])
        }

        requireNotThrowsException("isAllNotBlank_Array") {
            Require.isAllNotBlank(array)
        }
        requireNotThrowsException("isAllNotBlank_Array") {
            Require.isAllNotBlank(nilArray)
        }
        requireNotThrowsException("isAllNotBlank_Array") {
            Require.isAllNotBlank(emptyArray)
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


        requireThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Require.isAllNotBlank([nilString])
        }
        requireThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Require.isAllNotBlank([emptyString])
        }
        requireThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Require.isAllNotBlank([whitespaceString])
        }
        requireThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Require.isAllNotBlank([string, whitespaceString])
        }

        requireNotThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Require.isAllNotBlank(array)
        }
        requireNotThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Require.isAllNotBlank(nilArray)
        }
        requireNotThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Require.isAllNotBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsValid()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        requireThrowsException("isValid") {
            Require.isValid(notValidObject)
        }

        requireNotThrowsException("isValid") {
            Require.isValid(validObject)
        }
    }

    func testIsAllValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable]? = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        requireThrowsException("isAllValid_Array") {
            Require.isAllValid([notValidObject])
        }
        requireThrowsException("isAllValid_Array") {
            Require.isAllValid([validObject, notValidObject])
        }

        requireNotThrowsException("isAllValid_Array") {
            Require.isAllValid(array)
        }
        requireNotThrowsException("isAllValid_Array") {
            Require.isAllValid(nilArray)
        }
        requireNotThrowsException("isAllValid_Array") {
            Require.isAllValid(emptyArray)
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


        requireThrowsException("isAllValid_ArrayOfOptionals") {
            Require.isAllValid([notValidObject])
        }
        requireThrowsException("isAllValid_ArrayOfOptionals") {
            Require.isAllValid([validObject, nilObject])
        }
        requireThrowsException("isAllValid_ArrayOfOptionals") {
            Require.isAllValid([validObject, notValidObject])
        }

        requireNotThrowsException("isAllValid_ArrayOfOptionals") {
            Require.isAllValid(array)
        }
        requireNotThrowsException("isAllValid_ArrayOfOptionals") {
            Require.isAllValid(nilArray)
        }
        requireNotThrowsException("isAllValid_ArrayOfOptionals") {
            Require.isAllValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsNotValid()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()


        requireThrowsException("isNotValid") {
            Require.isNotValid(validObject)
        }

        requireNotThrowsException("isNotValid") {
            Require.isNotValid(notValidObject)
        }
    }

    func testIsAllNotValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        requireThrowsException("isAllNotValid_Array") {
            Require.isAllNotValid([validObject])
        }
        requireThrowsException("isAllNotValid_Array") {
            Require.isAllNotValid([notValidObject, validObject])
        }

        requireNotThrowsException("isAllNotValid_Array") {
            Require.isAllNotValid(array)
        }
        requireNotThrowsException("isAllNotValid_Array") {
            Require.isAllNotValid(nilArray)
        }
        requireNotThrowsException("isAllNotValid_Array") {
            Require.isAllNotValid(emptyArray)
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

        requireThrowsException("isAllNotValid_ArrayOfOptionals") {
            Require.isAllNotValid([validObject])
        }
        requireThrowsException("isAllNotValid_ArrayOfOptionals") {
            Require.isAllNotValid([nilObject])
        }
        requireThrowsException("isAllNotValid_ArrayOfOptionals") {
            Require.isAllNotValid([notValidObject, validObject])
        }

        requireNotThrowsException("isAllNotValid_ArrayOfOptionals") {
            Require.isAllNotValid(array)
        }
        requireNotThrowsException("isAllNotValid_ArrayOfOptionals") {
            Require.isAllNotValid(nilArray)
        }
        requireNotThrowsException("isAllNotValid_ArrayOfOptionals") {
            Require.isAllNotValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsNilOrValid()
    {
        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        requireThrowsException("isNilOrValid") {
            Require.isNilOrValid(notValidObject)
        }

        requireNotThrowsException("isNilOrValid") {
            Require.isNilOrValid(validObject)
        }
        requireNotThrowsException("isNilOrValid") {
            Require.isNilOrValid(nilObject)
        }
    }

    func testIsAllNilOrValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        requireThrowsException("isAllNilOrValid_Array") {
            Require.isAllNilOrValid([notValidObject])
        }
        requireThrowsException("isAllNilOrValid_Array") {
            Require.isAllNilOrValid([validObject, notValidObject])
        }

        requireNotThrowsException("isAllNilOrValid_Array") {
            Require.isAllNilOrValid(array)
        }
        requireNotThrowsException("isAllNilOrValid_Array") {
            Require.isAllNilOrValid(nilArray)
        }
        requireNotThrowsException("isAllNilOrValid_Array") {
            Require.isAllNilOrValid(emptyArray)
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


        requireThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Require.isAllNilOrValid([notValidObject])
        }
        requireThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Require.isAllNilOrValid([validObject, notValidObject])
        }
        requireThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Require.isAllNilOrValid([nilObject, notValidObject])
        }

        requireNotThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Require.isAllNilOrValid(array)
        }
        requireNotThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Require.isAllNilOrValid(nilArray)
        }
        requireNotThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Require.isAllNilOrValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension RequireTests
{
// MARK: - Tests

    func testIsNilOrNotValid()
    {
        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        requireThrowsException("isNilOrNotValid") {
            Require.isNilOrNotValid(validObject)
        }

        requireNotThrowsException("isNilOrNotValid") {
            Require.isNilOrNotValid(nilObject)
        }
        requireNotThrowsException("isNilOrNotValid") {
            Require.isNilOrNotValid(notValidObject)
        }
    }

    func testIsAllNilOrNotValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        requireThrowsException("isAllNilOrNotValid_Array") {
            Require.isAllNilOrNotValid([validObject])
        }
        requireThrowsException("isAllNilOrNotValid_Array") {
            Require.isAllNilOrNotValid([notValidObject, validObject])
        }

        requireNotThrowsException("isAllNilOrNotValid_Array") {
            Require.isAllNilOrNotValid(array)
        }
        requireNotThrowsException("isAllNilOrNotValid_Array") {
            Require.isAllNilOrNotValid(nilArray)
        }
        requireNotThrowsException("isAllNilOrNotValid_Array") {
            Require.isAllNilOrNotValid(emptyArray)
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


        requireThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Require.isAllNilOrNotValid([validObject])
        }
        requireThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Require.isAllNilOrNotValid([nilObject, validObject])
        }
        requireThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Require.isAllNilOrNotValid([notValidObject, validObject])
        }

        requireNotThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Require.isAllNilOrNotValid(array)
        }
        requireNotThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Require.isAllNilOrNotValid(nilArray)
        }
        requireNotThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Require.isAllNilOrNotValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
