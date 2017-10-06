// ----------------------------------------------------------------------------
//
//  GuardTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

final class GuardTests: XCTestCase
{
// MARK: - Private Methods

    internal func guardThrowsException(
            _ method: String,
            exceptionType: NSException.Type = GuardException.self,
            file: StaticString = #file,
            line: UInt = #line,
            action: @escaping () -> ()
    ) -> Void {

        XCTAssert(!method.isEmpty, "‘method’ is empty");
        var cause: NSException? = nil

        objcTry {
            action()
        }.objcCatch { exception in
            cause = exception
        }

        if let exception = cause
        {
            if type(of: exception) == exceptionType {
                // Do nothing
            }
            else {
                XCTFail("\(prefix(file, line)) - \(method): Unknown exception is thrown")
            }
        }
        else {
            XCTFail("\(prefix(file, line)) - \(method): Method not thrown an exception")
        }
    }

    internal func guardNotThrowsException(
            _ method: String,
            exceptionType: NSException.Type = GuardException.self,
            file: StaticString = #file,
            line: UInt = #line,
            action: @escaping () -> ()
    ) -> Void {

        XCTAssert(!method.isEmpty, "‘method’ is empty");
        var cause: NSException? = nil

        objcTry {
            action()
        }.objcCatch { exception in
            cause = exception
        }

        if let exception = cause
        {
            if type(of: exception) == exceptionType {
                XCTFail("\(prefix(file, line)) - \(method): Method thrown an exception")
            }
            else {
                XCTFail("\(prefix(file, line)) - \(method): Unknown exception is thrown")
            }
        }
        else {
            // Do nothing
        }
    }

// MARK: - Private Methods

    private func prefix(_ file: StaticString, _ line: UInt) -> String {
        let fileURL = URL(fileURLWithPath: String(describing: file))
        return "\(fileURL.lastPathComponent):\(line)"
    }
}

// ----------------------------------------------------------------------------

