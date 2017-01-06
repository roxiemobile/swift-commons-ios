// ----------------------------------------------------------------------------
//
//  ExpectTests.swift
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

class ExpectTests: XCTestCase
{
// MARK: - Tests

    func testExpectTrue()
    {
        expectThrowsException("expectTrue") {
            Expect.expectTrue(1 > 2)
        }

        expectNotThrowsException("expectTrue") {
            Expect.expectTrue(2 > 1)
        }
    }

    func testExpectFalse()
    {
        expectThrowsException("expectFalse") {
            Expect.expectFalse(2 > 1)
        }

        expectNotThrowsException("expectFalse") {
            Expect.expectFalse(1 > 2)
        }
    }

// MARK: - Tests

    func testExpectEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsException("expectEqual") {
            Expect.expectEqual(1, 2)
        }
        expectThrowsException("expectEqual") {
            Expect.expectEqual(string, nilString)
        }

        expectNotThrowsException("expectEqual") {
            Expect.expectEqual(2, 2)
        }
        expectNotThrowsException("expectEqual") {
            Expect.expectEqual(string, string)
        }
    }

    func testExpectNotEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsException("expectNotEqual") {
            Expect.expectNotEqual(2, 2)
        }
        expectThrowsException("expectNotEqual") {
            Expect.expectNotEqual(string, string)
        }

        expectNotThrowsException("expectNotEqual") {
            Expect.expectNotEqual(1, 2)
        }
        expectNotThrowsException("expectNotEqual") {
            Expect.expectNotEqual(string, nilString)
        }
    }

// MARK: - Tests

    func testExpectNil()
    {
        expectThrowsException("expectNil") {
            Expect.expectNil(2)
        }

        expectNotThrowsException("expectNil") {
            Expect.expectNil(nil)
        }
    }

    func testExpectNotNil()
    {
        expectThrowsException("expectNotNil") {
            Expect.expectNotNil(nil)
        }

        expectNotThrowsException("expectNotNil") {
            Expect.expectNotNil(2)
        }
    }

