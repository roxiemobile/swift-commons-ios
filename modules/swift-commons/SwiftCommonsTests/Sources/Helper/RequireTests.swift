// ----------------------------------------------------------------------------
//
//  RequireTests.swift
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

class RequireTests: XCTestCase
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

// MARK: - Tests

    func testIsNilOrEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        requireThrowsException("isNilOrEmpty") {
            Require.isNilOrEmpty(string)
        }

        requireNotThrowsException("isNilOrEmpty") {
            Require.isNilOrEmpty(nilString)
        }
        requireNotThrowsException("isNilOrEmpty") {
            Require.isNilOrEmpty(emptyString)
        }
    }

    func testIsNilOrEmpty_Array()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""

        let array: [String]? = [emptyString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        requireThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty([string])
        }
        requireThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty([nilString, string])
        }
        requireThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty([emptyString, string])
        }
        requireThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty(nilArray)
        }

        requireNotThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty(array)
        }
        requireNotThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty(emptyArray)
        }
    }

    func testIsNilOrEmpty_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [nilString, emptyString]
        let emptyArray = [String?]()


        requireThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty([optionalString])
        }
        requireThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty([nilString, string])
        }
        requireThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty([emptyString, string])
        }

        requireNotThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty(arrayOfOptionals, [emptyString])
        }
        requireNotThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty(emptyArray)
        }
    }

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
    }

    func testIsNotEmpty_Array()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""

        let otherString = "otherValue"
        let array: [String]? = [string, otherString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        requireThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty([nilString])
        }
        requireThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty([string, emptyString])
        }
        requireThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty(nilArray)
        }
        requireThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty(emptyArray)
        }

        requireNotThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty(array)
        }
    }

    func testIsNotEmpty_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let otherString: String? = "otherValue"
        let nilArray: [String?]? = nil
        let arrayOfOptionals: [String?]? = [string, otherString]
        let emptyArray = [String?]()


        requireThrowsException("isNotEmpty_ArrayOfOptionals") {
            Require.isNotEmpty([nilString])
        }
        requireThrowsException("isNotEmpty_ArrayOfOptionals") {
            Require.isNotEmpty([string, emptyString])
        }
        requireThrowsException("isNotEmpty_ArrayOfOptionals") {
            Require.isNotEmpty(arrayOfOptionals, nilArray, [string])
        }
        requireThrowsException("isNotEmpty_ArrayOfOptionals") {
            Require.isNotEmpty(emptyArray)
        }

        requireNotThrowsException("isNotEmpty_ArrayOfOptionals") {
            Require.isNotEmpty(arrayOfOptionals, [string])
        }
    }

// MARK: - Tests

    func testIsNilOrWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        requireThrowsException("isNilOrWhiteSpace") {
            Require.isNilOrWhiteSpace(string)
        }

        requireNotThrowsException("isNilOrWhiteSpace") {
            Require.isNilOrWhiteSpace(nilString)
        }
        requireNotThrowsException("isNilOrWhiteSpace") {
            Require.isNilOrWhiteSpace(emptyString)
        }
        requireNotThrowsException("isNilOrWhiteSpace") {
            Require.isNilOrWhiteSpace(whitespaceString)
        }
    }

    func testIsNilOrWhiteSpace_Array()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [emptyString, whitespaceString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace([string])
        }
        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace([nilString, string])
        }
        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace([emptyString, string])
        }
        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace([whitespaceString, string])
        }
        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace(nilArray)
        }

        requireNotThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace(array)
        }
        requireNotThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace(emptyArray)
        }
    }

    func testIsNilOrWhiteSpace_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let otherString: String? = "otherValue"
        let arrayOfOptionals: [String?]? = [nilString, emptyString, whitespaceString]
        let emptyArray = [String?]()


        requireThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            Require.isNilOrWhiteSpace([otherString])
        }
        requireThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            Require.isNilOrWhiteSpace([nilString, string])
        }
        requireThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            Require.isNilOrWhiteSpace([emptyString, string])
        }
        requireThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            Require.isNilOrWhiteSpace([whitespaceString, string])
        }

        requireNotThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            Require.isNilOrWhiteSpace(arrayOfOptionals)
        }
        requireNotThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            Require.isNilOrWhiteSpace(emptyArray)
        }
    }

    func testIsNotWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        requireThrowsException("isNotWhiteSpace") {
            Require.isNotBlank(nilString)
        }
        requireThrowsException("isNotWhiteSpace") {
            Require.isNotBlank(emptyString)
        }
        requireThrowsException("isNotWhiteSpace") {
            Require.isNotBlank(whitespaceString)
        }

        requireNotThrowsException("isNotWhiteSpace") {
            Require.isNotBlank(string)
        }
    }

    func testIsNotWhiteSpace_Array()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let otherString = "otherValue"
        let array: [String]? = [string, otherString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotBlank([nilString])
        }
        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotBlank([emptyString])
        }
        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotBlank([whitespaceString])
        }
        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotBlank([string, whitespaceString])
        }
        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotBlank(nilArray)
        }
        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotBlank(emptyArray)
        }

        requireNotThrowsException("isNotWhiteSpace_Array") {
            Require.isNotBlank(array)
        }
    }

    func testIsNotWhiteSpace_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let otherString: String? = "otherValue"
        let arrayOfOptionals: [String?]? = [string, otherString]
        let nilArray: [String?]? = nil


        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotBlank([nilString])
        }
        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotBlank([emptyString])
        }
        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotBlank([whitespaceString])
        }
        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotBlank([string, whitespaceString])
        }
        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotBlank(nilArray, arrayOfOptionals)
        }

        requireNotThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotBlank(arrayOfOptionals)
        }
    }

