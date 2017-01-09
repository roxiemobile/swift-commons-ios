// ----------------------------------------------------------------------------
//
//  InspectableTests.swift
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

class InspectableTests: XCTestCase, Inspectable
{
// MARK: - Tests

    func testThrowIfTrue()
    {
        expectThrowsError("throwIfTrue") {
            try self.throwIfTrue(2 > 1)
        }

        expectNotThrowsError("throwIfTrue") {
            try self.throwIfTrue(1 > 2)
        }
    }

    func testThrowIfFalse()
    {
        expectThrowsError("throwIfFalse") {
            try self.throwIfFalse(1 > 2)
        }

        expectNotThrowsError("throwIfFalse") {
            try self.throwIfFalse(2 > 1)
        }
    }

// MARK: - Tests

    func testThrowIfEqual()
    {
        let string = "value"
        let nilString: String? = nil

        expectThrowsError("throwIfEqual") {
            try self.throwIfEqual(2, 2)
        }
        expectThrowsError("throwIfEqual") {
            try self.throwIfEqual(string, string)
        }

        expectNotThrowsError("throwIfEqual") {
            try self.throwIfEqual(1, 2)
        }
        expectNotThrowsError("throwIfEqual") {
            try self.throwIfEqual(string, nilString)
        }
    }

    func testThrowIfNotEqual()
    {
        let string = "value"
        let nilString: String? = nil

        expectThrowsError("throwIfNotEqual") {
            try self.throwIfNotEqual(1, 2)
        }
        expectThrowsError("throwIfNotEqual") {
            try self.throwIfNotEqual(string, nilString)
        }

        expectNotThrowsError("throwIfNotEqual") {
            try self.throwIfNotEqual(2, 2)
        }
        expectNotThrowsError("throwIfNotEqual") {
            try self.throwIfNotEqual(string, string)
        }
    }

// MARK: - Tests

    func testThrowIfNil()
    {
        expectThrowsError("throwIfNil") {
            try self.throwIfNil(nil)
        }

        expectNotThrowsError("throwIfNil") {
            try self.throwIfNil(2)
        }
    }

    func testThrowIfNotNil()
    {
        expectThrowsError("throwIfNotNil") {
            try self.throwIfNotNil(2)
        }

        expectNotThrowsError("throwIfNotNil") {
            try self.throwIfNotNil(nil)
        }
    }

// MARK: - Tests

    func testThrowIfNilOrEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        expectThrowsError("throwIfNilOrEmpty") {
            try self.throwIfNilOrEmpty(emptyString)
        }
        expectThrowsError("throwIfNilOrEmpty") {
            try self.throwIfNilOrEmpty(string, nilString)
        }
        expectThrowsError("throwIfNilOrEmpty") {
            try self.throwIfNilOrEmpty(string, emptyString)
        }

        expectNotThrowsError("throwIfNilOrEmpty") {
            try self.throwIfNilOrEmpty(string, string)
        }
    }

    func testThrowIfNilOrEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [string]


        expectThrowsError("throwIfNilOrEmpty_Array") {
            try self.throwIfNilOrEmpty([emptyString])
        }
        expectThrowsError("throwIfNilOrEmpty_Array") {
            try self.throwIfNilOrEmpty([string, emptyString])
        }
        expectThrowsError("throwIfNilOrEmpty_Array") {
            try self.throwIfNilOrEmpty(nil, array)
        }
        expectThrowsError("throwIfNilOrEmpty_Array") {
            try self.throwIfNilOrEmpty(array, [emptyString])
        }

        expectNotThrowsError("throwIfNilOrEmpty_Array") {
            try self.throwIfNilOrEmpty(array, [string])
        }
    }

    func testThrowIfNilOrEmpty_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        expectThrowsError("throwIfNilOrEmpty_ArrayOfOptionals") {
            try self.throwIfNilOrEmpty([emptyString])
        }
        expectThrowsError("throwIfNilOrEmpty_ArrayOfOptionals") {
            try self.throwIfNilOrEmpty([string, nilString])
        }
        expectThrowsError("throwIfNilOrEmpty_ArrayOfOptionals") {
            try self.throwIfNilOrEmpty([string, emptyString])
        }
        expectThrowsError("throwIfNilOrEmpty_ArrayOfOptionals") {
            try self.throwIfNilOrEmpty(nil, arrayOfOptionals)
        }

        expectNotThrowsError("throwIfNilOrEmpty_ArrayOfOptionals") {
            try self.throwIfNilOrEmpty(arrayOfOptionals, [string])
        }
    }

