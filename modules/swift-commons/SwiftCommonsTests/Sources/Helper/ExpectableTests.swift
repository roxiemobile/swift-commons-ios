// ----------------------------------------------------------------------------
//
//  ExpectableTests.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons
import UIKit
import XCTest

// ----------------------------------------------------------------------------

class ExpectableTests: XCTestCase, Expectable
{
// MARK: - Tests

    func testExpectTrue()
    {
        expectThrowsException("expectTrue") {
            self.expectTrue(1 > 2)
        }

        expectNotThrowsException("expectTrue") {
            self.expectTrue(2 > 1)
        }
    }

    func testExpectFalse()
    {
        expectThrowsException("expectFalse") {
            self.expectFalse(2 > 1)
        }

        expectNotThrowsException("expectFalse") {
            self.expectFalse(1 > 2)
        }
    }

// MARK: - Tests

    func testExpectEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsException("expectEqual") {
            self.expectEqual(1, 2)
        }
        expectThrowsException("expectEqual") {
            self.expectEqual(string, nilString)
        }

        expectNotThrowsException("expectEqual") {
            self.expectEqual(2, 2)
        }
        expectNotThrowsException("expectEqual") {
            self.expectEqual(string, string)
        }
    }

    func testExpectNotEqual()
    {
        let string = "value"
        let nilString: String? = nil


        expectThrowsException("expectNotEqual") {
            self.expectNotEqual(2, 2)
        }
        expectThrowsException("expectNotEqual") {
            self.expectNotEqual(string, string)
        }

        expectNotThrowsException("expectNotEqual") {
            self.expectNotEqual(1, 2)
        }
        expectNotThrowsException("expectNotEqual") {
            self.expectNotEqual(string, nilString)
        }
    }

// MARK: - Tests

    func testExpectNil()
    {
        expectThrowsException("expectNil") {
            self.expectNil(2)
        }

        expectNotThrowsException("expectNil") {
            self.expectNil(nil)
        }
    }

    func testExpectNotNil()
    {
        expectThrowsException("expectNotNil") {
            self.expectNotNil(nil)
        }

        expectNotThrowsException("expectNotNil") {
            self.expectNotNil(2)
        }
    }