// MARK: - Tests

    func testIsValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()


        requireThrowsException("isValid") {
            Require.isValid(notValidObject)
        }

        requireNotThrowsException("isValid") {
            Require.isValid(validObject)
        }
    }

    func testIsValid_Array()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        requireThrowsException("isValid_Array") {
            Require.isValid([notValidObject])
        }
        requireThrowsException("isValid_Array") {
            Require.isValid([validObject, nilObject])
        }
        requireThrowsException("isValid_Array") {
            Require.isValid([validObject, notValidObject])
        }
        requireThrowsException("isValid_Array") {
            Require.isValid(nilArray)
        }

        requireNotThrowsException("isValid_Array") {
            Require.isValid(array)
        }
        requireNotThrowsException("isValid_Array") {
            Require.isValid(emptyArray)
        }
    }

    func testIsValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, optionalValidObject]
        let emptyArray = [Validatable?]()


        requireThrowsException("isValid_ArrayOfOptionals") {
            Require.isValid([optionalNotValidObject])
        }
        requireThrowsException("isValid_ArrayOfOptionals") {
            Require.isValid([validObject, nilObject])
        }
        requireThrowsException("isValid_ArrayOfOptionals") {
            Require.isValid([validObject, optionalNotValidObject])
        }
        requireThrowsException("isValid_ArrayOfOptionals") {
            Require.isValid([nilObject], arrayOfOptionals)
        }

        requireNotThrowsException("isValid_ArrayOfOptionals") {
            Require.isValid(arrayOfOptionals, [validObject])
        }
        requireNotThrowsException("isValid_ArrayOfOptionals") {
            Require.isValid(emptyArray)
        }
    }

// MARK: - Tests

    func testIsNotValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()


        requireThrowsException("isNotValid") {
            Require.isNotValid(validObject)
        }

        requireNotThrowsException("isNotValid") {
            Require.isNotValid(notValidObject)
        }
    }

    func testIsNotValid_Array()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        requireThrowsException("isNotValid_Array") {
            Require.isNotValid([validObject])
        }
        requireThrowsException("isNotValid_Array") {
            Require.isNotValid([nilObject])
        }
        requireThrowsException("isNotValid_Array") {
            Require.isNotValid(nilArray)
        }
        requireThrowsException("isNotValid_Array") {
            Require.isNotValid(emptyArray)
        }

        requireNotThrowsException("isNotValid_Array") {
            Require.isNotValid(array)
        }
    }

    func testIsNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [notValidObject, optionalNotValidObject]
        let emptyArray = [Validatable?]()

        requireThrowsException("isNotValid_ArrayOfOptionals") {
            Require.isNotValid([optionalValidObject])
        }
        requireThrowsException("isNotValid_ArrayOfOptionals") {
            Require.isNotValid([nilObject], arrayOfOptionals)
        }
        requireThrowsException("isNotValid_ArrayOfOptionals") {
            Require.isNotValid(arrayOfOptionals, [validObject])
        }
        requireThrowsException("isNotValid_ArrayOfOptionals") {
            Require.isNotValid(emptyArray)
        }

        requireNotThrowsException("isNotValid_ArrayOfOptionals") {
            Require.isNotValid([notValidObject, optionalNotValidObject])
        }
    }

// MARK: - Tests

    func testIsNilOrValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


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

    func testIsNilOrValid_Array()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()

        let array: [Validatable] = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        requireThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid([notValidObject])
        }
        requireThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid([validObject, notValidObject])
        }
        requireThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid(nilArray)
        }

        requireNotThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid(array)
        }
        requireNotThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid(emptyArray)
        }
        requireNotThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid([nilObject])
        }
    }

    func testIsNilOrValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, optionalValidObject, nilObject]
        let emptyArray = [Validatable?]()
        

        requireThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid([optionalNotValidObject])
        }
        requireThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid([validObject, optionalNotValidObject])
        }

        requireNotThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid([validObject, nilObject])
        }
        requireNotThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid(arrayOfOptionals, [validObject])
        }
        requireNotThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid(emptyArray)
        }
    }

// MARK: - Tests

    func testIsNilOrNotValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


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

    func testIsNilOrNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        requireThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrNotValid([validObject])
        }
        requireThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrNotValid(nilArray)
        }
        requireThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrNotValid(emptyArray)
        }

        requireNotThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrNotValid(array)
        }
    }

    func testIsNilOrNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [nilObject, optionalNotValidObject]
        let emptyArray = [Validatable?]()


        requireThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            Require.isNilOrNotValid([optionalValidObject])
        }
        requireThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            Require.isNilOrNotValid([nilObject], [validObject])
        }
        requireThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            Require.isNilOrNotValid(emptyArray)
        }

        requireNotThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            Require.isNilOrNotValid(arrayOfOptionals)
        }
    }

// MARK: - Private Methods

    private func requireThrowsException(method: String, line: UInt = #line, block: () -> ())
    {
        var cause: NSException? = nil
        Try {
            block()
        }.Catch { ex in
            cause = ex
        }

        if let ex = cause
        {
            if ex is RequirementException {
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

    private func requireNotThrowsException(method: String, line: UInt = #line, block: () -> ())
    {
        var cause: NSException? = nil
        Try {
            block()
        }.Catch { ex in
            cause = ex
        }

        if let ex = cause
        {
            if ex is RequirementException {
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
