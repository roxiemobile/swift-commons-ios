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

class ExpectableTests: XCTestCase
{
// MARK: - Tests

    func testExpectTrue()
    {
        expectThrowsException("expectTrue") {
            Expect.isTrue(1 > 2)
        }

        expectNotThrowsException("expectTrue") {
            Expect.isTrue(2 > 1)
        }
    }

    func testExpectFalse()
    {
        expectThrowsException("expectFalse") {
            Expect.isFalse(2 > 1)
        }

        expectNotThrowsException("expectFalse") {
            Expect.isFalse(1 > 2)
        }
    }

// MARK: - Tests

    func testExpectEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsException("expectEqual") {
            Expect.isEqual(1, 2)
        }
        expectThrowsException("expectEqual") {
            Expect.isEqual(string, nilString)
        }

        expectNotThrowsException("expectEqual") {
            Expect.isEqual(2, 2)
        }
        expectNotThrowsException("expectEqual") {
            Expect.isEqual(string, string)
        }
    }

    func testExpectNotEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsException("expectNotEqual") {
            Expect.isNotEqual(2, 2)
        }
        expectThrowsException("expectNotEqual") {
            Expect.isNotEqual(string, string)
        }

        expectNotThrowsException("expectNotEqual") {
            Expect.isNotEqual(1, 2)
        }
        expectNotThrowsException("expectNotEqual") {
            Expect.isNotEqual(string, nilString)
        }
    }

// MARK: - Tests

    func testExpectNil()
    {
        expectThrowsException("expectNil") {
            Expect.isNil(2)
        }

        expectNotThrowsException("expectNil") {
            Expect.isNil(nil)
        }
    }

    func testExpectNotNil()
    {
        expectThrowsException("expectNotNil") {
            Expect.isNotNil(nil)
        }

        expectNotThrowsException("expectNotNil") {
            Expect.isNotNil(2)
        }
    }

// MARK: - Tests

    func testExpectNilOrEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsException("expectNilOrEmpty") {
            Expect.isNilOrEmpty(string)
        }
        expectThrowsException("expectNilOrEmpty") {
            Expect.isNilOrEmpty(nilString, string)
        }
        expectThrowsException("expectNilOrEmpty") {
            Expect.isNilOrEmpty(emptyString, string)
        }

        expectNotThrowsException("expectNilOrEmpty") {
            Expect.isNilOrEmpty(nilString, emptyString)
        }
    }

    func testExpectNilOrEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [emptyString]


        expectThrowsException("expectNilOrEmpty_Array") {
            Expect.isNilOrEmpty([string])
        }
        expectThrowsException("expectNilOrEmpty_Array") {
            Expect.isNilOrEmpty([emptyString, string])
        }
        expectThrowsException("expectNilOrEmpty_Array") {
            Expect.isNilOrEmpty(nil, array)
        }
        expectThrowsException("expectNilOrEmpty_Array") {
            Expect.isNilOrEmpty(array, [string])
        }

        expectNotThrowsException("expectNilOrEmpty_Array") {
            Expect.isNilOrEmpty(array, [emptyString])
        }
    }

    func testExpectNilOrEmpty_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [nilString, emptyString]


        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            Expect.isNilOrEmpty([optionalString])
        }
        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            Expect.isNilOrEmpty([nilString, string])
        }
        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            Expect.isNilOrEmpty([emptyString, string])
        }
        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            Expect.isNilOrEmpty(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            Expect.isNilOrEmpty(arrayOfOptionals, [emptyString])
        }
    }

    func testExpectNotEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsException("expectNotEmpty") {
            Expect.isNotEmpty(nilString)
        }
        expectThrowsException("expectNotEmpty") {
            Expect.isNotEmpty(emptyString)
        }
        expectThrowsException("expectNotEmpty") {
            Expect.isNotEmpty(string, emptyString)
        }

        expectNotThrowsException("expectNotEmpty") {
            Expect.isNotEmpty(string)
        }
    }

    func testExpectNotEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [string, string]


        expectThrowsException("expectNotEmpty_Array") {
            Expect.isNotEmpty([emptyString])
        }
        expectThrowsException("expectNotEmpty_Array") {
            Expect.isNotEmpty([string, emptyString])
        }
        expectThrowsException("expectNotEmpty_Array") {
            Expect.isNotEmpty(array, nil, [string])
        }

        expectNotThrowsException("expectNotEmpty_Array") {
            Expect.isNotEmpty(array, [string])
        }
    }

    func testExpectNotEmpty_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        expectThrowsException("expectNotEmpty_ArrayOfOptionals") {
            Expect.isNotEmpty([nilString])
        }
        expectThrowsException("expectNotEmpty_ArrayOfOptionals") {
            Expect.isNotEmpty([string, emptyString])
        }
        expectThrowsException("expectNotEmpty_ArrayOfOptionals") {
            Expect.isNotEmpty(arrayOfOptionals, nil, [string])
        }

        expectNotThrowsException("expectNotEmpty_ArrayOfOptionals") {
            Expect.isNotEmpty(arrayOfOptionals, [string])
        }
    }