// MARK: - Tests

    func testThrowIfNilOrWhiteSpace()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        expectThrowsError("throwIfNilOrWhiteSpace") {
            try self.throwIfNilOrWhiteSpace(whitespaceString)
        }
        expectThrowsError("throwIfNilOrWhiteSpace") {
            try self.throwIfNilOrWhiteSpace(string, nilString)
        }
        expectThrowsError("throwIfNilOrWhiteSpace") {
            try self.throwIfNilOrWhiteSpace(string, emptyString)
        }
        expectThrowsError("throwIfNilOrWhiteSpace") {
            try self.throwIfNilOrWhiteSpace(string, whitespaceString)
        }

        expectNotThrowsError("throwIfNilOrWhiteSpace") {
            try self.throwIfNilOrWhiteSpace(string, string)
        }
    }

    func testThrowIfNilOrWhiteSpace_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String]? = [string]


        expectThrowsError("throwIfNilOrWhiteSpace_Array") {
            try self.throwIfNilOrWhiteSpace([whitespaceString])
        }
        expectThrowsError("throwIfNilOrWhiteSpace_Array") {
            try self.throwIfNilOrWhiteSpace([string, emptyString])
        }
        expectThrowsError("throwIfNilOrWhiteSpace_Array") {
            try self.throwIfNilOrWhiteSpace([string, whitespaceString])
        }
        expectThrowsError("throwIfNilOrWhiteSpace_Array") {
            try self.throwIfNilOrWhiteSpace(nil, array)
        }
        expectThrowsError("throwIfNilOrWhiteSpace_Array") {
            try self.throwIfNilOrWhiteSpace(array, [whitespaceString])
        }

        expectNotThrowsError("throwIfNilOrWhiteSpace_Array") {
            try self.throwIfNilOrWhiteSpace(array, [string])
        }
    }

    func testThrowIfNilOrWhiteSpace_ArrayOfOptionals()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let optionalString: String? = "value"
        let arrayOfOptionals: [String?]? = [string, optionalString]


        expectThrowsError("throwIfNilOrWhiteSpace_ArrayOfOptionals") {
            try self.throwIfNilOrWhiteSpace([whitespaceString])
        }
        expectThrowsError("throwIfNilOrWhiteSpace_ArrayOfOptionals") {
            try self.throwIfNilOrWhiteSpace([string, nilString])
        }
        expectThrowsError("throwIfNilOrWhiteSpace_ArrayOfOptionals") {
            try self.throwIfNilOrWhiteSpace([string, emptyString])
        }
        expectThrowsError("throwIfNilOrWhiteSpace_ArrayOfOptionals") {
            try self.throwIfNilOrWhiteSpace([string, whitespaceString])
        }
        expectThrowsError("throwIfNilOrWhiteSpace_ArrayOfOptionals") {
            try self.throwIfNilOrWhiteSpace(nil, arrayOfOptionals)
        }

        expectNotThrowsError("throwIfNilOrWhiteSpace_ArrayOfOptionals") {
            try self.throwIfNilOrWhiteSpace(arrayOfOptionals, [string])
        }
    }

