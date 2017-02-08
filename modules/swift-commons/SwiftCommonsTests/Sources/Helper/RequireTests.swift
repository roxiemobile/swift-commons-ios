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
        requireThrowsException("isNilOrEmpty") {
            Require.isNilOrEmpty(nilString, string)
        }
        requireThrowsException("isNilOrEmpty") {
            Require.isNilOrEmpty(emptyString, string)
        }

        requireNotThrowsException("isNilOrEmpty") {
            Require.isNilOrEmpty(nilString, emptyString)
        }
    }

    func testIsNilOrEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [emptyString]


        requireThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty([string])
        }
        requireThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty([emptyString, string])
        }
        requireThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty(nil, array)
        }
        requireThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty(array, [string])
        }

        requireNotThrowsException("isNilOrEmpty_Array") {
            Require.isNilOrEmpty(array, [emptyString])
        }
    }

    func testIsNilOrEmpty_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [nilString, emptyString]


        requireThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty([optionalString])
        }
        requireThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty([nilString, string])
        }
        requireThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty([emptyString, string])
        }
        requireThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty(nil, arrayOfOptionals)
        }

        requireNotThrowsException("isNilOrEmpty_ArrayOfOptionals") {
            Require.isNilOrEmpty(arrayOfOptionals, [emptyString])
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
        requireThrowsException("isNotEmpty") {
            Require.isNotEmpty(string, emptyString)
        }

        requireNotThrowsException("isNotEmpty") {
            Require.isNotEmpty(string)
        }
    }

    func testIsNotEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [string, string]


        requireThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty([emptyString])
        }
        requireThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty([string, emptyString])
        }
        requireThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty(array, nil, [string])
        }

        requireNotThrowsException("isNotEmpty_Array") {
            Require.isNotEmpty(array, [string])
        }
    }

    func testIsNotEmpty_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        requireThrowsException("isNotEmpty_ArrayOfOptionals") {
            Require.isNotEmpty([nilString])
        }
        requireThrowsException("isNotEmpty_ArrayOfOptionals") {
            Require.isNotEmpty([string, emptyString])
        }
        requireThrowsException("isNotEmpty_ArrayOfOptionals") {
            Require.isNotEmpty(arrayOfOptionals, nil, [string])
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
        requireThrowsException("isNilOrWhiteSpace") {
            Require.isNilOrWhiteSpace(nilString, string)
        }
        requireThrowsException("isNilOrWhiteSpace") {
            Require.isNilOrWhiteSpace(emptyString, string)
        }
        requireThrowsException("isNilOrWhiteSpace") {
            Require.isNilOrWhiteSpace(whitespaceString, string)
        }

        requireNotThrowsException("isNilOrWhiteSpace") {
            Require.isNilOrWhiteSpace(nilString, emptyString, whitespaceString)
        }
    }

    func testIsNilOrWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [emptyString, whitespaceString]


        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace([string])
        }
        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace([emptyString, string])
        }
        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace([whitespaceString, string])
        }
        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace(nil, array)
        }
        requireThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace(array, [string])
        }

        requireNotThrowsException("isNilOrWhiteSpace_Array") {
            Require.isNilOrWhiteSpace(array, [whitespaceString])
        }
    }

    func testIsNilOrWhiteSpace_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [nilString, emptyString, whitespaceString]


        requireThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            Require.isNilOrWhiteSpace([optionalString])
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
        requireThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            Require.isNilOrWhiteSpace(nil, arrayOfOptionals)
        }

        requireNotThrowsException("isNilOrWhiteSpace_ArrayOfOptionals") {
            Require.isNilOrWhiteSpace(arrayOfOptionals, [whitespaceString])
        }
    }

    func testIsNotWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        requireThrowsException("isNotWhiteSpace") {
            Require.isNotWhiteSpace(nilString)
        }
        requireThrowsException("isNotWhiteSpace") {
            Require.isNotWhiteSpace(emptyString)
        }
        requireThrowsException("isNotWhiteSpace") {
            Require.isNotWhiteSpace(whitespaceString)
        }
        requireThrowsException("isNotWhiteSpace") {
            Require.isNotWhiteSpace(string, whitespaceString)
        }

        requireNotThrowsException("isNotWhiteSpace") {
            Require.isNotWhiteSpace(string)
        }
    }

    func testIsNotWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [string, string]


        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotWhiteSpace([emptyString])
        }
        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotWhiteSpace([whitespaceString])
        }
        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotWhiteSpace([string, whitespaceString])
        }
        requireThrowsException("isNotWhiteSpace_Array") {
            Require.isNotWhiteSpace(nil, array)
        }

        requireNotThrowsException("isNotWhiteSpace_Array") {
            Require.isNotWhiteSpace(array, [string])
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


        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotWhiteSpace([nilString])
        }
        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotWhiteSpace([emptyString])
        }
        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotWhiteSpace([whitespaceString])
        }
        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotWhiteSpace([string, whitespaceString])
        }
        requireThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotWhiteSpace(nil, arrayOfOptionals)
        }

        requireNotThrowsException("isNotWhiteSpace_ArrayOfOptionals") {
            Require.isNotWhiteSpace(arrayOfOptionals, [string])
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
        requireThrowsException("isValid") {
            Require.isValid(validObject, notValidObject)
        }

        requireNotThrowsException("isValid") {
            Require.isValid(validObject)
        }
    }

    func testIsValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject, validObject]


        requireThrowsException("isValid_Array") {
            Require.isValid([notValidObject])
        }
        requireThrowsException("isValid_Array") {
            Require.isValid([validObject, notValidObject])
        }
        requireThrowsException("isValid_Array") {
            Require.isValid(nil, array)
        }

        requireNotThrowsException("isValid_Array") {
            Require.isValid(array, [validObject])
        }
    }

    func testIsValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, optionalValidObject]


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
            Require.isValid(nil, arrayOfOptionals)
        }

        requireNotThrowsException("isValid_ArrayOfOptionals") {
            Require.isValid(arrayOfOptionals, [validObject])
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
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [notValidObject, notValidObject]


        requireThrowsException("isNotValid_Array") {
            Require.isNotValid([validObject])
        }
        requireThrowsException("isNotValid_Array") {
            Require.isNotValid([notValidObject, validObject])
        }
        requireThrowsException("isNotValid_Array") {
            Require.isNotValid(nil, array)
        }
        requireThrowsException("isNotValid_Array") {
            Require.isNotValid(array, [validObject])
        }

        requireNotThrowsException("isNotValid_Array") {
            Require.isNotValid([notValidObject])
        }
        requireNotThrowsException("isNotValid_Array") {
            Require.isNotValid(array, [notValidObject])
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


        requireThrowsException("isNotValid_ArrayOfOptionals") {
            Require.isNotValid([optionalValidObject])
        }
        requireThrowsException("isNotValid_ArrayOfOptionals") {
            Require.isNotValid([nilObject])
        }
        requireThrowsException("isNotValid_ArrayOfOptionals") {
            Require.isNotValid(nil, arrayOfOptionals)
        }
        requireThrowsException("isNotValid_ArrayOfOptionals") {
            Require.isNotValid(arrayOfOptionals, [validObject])
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
        requireThrowsException("isNilOrValid") {
            Require.isNilOrValid(validObject, notValidObject)
        }
        requireThrowsException("isNilOrValid") {
            Require.isNilOrValid(nilObject, notValidObject)
        }

        requireNotThrowsException("isNilOrValid") {
            Require.isNilOrValid(validObject, nilObject)
        }
    }

    func testIsNilOrValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject]


        requireThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid([notValidObject])
        }
        requireThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid([validObject, notValidObject])
        }
        requireThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid(nil, array)
        }
        requireThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrValid(array, [notValidObject])
        }

        requireNotThrowsException("isNilOrValid_Array") {
            Require.isNilOrValid(array, [validObject])
        }
    }

    func testIsNilOrValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, optionalValidObject, nilObject]


        requireThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid([optionalNotValidObject])
        }
        requireThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid([validObject, optionalNotValidObject])
        }
        requireThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid(nil, arrayOfOptionals)
        }

        requireNotThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid([validObject, nilObject])
        }
        requireNotThrowsException("isNilOrValid_ArrayOfOptionals") {
            Require.isNilOrValid(arrayOfOptionals, [validObject])
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
            Require.isNilOrNotValid(nilObject, notValidObject)
        }
    }

    func testIsNilOrNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [notValidObject]


        requireThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrNotValid([validObject])
        }
        requireThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrNotValid([notValidObject, validObject])
        }
        requireThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrNotValid(nil, array)
        }
        requireThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrNotValid(array, [validObject])
        }

        requireNotThrowsException("isNilOrNotValid_Array") {
            Require.isNilOrNotValid(array, [notValidObject])
        }
    }

    func testIsNilOrNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [nilObject, optionalNotValidObject]


        requireThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            Require.isNilOrNotValid([optionalValidObject])
        }
        requireThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            Require.isNilOrNotValid(nil, arrayOfOptionals)
        }
        requireThrowsException("isNilOrNotValid_ArrayOfOptionals") {
            Require.isNilOrNotValid(arrayOfOptionals, [validObject])
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
            if ex is FatalErrorException {
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
            if ex is FatalErrorException {
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