/*
extension GuardTests
{
// MARK: - Tests

    func testEqual()
    {
        let string = "value"
        let nilString: String? = nil


        guardThrowsException("isEqual") {
            Guard.equal(1, 2)
        }
        guardThrowsException("isEqual") {
            Guard.equal(string, nilString)
        }

        guardNotThrowsException("isEqual") {
            Guard.equal(2, 2)
        }
        guardNotThrowsException("isEqual") {
            Guard.equal(string, string)
        }
    }

    func testNotEqual()
    {
        let string = "value"
        let nilString: String? = nil


        guardThrowsException("isNotEqual") {
            Guard.notEqual(2, 2)
        }
        guardThrowsException("isNotEqual") {
            Guard.notEqual(string, string)
        }

        guardNotThrowsException("isNotEqual") {
            Guard.notEqual(1, 2)
        }
        guardNotThrowsException("isNotEqual") {
            Guard.notEqual(string, nilString)
        }
    }
}

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testSame()
    {
        let view = UIView()
        let otherView = UIView()


        guardThrowsException("isSame") {
            Guard.same(view, otherView)
        }

        guardNotThrowsException("isSame") {
            Guard.same(view, view)
        }
    }

    func testNotSame()
    {
        let view = UIView()
        let otherView = UIView()


        guardThrowsException("isNotSame") {
            Guard.notSame(view, view)
        }

        guardNotThrowsException("isNotSame") {
            Guard.notSame(view, otherView)
        }
    }
}

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        guardThrowsException("isEmpty") {
            Guard.empty(string)
        }

        guardNotThrowsException("isEmpty") {
            Guard.empty(nilString)
        }
        guardNotThrowsException("isEmpty") {
            Guard.empty(emptyString)
        }

        // --

        let array = ["value", "otherValue"]
        let nilArray: [String]? = nil
        let emptyArray = [String]()

        guardThrowsException("isEmpty_Array") {
            Guard.empty(array)
        }

        guardNotThrowsException("isEmpty_Array") {
            Guard.empty(nilArray)
        }
        guardNotThrowsException("isEmpty_Array") {
            Guard.empty(emptyArray)
        }

        // --

        let map = ["key": "value", "otherKey": "otherValue"]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        guardThrowsException("isEmpty_Map") {
            Guard.empty(map)
        }

        guardNotThrowsException("isEmpty_Map") {
            Guard.empty(nilMap)
        }
        guardNotThrowsException("isEmpty_Map") {
            Guard.empty(emptyMap)
        }
    }

    func testAllEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [emptyString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        guardThrowsException("isAllEmpty_Array") {
            Guard.allEmpty([string])
        }
        guardThrowsException("isAllEmpty_Array") {
            Guard.allEmpty([emptyString, string])
        }

        guardNotThrowsException("isAllEmpty_Array") {
            Guard.allEmpty(array)
        }
        guardNotThrowsException("isAllEmpty_Array") {
            Guard.allEmpty(nilArray)
        }
        guardNotThrowsException("isAllEmpty_Array") {
            Guard.allEmpty(emptyArray)
        }
    }

    func testAllEmpty_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let array: [String?]? = [nilString, emptyString]
        let nilArray: [String?]? = nil
        let emptyArray = [String?]()


        guardThrowsException("isAllEmpty_ArrayOfOptionals") {
            Guard.allEmpty([string])
        }
        guardThrowsException("isAllEmpty_ArrayOfOptionals") {
            Guard.allEmpty([nilString, string])
        }
        guardThrowsException("isAllEmpty_ArrayOfOptionals") {
            Guard.allEmpty([emptyString, string])
        }

        guardNotThrowsException("isAllEmpty_ArrayOfOptionals") {
            Guard.allEmpty(array)
        }
        guardNotThrowsException("isAllEmpty_ArrayOfOptionals") {
            Guard.allEmpty(nilArray)
        }
        guardNotThrowsException("isAllEmpty_ArrayOfOptionals") {
            Guard.allEmpty(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testNotEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        guardThrowsException("isNotEmpty") {
            Guard.notEmpty(nilString)
        }
        guardThrowsException("isNotEmpty") {
            Guard.notEmpty(emptyString)
        }

        guardNotThrowsException("isNotEmpty") {
            Guard.notEmpty(string)
        }

        // --

        let array = ["value", "otherValue"]
        let nilArray: [String]? = nil
        let emptyArray = [String]()

        guardThrowsException("isNotEmpty_Array") {
            Guard.notEmpty(nilArray)
        }
        guardThrowsException("isNotEmpty_Array") {
            Guard.notEmpty(emptyArray)
        }

        guardNotThrowsException("isNotEmpty_Array") {
            Guard.notEmpty(array)
        }

        // --

        let map = ["key": "value", "otherKey": "otherValue"]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        guardThrowsException("isNotEmpty_Map") {
            Guard.notEmpty(nilMap)
        }
        guardThrowsException("isNotEmpty_Map") {
            Guard.notEmpty(emptyMap)
        }

        guardNotThrowsException("isNotEmpty_Map") {
            Guard.notEmpty(map)
        }
    }

    func testAllNotEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let otherString = "otherValue"
        let array: [String]? = [string, otherString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        guardThrowsException("isAllNotEmpty_Array") {
            Guard.allNotEmpty([string, emptyString])
        }

        guardNotThrowsException("isAllNotEmpty_Array") {
            Guard.allNotEmpty(array)
        }
        guardNotThrowsException("isAllNotEmpty_Array") {
            Guard.allNotEmpty(nilArray)
        }
        guardNotThrowsException("isAllNotEmpty_Array") {
            Guard.allNotEmpty(emptyArray)
        }
    }

    func testAllNotEmpty_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""

        let otherString: String? = "otherValue"
        let array: [String?]? = [string, otherString]
        let nilArray: [String?]? = nil
        let emptyArray = [String?]()


        guardThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Guard.allNotEmpty([string, nilString])
        }
        guardThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Guard.allNotEmpty([string, emptyString])
        }

        guardNotThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Guard.allNotEmpty(array)
        }
        guardNotThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Guard.allNotEmpty(nilArray)
        }
        guardNotThrowsException("isAllNotEmpty_ArrayOfOptionals") {
            Guard.allNotEmpty(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testBlank()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        guardThrowsException("isBlank") {
            Guard.blank(string)
        }

        guardNotThrowsException("isBlank") {
            Guard.blank(nilString)
        }
        guardNotThrowsException("isBlank") {
            Guard.blank(emptyString)
        }
        guardNotThrowsException("isBlank") {
            Guard.blank(whitespaceString)
        }
    }

    func testAllBlank_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let array: [String] = [emptyString, whitespaceString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        guardThrowsException("isAllBlank_Array") {
            Guard.allBlank([string])
        }
        guardThrowsException("isAllBlank_Array") {
            Guard.allBlank([emptyString, string])
        }
        guardThrowsException("isAllBlank_Array") {
            Guard.allBlank([whitespaceString, string])
        }

        guardNotThrowsException("isAllBlank_Array") {
            Guard.allBlank(array)
        }
        guardNotThrowsException("isAllBlank_Array") {
            Guard.allBlank(nilArray)
        }
        guardNotThrowsException("isAllBlank_Array") {
            Guard.allBlank(emptyArray)
        }
    }

    func testAllBlank_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let array: [String?]? = [nilString, emptyString, whitespaceString]
        let nilArray: [String?]? = nil
        let emptyArray = [String?]()


        guardThrowsException("isAllBlank_ArrayOfOptionals") {
            Guard.allBlank([string])
        }
        guardThrowsException("isAllBlank_ArrayOfOptionals") {
            Guard.allBlank([nilString, string])
        }
        guardThrowsException("isAllBlank_ArrayOfOptionals") {
            Guard.allBlank([emptyString, string])
        }
        guardThrowsException("isAllBlank_ArrayOfOptionals") {
            Guard.allBlank([whitespaceString, string])
        }

        guardNotThrowsException("isAllBlank_ArrayOfOptionals") {
            Guard.allBlank(array)
        }
        guardNotThrowsException("isAllBlank_ArrayOfOptionals") {
            Guard.allBlank(nilArray)
        }
        guardNotThrowsException("isAllBlank_ArrayOfOptionals") {
            Guard.allBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testNotBlank()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        guardThrowsException("isNotBlank") {
            Guard.notBlank(nilString)
        }
        guardThrowsException("isNotBlank") {
            Guard.notBlank(emptyString)
        }
        guardThrowsException("isNotBlank") {
            Guard.notBlank(whitespaceString)
        }

        guardNotThrowsException("isNotBlank") {
            Guard.notBlank(string)
        }
    }

    func testAllNotBlank_Array()
    {
        let string = "value"
        let emptyString = ""
        let whitespaceString = " \t\r\n"

        let otherString = "otherValue"
        let array: [String]? = [string, otherString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        guardThrowsException("isAllNotBlank_Array") {
            Guard.allNotBlank([emptyString])
        }
        guardThrowsException("isAllNotBlank_Array") {
            Guard.allNotBlank([whitespaceString])
        }
        guardThrowsException("isAllNotBlank_Array") {
            Guard.allNotBlank([string, whitespaceString])
        }

        guardNotThrowsException("isAllNotBlank_Array") {
            Guard.allNotBlank(array)
        }
        guardNotThrowsException("isAllNotBlank_Array") {
            Guard.allNotBlank(nilArray)
        }
        guardNotThrowsException("isAllNotBlank_Array") {
            Guard.allNotBlank(emptyArray)
        }
    }

    func testAllNotBlank_ArrayOfOptionals()
    {
        let string: String? = "value"
        let nilString: String? = nil
        let emptyString: String? = ""
        let whitespaceString: String? = " \t\r\n"

        let otherString: String? = "otherValue"
        let array: [String?]? = [string, otherString]
        let nilArray: [String?]? = nil
        let emptyArray = [String?]()


        guardThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Guard.allNotBlank([nilString])
        }
        guardThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Guard.allNotBlank([emptyString])
        }
        guardThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Guard.allNotBlank([whitespaceString])
        }
        guardThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Guard.allNotBlank([string, whitespaceString])
        }

        guardNotThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Guard.allNotBlank(array)
        }
        guardNotThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Guard.allNotBlank(nilArray)
        }
        guardNotThrowsException("isAllNotBlank_ArrayOfOptionals") {
            Guard.allNotBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testValid()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        guardThrowsException("isValid") {
            Guard.valid(notValidObject)
        }

        guardNotThrowsException("isValid") {
            Guard.valid(validObject)
        }
    }

    func testAllValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable]? = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        guardThrowsException("isAllValid_Array") {
            Guard.allValid([notValidObject])
        }
        guardThrowsException("isAllValid_Array") {
            Guard.allValid([validObject, notValidObject])
        }

        guardNotThrowsException("isAllValid_Array") {
            Guard.allValid(array)
        }
        guardNotThrowsException("isAllValid_Array") {
            Guard.allValid(nilArray)
        }
        guardNotThrowsException("isAllValid_Array") {
            Guard.allValid(emptyArray)
        }
    }

    func testAllValid_ArrayOfOptionals()
    {
        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: [Validatable?]? = [validObject]
        let nilArray: [Validatable?]? = nil
        let emptyArray = [Validatable?]()


        guardThrowsException("isAllValid_ArrayOfOptionals") {
            Guard.allValid([notValidObject])
        }
        guardThrowsException("isAllValid_ArrayOfOptionals") {
            Guard.allValid([validObject, nilObject])
        }
        guardThrowsException("isAllValid_ArrayOfOptionals") {
            Guard.allValid([validObject, notValidObject])
        }

        guardNotThrowsException("isAllValid_ArrayOfOptionals") {
            Guard.allValid(array)
        }
        guardNotThrowsException("isAllValid_ArrayOfOptionals") {
            Guard.allValid(nilArray)
        }
        guardNotThrowsException("isAllValid_ArrayOfOptionals") {
            Guard.allValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testNotValid()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()


        guardThrowsException("isNotValid") {
            Guard.notValid(validObject)
        }

        guardNotThrowsException("isNotValid") {
            Guard.notValid(notValidObject)
        }
    }

    func testAllNotValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        guardThrowsException("isAllNotValid_Array") {
            Guard.allNotValid([validObject])
        }
        guardThrowsException("isAllNotValid_Array") {
            Guard.allNotValid([notValidObject, validObject])
        }

        guardNotThrowsException("isAllNotValid_Array") {
            Guard.allNotValid(array)
        }
        guardNotThrowsException("isAllNotValid_Array") {
            Guard.allNotValid(nilArray)
        }
        guardNotThrowsException("isAllNotValid_Array") {
            Guard.allNotValid(emptyArray)
        }
    }

    func testAllNotValid_ArrayOfOptionals()
    {
        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: [Validatable?]? = [notValidObject]
        let nilArray: [Validatable?]? = nil
        let emptyArray = [Validatable?]()

        guardThrowsException("isAllNotValid_ArrayOfOptionals") {
            Guard.allNotValid([validObject])
        }
        guardThrowsException("isAllNotValid_ArrayOfOptionals") {
            Guard.allNotValid([nilObject])
        }
        guardThrowsException("isAllNotValid_ArrayOfOptionals") {
            Guard.allNotValid([notValidObject, validObject])
        }

        guardNotThrowsException("isAllNotValid_ArrayOfOptionals") {
            Guard.allNotValid(array)
        }
        guardNotThrowsException("isAllNotValid_ArrayOfOptionals") {
            Guard.allNotValid(nilArray)
        }
        guardNotThrowsException("isAllNotValid_ArrayOfOptionals") {
            Guard.allNotValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testNilOrValid()
    {
        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        guardThrowsException("isNilOrValid") {
            Guard.nilOrValid(notValidObject)
        }

        guardNotThrowsException("isNilOrValid") {
            Guard.nilOrValid(validObject)
        }
        guardNotThrowsException("isNilOrValid") {
            Guard.nilOrValid(nilObject)
        }
    }

    func testAllNilOrValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        guardThrowsException("isAllNilOrValid_Array") {
            Guard.allNilOrValid([notValidObject])
        }
        guardThrowsException("isAllNilOrValid_Array") {
            Guard.allNilOrValid([validObject, notValidObject])
        }

        guardNotThrowsException("isAllNilOrValid_Array") {
            Guard.allNilOrValid(array)
        }
        guardNotThrowsException("isAllNilOrValid_Array") {
            Guard.allNilOrValid(nilArray)
        }
        guardNotThrowsException("isAllNilOrValid_Array") {
            Guard.allNilOrValid(emptyArray)
        }
    }

    func testAllNilOrValid_ArrayOfOptionals()
    {
        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: [Validatable?]? = [validObject, nilObject]
        let nilArray: [Validatable?]? = nil
        let emptyArray = [Validatable?]()


        guardThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Guard.allNilOrValid([notValidObject])
        }
        guardThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Guard.allNilOrValid([validObject, notValidObject])
        }
        guardThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Guard.allNilOrValid([nilObject, notValidObject])
        }

        guardNotThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Guard.allNilOrValid(array)
        }
        guardNotThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Guard.allNilOrValid(nilArray)
        }
        guardNotThrowsException("isAllNilOrValid_ArrayOfOptionals") {
            Guard.allNilOrValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testNilOrNotValid()
    {
        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        guardThrowsException("isNilOrNotValid") {
            Guard.nilOrNotValid(validObject)
        }

        guardNotThrowsException("isNilOrNotValid") {
            Guard.nilOrNotValid(nilObject)
        }
        guardNotThrowsException("isNilOrNotValid") {
            Guard.nilOrNotValid(notValidObject)
        }
    }

    func testAllNilOrNotValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        guardThrowsException("isAllNilOrNotValid_Array") {
            Guard.allNilOrNotValid([validObject])
        }
        guardThrowsException("isAllNilOrNotValid_Array") {
            Guard.allNilOrNotValid([notValidObject, validObject])
        }

        guardNotThrowsException("isAllNilOrNotValid_Array") {
            Guard.allNilOrNotValid(array)
        }
        guardNotThrowsException("isAllNilOrNotValid_Array") {
            Guard.allNilOrNotValid(nilArray)
        }
        guardNotThrowsException("isAllNilOrNotValid_Array") {
            Guard.allNilOrNotValid(emptyArray)
        }
    }

    func testAllNilOrNotValid_ArrayOfOptionals()
    {
        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: [Validatable?]? = [notValidObject, nilObject]
        let nilArray: [Validatable?]? = nil
        let emptyArray = [Validatable?]()


        guardThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Guard.allNilOrNotValid([validObject])
        }
        guardThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Guard.allNilOrNotValid([nilObject, validObject])
        }
        guardThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Guard.allNilOrNotValid([notValidObject, validObject])
        }

        guardNotThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Guard.allNilOrNotValid(array)
        }
        guardNotThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Guard.allNilOrNotValid(nilArray)
        }
        guardNotThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
            Guard.allNilOrNotValid(emptyArray)
        }
    }
}
*/

// ----------------------------------------------------------------------------