// MARK: - Tests

    func testThrowIfNotValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsError("throwIfNotValid") {
            try self.throwIfNotValid(notValidObject)
        }
        expectThrowsError("throwIfNotValid") {
            try self.throwIfNotValid(validObject, notValidObject)
        }
        expectThrowsError("throwIfNotValid") {
            try self.throwIfNotValid(nilObject, notValidObject)
        }

        expectNotThrowsError("throwIfNotValid") {
            try self.throwIfNotValid(validObject, nilObject)
        }
    }

    func testThrowIfNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject, validObject]


        expectThrowsError("throwIfNotValid_Array") {
            try self.throwIfNotValid([notValidObject])
        }
        expectThrowsError("throwIfNotValid_Array") {
            try self.throwIfNotValid([validObject, notValidObject])
        }
        expectThrowsError("throwIfNotValid_Array") {
            try self.throwIfNotValid(nil, array)
        }

        expectNotThrowsError("throwIfNotValid_Array") {
            try self.throwIfNotValid(array, [validObject])
        }
    }

    func testThrowIfNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject, nilObject]


        expectThrowsError("throwIfNotValid_ArrayOfOptionals") {
            try self.throwIfNotValid([notValidObject])
        }
        expectThrowsError("throwIfNotValid_ArrayOfOptionals") {
            try self.throwIfNotValid([validObject, notValidObject])
        }
        expectThrowsError("throwIfNotValid_ArrayOfOptionals") {
            try self.throwIfNotValid(nil, arrayOfOptionals)
        }

        expectNotThrowsError("throwIfNotValid_ArrayOfOptionals") {
            try self.throwIfNotValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Tests

    func testThrowIfNilOrNotValid()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject = NotValidModel()


        expectThrowsError("throwIfNilOrNotValid") {
            try self.throwIfNilOrNotValid(notValidObject)
        }
        expectThrowsError("throwIfNilOrNotValid") {
            try self.throwIfNilOrNotValid(validObject, nilObject)
        }
        expectThrowsError("throwIfNilOrNotValid") {
            try self.throwIfNilOrNotValid(validObject, notValidObject)
        }

        expectNotThrowsError("throwIfNilOrNotValid") {
            try self.throwIfNilOrNotValid(validObject)
        }
    }

    func testThrowIfNilOrNotValid_Array()
    {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()

        let array: [Validatable]? = [validObject]


        expectThrowsError("throwIfNilOrNotValid_Array") {
            try self.throwIfNilOrNotValid([notValidObject])
        }
        expectThrowsError("throwIfNilOrNotValid_Array") {
            try self.throwIfNilOrNotValid([validObject, notValidObject])
        }
        expectThrowsError("throwIfNilOrNotValid_Array") {
            try self.throwIfNilOrNotValid(nil, array)
        }
        expectThrowsError("throwIfNilOrNotValid_Array") {
            try self.throwIfNilOrNotValid(array, [notValidObject])
        }

        expectNotThrowsError("throwIfNilOrNotValid_Array") {
            try self.throwIfNilOrNotValid(array, [validObject])
        }
    }

    func testThrowIfNilOrNotValid_ArrayOfOptionals()
    {
        let validObject = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let arrayOfOptionals: [Validatable?]? = [validObject]


        expectThrowsError("throwIfNilOrNotValid_ArrayOfOptionals") {
            try self.throwIfNilOrNotValid([notValidObject])
        }
        expectThrowsError("throwIfNilOrNotValid_ArrayOfOptionals") {
            try self.throwIfNilOrNotValid([validObject, nilObject])
        }
        expectThrowsError("throwIfNilOrNotValid_ArrayOfOptionals") {
            try self.throwIfNilOrNotValid([validObject, notValidObject])
        }
        expectThrowsError("throwIfNilOrNotValid_ArrayOfOptionals") {
            try self.throwIfNilOrNotValid(nil, arrayOfOptionals)
        }

        expectNotThrowsError("throwIfNilOrNotValid_ArrayOfOptionals") {
            try self.throwIfNilOrNotValid(arrayOfOptionals, [validObject])
        }
    }

// MARK: - Private Methods

    private func expectThrowsError(method: String, line: UInt = #line, block: () throws -> ())
    {
        do {
            try block()

            XCTFail("Line: \(line) - \(method): Method not thrown an error")
        }
        catch _ as ValidationError {
            // Do nothing
        }
        catch {
            XCTFail("Line: \(line) - \(method): Unknown error is thrown")
        }
    }

    private func expectNotThrowsError(method: String, line: UInt = #line, block: () throws -> ())
    {
        do {
            try block()
        }
        catch _ as ValidationError {
            XCTFail("Line: \(line) - \(method): Method thrown an error")
        }
        catch {
            XCTFail("Line: \(line) - \(method): Unknown error is thrown")
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