// MARK: - Tests

    func testExpectNilOrEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsException("expectNilOrEmpty") {
            Expect.expectNilOrEmpty(string)
        }
        expectThrowsException("expectNilOrEmpty") {
            Expect.expectNilOrEmpty(nilString, string)
        }
        expectThrowsException("expectNilOrEmpty") {
            Expect.expectNilOrEmpty(emptyString, string)
        }

        expectNotThrowsException("expectNilOrEmpty") {
            Expect.expectNilOrEmpty(nilString, emptyString)
        }
    }

    func testExpectNilOrEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [emptyString]


        expectThrowsException("expectNilOrEmpty_Array") {
            Expect.expectNilOrEmpty([string])
        }
        expectThrowsException("expectNilOrEmpty_Array") {
            Expect.expectNilOrEmpty([emptyString, string])
        }
        expectThrowsException("expectNilOrEmpty_Array") {
            Expect.expectNilOrEmpty(nil, array)
        }
        expectThrowsException("expectNilOrEmpty_Array") {
            Expect.expectNilOrEmpty(array, [string])
        }

        expectNotThrowsException("expectNilOrEmpty_Array") {
            Expect.expectNilOrEmpty(array, [emptyString])
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
            Expect.expectNilOrEmpty([optionalString])
        }
        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            Expect.expectNilOrEmpty([nilString, string])
        }
        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            Expect.expectNilOrEmpty([emptyString, string])
        }
        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            Expect.expectNilOrEmpty(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            Expect.expectNilOrEmpty(arrayOfOptionals, [emptyString])
        }
    }

    func testExpectNotEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsException("expectNotEmpty") {
            Expect.expectNotEmpty(nilString)
        }
        expectThrowsException("expectNotEmpty") {
            Expect.expectNotEmpty(emptyString)
        }
        expectThrowsException("expectNotEmpty") {
            Expect.expectNotEmpty(string, emptyString)
        }

        expectNotThrowsException("expectNotEmpty") {
            Expect.expectNotEmpty(string)
        }
    }

    func testExpectNotEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [string, string]


        expectThrowsException("expectNotEmpty_Array") {
            Expect.expectNotEmpty([emptyString])
        }
        expectThrowsException("expectNotEmpty_Array") {
            Expect.expectNotEmpty([string, emptyString])
        }
        expectThrowsException("expectNotEmpty_Array") {
            Expect.expectNotEmpty(array, nil, [string])
        }

        expectNotThrowsException("expectNotEmpty_Array") {
            Expect.expectNotEmpty(array, [string])
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
            Expect.expectNotEmpty([nilString])
        }
        expectThrowsException("expectNotEmpty_ArrayOfOptionals") {
            Expect.expectNotEmpty([string, emptyString])
        }
        expectThrowsException("expectNotEmpty_ArrayOfOptionals") {
            Expect.expectNotEmpty(arrayOfOptionals, nil, [string])
        }

        expectNotThrowsException("expectNotEmpty_ArrayOfOptionals") {
            Expect.expectNotEmpty(arrayOfOptionals, [string])
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
            Expect.expectNilOrWhiteSpace(string)
        }
        expectThrowsException("expectNilOrWhiteSpace") {
            Expect.expectNilOrWhiteSpace(nilString, string)
        }
        expectThrowsException("expectNilOrWhiteSpace") {
            Expect.expectNilOrWhiteSpace(emptyString, string)
        }
        expectThrowsException("expectNilOrWhiteSpace") {
            Expect.expectNilOrWhiteSpace(whitespaceString, string)
        }

        expectNotThrowsException("expectNilOrWhiteSpace") {
            Expect.expectNilOrWhiteSpace(nilString, emptyString, whitespaceString)
        }
    }

    func testExpectNilOrWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [emptyString, whitespaceString]


        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.expectNilOrWhiteSpace([string])
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.expectNilOrWhiteSpace([emptyString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.expectNilOrWhiteSpace([whitespaceString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.expectNilOrWhiteSpace(nil, array)
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.expectNilOrWhiteSpace(array, [string])
        }

        expectNotThrowsException("expectNilOrWhiteSpace_Array") {
            Expect.expectNilOrWhiteSpace(array, [whitespaceString])
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
            Expect.expectNilOrWhiteSpace([optionalString])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.expectNilOrWhiteSpace([nilString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.expectNilOrWhiteSpace([emptyString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.expectNilOrWhiteSpace([whitespaceString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.expectNilOrWhiteSpace(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            Expect.expectNilOrWhiteSpace(arrayOfOptionals, [whitespaceString])
        }
    }

    func testExpectNotWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        expectThrowsException("expectNotWhiteSpace") {
            Expect.expectNotWhiteSpace(nilString)
        }
        expectThrowsException("expectNotWhiteSpace") {
            Expect.expectNotWhiteSpace(emptyString)
        }
        expectThrowsException("expectNotWhiteSpace") {
            Expect.expectNotWhiteSpace(whitespaceString)
        }
        expectThrowsException("expectNotWhiteSpace") {
            Expect.expectNotWhiteSpace(string, whitespaceString)
        }

        expectNotThrowsException("expectNotWhiteSpace") {
            Expect.expectNotWhiteSpace(string)
        }
    }

    func testExpectNotWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [string, string]


        expectThrowsException("expectNotWhiteSpace_Array") {
            Expect.expectNotWhiteSpace([emptyString])
        }
        expectThrowsException("expectNotWhiteSpace_Array") {
            Expect.expectNotWhiteSpace([whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_Array") {
            Expect.expectNotWhiteSpace([string, whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_Array") {
            Expect.expectNotWhiteSpace(nil, array)
        }

        expectNotThrowsException("expectNotWhiteSpace_Array") {
            Expect.expectNotWhiteSpace(array, [string])
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
            Expect.expectNotWhiteSpace([nilString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.expectNotWhiteSpace([emptyString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.expectNotWhiteSpace([whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.expectNotWhiteSpace([string, whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.expectNotWhiteSpace(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            Expect.expectNotWhiteSpace(arrayOfOptionals, [string])
        }
    }

// MARK: - Tests

    func testExpectValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()


        expectThrowsException("expectValid") {
            Expect.expectValid(notValidObject)
        }
        expectThrowsException("expectValid") {
            Expect.expectValid(validObject, notValidObject)
        }

        expectNotThrowsException("expectValid") {
            Expect.expectValid(validObject)
        }
    }

    func testExpectValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject, validObject]


        expectThrowsException("expectValid_Array") {
            Expect.expectValid([notValidObject])
        }
        expectThrowsException("expectValid_Array") {
            Expect.expectValid([validObject, notValidObject])
        }
        expectThrowsException("expectValid_Array") {
            Expect.expectValid(nil, array)
        }

        expectNotThrowsException("expectValid_Array") {
            Expect.expectValid(array, [validObject])
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
            Expect.expectValid([optionalNotValidObject])
        }
        expectThrowsException("expectValid_ArrayOfOptionals") {
            Expect.expectValid([validObject, nilObject])
        }
        expectThrowsException("expectValid_ArrayOfOptionals") {
            Expect.expectValid([validObject, optionalNotValidObject])
        }
        expectThrowsException("expectValid_ArrayOfOptionals") {
            Expect.expectValid(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectValid_ArrayOfOptionals") {
            Expect.expectValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Tests

    func testExpectNotValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()


        expectThrowsException("expectNotValid") {
            Expect.expectNotValid(validObject)
        }

        expectNotThrowsException("expectNotValid") {
            Expect.expectNotValid(notValidObject)
        }
    }

    func testExpectNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [notValidObject, notValidObject]


        expectThrowsException("expectNotValid_Array") {
            Expect.expectNotValid([validObject])
        }
        expectThrowsException("expectNotValid_Array") {
            Expect.expectNotValid([notValidObject, validObject])
        }
        expectThrowsException("expectNotValid_Array") {
            Expect.expectNotValid(nil, array)
        }
        expectThrowsException("expectNotValid_Array") {
            Expect.expectNotValid(array, [validObject])
        }

        expectNotThrowsException("expectNotValid_Array") {
            Expect.expectNotValid([notValidObject])
        }
        expectNotThrowsException("expectNotValid_Array") {
            Expect.expectNotValid(array, [notValidObject])
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
            Expect.expectNotValid([optionalValidObject])
        }
        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            Expect.expectNotValid([nilObject])
        }
        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            Expect.expectNotValid(nil, arrayOfOptionals)
        }
        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            Expect.expectNotValid(arrayOfOptionals, [validObject])
        }

        expectNotThrowsException("expectNotValid_ArrayOfOptionals") {
            Expect.expectNotValid([notValidObject, optionalNotValidObject])
        }
    }

// MARK: - Tests

    func testExpectNilOrValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsException("expectNilOrValid") {
            Expect.expectNilOrValid(notValidObject)
        }
        expectThrowsException("expectNilOrValid") {
            Expect.expectNilOrValid(validObject, notValidObject)
        }
        expectThrowsException("expectNilOrValid") {
            Expect.expectNilOrValid(nilObject, notValidObject)
        }

        expectNotThrowsException("expectNilOrValid") {
            Expect.expectNilOrValid(validObject, nilObject)
        }
    }

    func testExpectNilOrValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject]


        expectThrowsException("expectNilOrValid_Array") {
            Expect.expectNilOrValid([notValidObject])
        }
        expectThrowsException("expectNilOrValid_Array") {
            Expect.expectNilOrValid([validObject, notValidObject])
        }
        expectThrowsException("expectNilOrValid_Array") {
            Expect.expectNilOrValid(nil, array)
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.expectNilOrValid(array, [notValidObject])
        }

        expectNotThrowsException("expectNilOrValid_Array") {
            Expect.expectNilOrValid(array, [validObject])
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
            Expect.expectNilOrValid([optionalNotValidObject])
        }
        expectThrowsException("expectNilOrValid_ArrayOfOptionals") {
            Expect.expectNilOrValid([validObject, optionalNotValidObject])
        }
        expectThrowsException("expectNilOrValid_ArrayOfOptionals") {
            Expect.expectNilOrValid(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNilOrValid_ArrayOfOptionals") {
            Expect.expectNilOrValid([validObject, nilObject])
        }
        expectNotThrowsException("expectNilOrValid_ArrayOfOptionals") {
            Expect.expectNilOrValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Tests

    func testExpectNilOrNotValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsException("expectNilOrNotValid") {
            Expect.expectNilOrNotValid(validObject)
        }

        expectNotThrowsException("expectNilOrNotValid") {
            Expect.expectNilOrNotValid(nilObject, notValidObject)
        }
    }

    func testExpectNilOrNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [notValidObject]


        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.expectNilOrNotValid([validObject])
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.expectNilOrNotValid([notValidObject, validObject])
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.expectNilOrNotValid(nil, array)
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            Expect.expectNilOrNotValid(array, [validObject])
        }

        expectNotThrowsException("expectNilOrNotValid_Array") {
            Expect.expectNilOrNotValid(array, [notValidObject])
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
            Expect.expectNilOrNotValid([optionalValidObject])
        }
        expectThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            Expect.expectNilOrNotValid(nil, arrayOfOptionals)
        }
        expectThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            Expect.expectNilOrNotValid(arrayOfOptionals, [validObject])
        }

        expectNotThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            Expect.expectNilOrNotValid(arrayOfOptionals)
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