// MARK: - Tests

    func testExpectNilOrEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsException("expectNilOrEmpty") {
            self.expectNilOrEmpty(string)
        }
        expectThrowsException("expectNilOrEmpty") {
            self.expectNilOrEmpty(nilString, string)
        }
        expectThrowsException("expectNilOrEmpty") {
            self.expectNilOrEmpty(emptyString, string)
        }

        expectNotThrowsException("expectNilOrEmpty") {
            self.expectNilOrEmpty(nilString, emptyString)
        }
    }

    func testExpectNilOrEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [emptyString]


        expectThrowsException("expectNilOrEmpty_Array") {
            self.expectNilOrEmpty([string])
        }
        expectThrowsException("expectNilOrEmpty_Array") {
            self.expectNilOrEmpty([emptyString, string])
        }
        expectThrowsException("expectNilOrEmpty_Array") {
            self.expectNilOrEmpty(nil, array)
        }
        expectThrowsException("expectNilOrEmpty_Array") {
            self.expectNilOrEmpty(array, [string])
        }

        expectNotThrowsException("expectNilOrEmpty_Array") {
            self.expectNilOrEmpty(array, [emptyString])
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
            self.expectNilOrEmpty([optionalString])
        }
        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            self.expectNilOrEmpty([nilString, string])
        }
        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            self.expectNilOrEmpty([emptyString, string])
        }
        expectThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            self.expectNilOrEmpty(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNilOrEmpty_ArrayOfOptionals") {
            self.expectNilOrEmpty(arrayOfOptionals, [emptyString])
        }
    }

    func testExpectNotEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsException("expectNotEmpty") {
            self.expectNotEmpty(nilString)
        }
        expectThrowsException("expectNotEmpty") {
            self.expectNotEmpty(emptyString)
        }
        expectThrowsException("expectNotEmpty") {
            self.expectNotEmpty(string, emptyString)
        }

        expectNotThrowsException("expectNotEmpty") {
            self.expectNotEmpty(string)
        }
    }

    func testExpectNotEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [string, string]


        expectThrowsException("expectNotEmpty_Array") {
            self.expectNotEmpty([emptyString])
        }
        expectThrowsException("expectNotEmpty_Array") {
            self.expectNotEmpty([string, emptyString])
        }
        expectThrowsException("expectNotEmpty_Array") {
            self.expectNotEmpty(array, nil, [string])
        }

        expectNotThrowsException("expectNotEmpty_Array") {
            self.expectNotEmpty(array, [string])
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
            self.expectNotEmpty([nilString])
        }
        expectThrowsException("expectNotEmpty_ArrayOfOptionals") {
            self.expectNotEmpty([string, emptyString])
        }
        expectThrowsException("expectNotEmpty_ArrayOfOptionals") {
            self.expectNotEmpty(arrayOfOptionals, nil, [string])
        }

        expectNotThrowsException("expectNotEmpty_ArrayOfOptionals") {
            self.expectNotEmpty(arrayOfOptionals, [string])
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
            self.expectNilOrWhiteSpace(string)
        }
        expectThrowsException("expectNilOrWhiteSpace") {
            self.expectNilOrWhiteSpace(nilString, string)
        }
        expectThrowsException("expectNilOrWhiteSpace") {
            self.expectNilOrWhiteSpace(emptyString, string)
        }
        expectThrowsException("expectNilOrWhiteSpace") {
            self.expectNilOrWhiteSpace(whitespaceString, string)
        }

        expectNotThrowsException("expectNilOrWhiteSpace") {
            self.expectNilOrWhiteSpace(nilString, emptyString, whitespaceString)
        }
    }

    func testExpectNilOrWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [emptyString, whitespaceString]


        expectThrowsException("expectNilOrWhiteSpace_Array") {
            self.expectNilOrWhiteSpace([string])
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            self.expectNilOrWhiteSpace([emptyString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            self.expectNilOrWhiteSpace([whitespaceString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            self.expectNilOrWhiteSpace(nil, array)
        }
        expectThrowsException("expectNilOrWhiteSpace_Array") {
            self.expectNilOrWhiteSpace(array, [string])
        }

        expectNotThrowsException("expectNilOrWhiteSpace_Array") {
            self.expectNilOrWhiteSpace(array, [whitespaceString])
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
            self.expectNilOrWhiteSpace([optionalString])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            self.expectNilOrWhiteSpace([nilString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            self.expectNilOrWhiteSpace([emptyString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            self.expectNilOrWhiteSpace([whitespaceString, string])
        }
        expectThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            self.expectNilOrWhiteSpace(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNilOrWhiteSpace_ArrayOfOptionals") {
            self.expectNilOrWhiteSpace(arrayOfOptionals, [whitespaceString])
        }
    }

    func testExpectNotWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        expectThrowsException("expectNotWhiteSpace") {
            self.expectNotWhiteSpace(nilString)
        }
        expectThrowsException("expectNotWhiteSpace") {
            self.expectNotWhiteSpace(emptyString)
        }
        expectThrowsException("expectNotWhiteSpace") {
            self.expectNotWhiteSpace(whitespaceString)
        }
        expectThrowsException("expectNotWhiteSpace") {
            self.expectNotWhiteSpace(string, whitespaceString)
        }

        expectNotThrowsException("expectNotWhiteSpace") {
            self.expectNotWhiteSpace(string)
        }
    }

    func testExpectNotWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [string, string]


        expectThrowsException("expectNotWhiteSpace_Array") {
            self.expectNotWhiteSpace([emptyString])
        }
        expectThrowsException("expectNotWhiteSpace_Array") {
            self.expectNotWhiteSpace([whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_Array") {
            self.expectNotWhiteSpace([string, whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_Array") {
            self.expectNotWhiteSpace(nil, array)
        }

        expectNotThrowsException("expectNotWhiteSpace_Array") {
            self.expectNotWhiteSpace(array, [string])
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
            self.expectNotWhiteSpace([nilString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            self.expectNotWhiteSpace([emptyString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            self.expectNotWhiteSpace([whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            self.expectNotWhiteSpace([string, whitespaceString])
        }
        expectThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            self.expectNotWhiteSpace(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNotWhiteSpace_ArrayOfOptionals") {
            self.expectNotWhiteSpace(arrayOfOptionals, [string])
        }
    }

// MARK: - Tests

    func testExpectValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()


        expectThrowsException("expectValid") {
            self.expectValid(notValidObject)
        }
        expectThrowsException("expectValid") {
            self.expectValid(validObject, notValidObject)
        }

        expectNotThrowsException("expectValid") {
            self.expectValid(validObject)
        }
    }

    func testExpectValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject, validObject]


        expectThrowsException("expectValid_Array") {
            self.expectValid([notValidObject])
        }
        expectThrowsException("expectValid_Array") {
            self.expectValid([validObject, notValidObject])
        }
        expectThrowsException("expectValid_Array") {
            self.expectValid(nil, array)
        }

        expectNotThrowsException("expectValid_Array") {
            self.expectValid(array, [validObject])
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
            self.expectValid([optionalNotValidObject])
        }
        expectThrowsException("expectValid_ArrayOfOptionals") {
            self.expectValid([validObject, nilObject])
        }
        expectThrowsException("expectValid_ArrayOfOptionals") {
            self.expectValid([validObject, optionalNotValidObject])
        }
        expectThrowsException("expectValid_ArrayOfOptionals") {
            self.expectValid(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectValid_ArrayOfOptionals") {
            self.expectValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Tests

    func testExpectNotValid()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()


        expectThrowsException("expectNotValid") {
            self.expectNotValid(validObject)
        }

        expectNotThrowsException("expectNotValid") {
            self.expectNotValid(notValidObject)
        }
    }

    func testExpectNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [notValidObject, notValidObject]


        expectThrowsException("expectNotValid_Array") {
            self.expectNotValid([validObject])
        }
        expectThrowsException("expectNotValid_Array") {
            self.expectNotValid([notValidObject, validObject])
        }
        expectThrowsException("expectNotValid_Array") {
            self.expectNotValid(nil, array)
        }
        expectThrowsException("expectNotValid_Array") {
            self.expectNotValid(array, [validObject])
        }

        expectNotThrowsException("expectNotValid_Array") {
            self.expectNotValid([notValidObject])
        }
        expectNotThrowsException("expectNotValid_Array") {
            self.expectNotValid(array, [notValidObject])
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
            self.expectNotValid([optionalValidObject])
        }
        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            self.expectNotValid([nilObject])
        }
        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            self.expectNotValid(nil, arrayOfOptionals)
        }
        expectThrowsException("expectNotValid_ArrayOfOptionals") {
            self.expectNotValid(arrayOfOptionals, [validObject])
        }

        expectNotThrowsException("expectNotValid_ArrayOfOptionals") {
            self.expectNotValid([notValidObject, optionalNotValidObject])
        }
    }

// MARK: - Tests

    func testExpectNilOrValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsException("expectNilOrValid") {
            self.expectNilOrValid(notValidObject)
        }
        expectThrowsException("expectNilOrValid") {
            self.expectNilOrValid(validObject, notValidObject)
        }
        expectThrowsException("expectNilOrValid") {
            self.expectNilOrValid(nilObject, notValidObject)
        }

        expectNotThrowsException("expectNilOrValid") {
            self.expectNilOrValid(validObject, nilObject)
        }
    }

    func testExpectNilOrValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject]


        expectThrowsException("expectNilOrValid_Array") {
            self.expectNilOrValid([notValidObject])
        }
        expectThrowsException("expectNilOrValid_Array") {
            self.expectNilOrValid([validObject, notValidObject])
        }
        expectThrowsException("expectNilOrValid_Array") {
            self.expectNilOrValid(nil, array)
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            self.expectNilOrValid(array, [notValidObject])
        }

        expectNotThrowsException("expectNilOrValid_Array") {
            self.expectNilOrValid(array, [validObject])
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
            self.expectNilOrValid([optionalNotValidObject])
        }
        expectThrowsException("expectNilOrValid_ArrayOfOptionals") {
            self.expectNilOrValid([validObject, optionalNotValidObject])
        }
        expectThrowsException("expectNilOrValid_ArrayOfOptionals") {
            self.expectNilOrValid(nil, arrayOfOptionals)
        }

        expectNotThrowsException("expectNilOrValid_ArrayOfOptionals") {
            self.expectNilOrValid([validObject, nilObject])
        }
        expectNotThrowsException("expectNilOrValid_ArrayOfOptionals") {
            self.expectNilOrValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Tests

    func testExpectNilOrNotValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsException("expectNilOrNotValid") {
            self.expectNilOrNotValid(validObject)
        }

        expectNotThrowsException("expectNilOrNotValid") {
            self.expectNilOrNotValid(nilObject, notValidObject)
        }
    }

    func testExpectNilOrNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [notValidObject]


        expectThrowsException("expectNilOrNotValid_Array") {
            self.expectNilOrNotValid([validObject])
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            self.expectNilOrNotValid([notValidObject, validObject])
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            self.expectNilOrNotValid(nil, array)
        }
        expectThrowsException("expectNilOrNotValid_Array") {
            self.expectNilOrNotValid(array, [validObject])
        }

        expectNotThrowsException("expectNilOrNotValid_Array") {
            self.expectNilOrNotValid(array, [notValidObject])
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
            self.expectNilOrNotValid([optionalValidObject])
        }
        expectThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            self.expectNilOrNotValid(nil, arrayOfOptionals)
        }
        expectThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            self.expectNilOrNotValid(arrayOfOptionals, [validObject])
        }

        expectNotThrowsException("expectNilOrNotValid_ArrayOfOptionals") {
            self.expectNilOrNotValid(arrayOfOptionals)
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