// MARK: - Tests

    func testExpectNilOrWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        expectThrowsException("expectNilOrWhiteSpace") {
            Expect.isNilOrWhiteSpace(string)
        }
        expectThrowsException("expectNilOrWhiteSpace") {
            Expect.isNilOrWhiteSpace(nilString, string)
        }
        expectThrowsException("expectNilOrWhiteSpace") {
            Expect.isNilOrWhiteSpace(emptyString, string)
        }
        expectThrowsException("expectNilOrWhiteSpace") {
            Expect.isNilOrWhiteSpace(whitespaceString, string)
        }

        expectNotThrowsException("expectNilOrWhiteSpace") {
            Expect.isNilOrWhiteSpace(nilString, emptyString, whitespaceString)
        }
    }

    func testExpectNilOrWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [emptyString, whitespaceString]


        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.isNilOrWhiteSpace([string])
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.isNilOrWhiteSpace([emptyString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.isNilOrWhiteSpace([whitespaceString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.isNilOrWhiteSpace(nil, array)
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.isNilOrWhiteSpace(array, [string])
        }

        expectNotThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.isNilOrWhiteSpace(array, [whitespaceString])
        }
    }

    func testExpectNilOrWhiteSpace_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [nilString, emptyString, whitespaceString]


        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.isNilOrWhiteSpace([optionalString])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.isNilOrWhiteSpace([nilString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.isNilOrWhiteSpace([emptyString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.isNilOrWhiteSpace([whitespaceString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.isNilOrWhiteSpace(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.isNilOrWhiteSpace(arrayOfOptionals, [whitespaceString])
        }
    }

    func testExpectNotWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        expectThrowsException("expectNotWhiteSpace") {
            Expect.isNotWhiteSpace(nilString)
        }
        expectThrowsException("expectNotWhiteSpace") {
            Expect.isNotWhiteSpace(emptyString)
        }
        expectThrowsException("expectNotWhiteSpace") {
            Expect.isNotWhiteSpace(whitespaceString)
        }
        expectThrowsException("expectNotWhiteSpace") {
            Expect.isNotWhiteSpace(string, whitespaceString)
        }

        expectNotThrowsException("expectNotWhiteSpace") {
            Expect.isNotWhiteSpace(string)
        }
    }

    func testExpectNotWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [string, string]


        expectThrowsException("expectNotWhiteSpace_Array") {
            Expect.isNotWhiteSpace([emptyString])
        }
        expectThrowsException("expectNotWhiteSpace_Array") {
            Expect.isNotWhiteSpace([whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_Array") {
            Expect.isNotWhiteSpace([string, whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_Array") {
            Expect.isNotWhiteSpace(nil, array)
        }

        expectNotThrowsException("expectNotWhiteSpace_Array") {
            Expect.isNotWhiteSpace(array, [string])
        }
    }

    func testExpectNotWhiteSpace_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.isNotWhiteSpace([nilString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.isNotWhiteSpace([emptyString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.isNotWhiteSpace([whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.isNotWhiteSpace([string, whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.isNotWhiteSpace(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.isNotWhiteSpace(arrayOfOptionals, [string])
        }
    }

// MARK: - Tests

    func testExpectValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()


        expectThrowsException("expectValid") {
            Expect.isValid(notValidObject)
        }
        expectThrowsException("expectValid") {
            Expect.isValid(validObject, notValidObject)
        }

        expectNotThrowsException("expectValid") {
            Expect.isValid(validObject)
        }
    }

    func testExpectValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject, validObject]


        expectThrowsException("expectValid_Array") {
            Expect.isValid([notValidObject])
        }
        expectThrowsException("expectValid_Array") {
            Expect.isValid([validObject, notValidObject])
        }
        expectThrowsException("expectValid_Array") {
            Expect.isValid(nil, array)
        }

        expectNotThrowsException("expectValid_Array") {
            Expect.isValid(array, [validObject])
        }
    }

    func testExpectValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, optionalValidObject]


        expectThrowsException("expectValid_ArrayOfOptionals") {
            Expect.isValid([optionalNotValidObject])
        }
        expectThrowsException("expectValid_ArrayOfOptionals") {
            Expect.isValid([validObject, nilObject])
        }
        expectThrowsException("expectValid_ArrayOfOptionals") {
            Expect.isValid([validObject, optionalNotValidObject])
        }
        expectThrowsException("expectValid_ArrayOfOptionals") {
            Expect.isValid(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectValid_ArrayOfOptionals") {
            Expect.isValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Tests

    func testExpectNotValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()


        expectThrowsException("expectNotValid") {
            Expect.isNotValid(validObject)
        }

        expectNotThrowsException("expectNotValid") {
            Expect.isNotValid(notValidObject)
        }
    }

    func testExpectNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [notValidObject, notValidObject]


        expectThrowsException("expectNotValid_Array") {
            Expect.isNotValid([validObject])
        }
        expectThrowsException("expectNotValid_Array") {
            Expect.isNotValid([notValidObject, validObject])
        }
        expectThrowsException("expectNotValid_Array") {
            Expect.isNotValid(nil, array)
        }
        expectThrowsException("expectNotValid_Array") {
            Expect.isNotValid(array, [validObject])
        }

        expectNotThrowsException("expectNotValid_Array") {
            Expect.isNotValid([notValidObject])
        }
        expectNotThrowsException("expectNotValid_Array") {
            Expect.isNotValid(array, [notValidObject])
        }
    }

    func testExpectNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [notValidObject, optionalNotValidObject]


        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            Expect.isNotValid([optionalValidObject])
        }
        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            Expect.isNotValid([nilObject])
        }
        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            Expect.isNotValid(nil, arrayOfOptionals)
        }
        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            Expect.isNotValid(arrayOfOptionals, [validObject])
        }

        expectNotThrowsException("expectNotValid_ArrayOfOptionals") {
            Expect.isNotValid([notValidObject, optionalNotValidObject])
        }
    }

// MARK: - Tests

    func testExpectNilOrValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsException("expectNilOrValid") {
            Expect.isNilOrValid(notValidObject)
        }
        expectThrowsException("expectNilOrValid") {
            Expect.isNilOrValid(validObject, notValidObject)
        }
        expectThrowsException("expectNilOrValid") {
            Expect.isNilOrValid(nilObject, notValidObject)
        }

        expectNotThrowsException("expectNilOrValid") {
            Expect.isNilOrValid(validObject, nilObject)
        }
    }

    func testExpectNilOrValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject]


        expectThrowsException("expectNilOrValid_Array") {
            Expect.isNilOrValid([notValidObject])
        }
        expectThrowsException("expectNilOrValid_Array") {
            Expect.isNilOrValid([validObject, notValidObject])
        }
        expectThrowsException("expectNilOrValid_Array") {
            Expect.isNilOrValid(nil, array)
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.isNilOrValid(array, [notValidObject])
        }

        expectNotThrowsException("expectNilOrValid_Array") {
            Expect.isNilOrValid(array, [validObject])
        }
    }

    func testExpectNilOrValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, optionalValidObject, nilObject]


        expectThrowsException("expectNilOrValid_ArrayOfOptionals") {
            Expect.isNilOrValid([optionalNotValidObject])
        }
        expectThrowsException("expectNilOrValid_ArrayOfOptionals") {
            Expect.isNilOrValid([validObject, optionalNotValidObject])
        }
        expectThrowsException("expectNilOrValid_ArrayOfOptionals") {
            Expect.isNilOrValid(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNilOrValid_ArrayOfOptionals") {
            Expect.isNilOrValid([validObject, nilObject])
        }
        expectNotThrowsException("expectNilOrValid_ArrayOfOptionals") {
            Expect.isNilOrValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Tests

    func testExpectNilOrNotValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsException("expectNilOrNotValid") {
            Expect.isNilOrNotValid(validObject)
        }

        expectNotThrowsException("expectNilOrNotValid") {
            Expect.isNilOrNotValid(nilObject, notValidObject)
        }
    }

    func testExpectNilOrNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [notValidObject]


        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.isNilOrNotValid([validObject])
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.isNilOrNotValid([notValidObject, validObject])
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.isNilOrNotValid(nil, array)
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.isNilOrNotValid(array, [validObject])
        }

        expectNotThrowsException("expectNilOrNotValid_Array") {
            Expect.isNilOrNotValid(array, [notValidObject])
        }
    }

    func testExpectNilOrNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let optionalValidObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let optionalNotValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [nilObject, optionalNotValidObject]


        expectThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            Expect.isNilOrNotValid([optionalValidObject])
        }
        expectThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            Expect.isNilOrNotValid(nil, arrayOfOptionals)
        }
        expectThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            Expect.isNilOrNotValid(arrayOfOptionals, [validObject])
        }

        expectNotThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            Expect.isNilOrNotValid(arrayOfOptionals)
        }
    }

// MARK: - Private Methods

    private func expectThrowsException(method: String, line: UInt = #line, block: () -> ())
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

    private func expectNotThrowsException(method: String, line: UInt = #line, block: () -> ())
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
