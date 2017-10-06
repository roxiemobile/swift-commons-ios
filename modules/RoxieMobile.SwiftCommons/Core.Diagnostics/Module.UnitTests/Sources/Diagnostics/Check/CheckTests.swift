// ----------------------------------------------------------------------------
//
//  CheckTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

final class CheckTests: XCTestCase
{
// MARK: - Internal Methods

    internal func checkThrowsError(
            _ method: String,
            errorType: Error.Type = CheckError.self,
            file: StaticString = #file,
            line: UInt = #line,
            action: () throws -> ()
    ) -> Void {

        XCTAssert(!method.isEmpty, "‘method’ is empty");
        var cause: Error? = nil

        do {
            try action()
        }
        catch {
            cause = error
        }

        if let error = cause
        {
            if type(of: error) == errorType {
                // Do nothing
            }
            else {
                XCTFail("\(prefix(file, line)) - \(method): Unknown error is thrown")
            }
        }
        else {
            XCTFail("\(prefix(file, line)) - \(method): Method not thrown an error")
        }
    }

    internal func checkNotThrowsError(
            _ method: String,
            errorType: Error.Type = CheckError.self,
            file: StaticString = #file,
            line: UInt = #line,
            action: () throws -> ()
    ) -> Void {

        XCTAssert(!method.isEmpty, "‘method’ is empty");
        var cause: Error? = nil

        do {
            try action()
        }
        catch {
            cause = error
        }

        if let error = cause
        {
            if type(of: error) == errorType {
                XCTFail("\(prefix(file, line)) - \(method): Method thrown an error")
            }
            else {
                XCTFail("\(prefix(file, line)) - \(method): Unknown error is thrown")
            }
        }
        else {
            // Do nothing
        }
    }

    internal func loadJson(
            _ filename: String,
            file: StaticString = #file,
            line: UInt = #line
    ) -> [String: Any]? {

        XCTAssert(!filename.isEmpty, "‘filename’ is empty")
        var jsonObject: [String: Any]? = nil

        if let filepath = Bundle(for: type(of: self)).path(forResource: filename, ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: filepath), options: .alwaysMapped)
        {
            if let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments),
               let dict = json as? [String: Any]
            {
                jsonObject = dict
            }
            else {
                XCTFail("\(prefix(file, line)) - Could not parse JSON from file: \(filename).json")
            }
        }
        else {
            XCTFail("\(prefix(file, line)) - Could not load file: \(filename).json")
        }
        return jsonObject
    }

// MARK: - Private Methods

    private func prefix(_ file: StaticString, _ line: UInt) -> String {
        let fileURL = URL(fileURLWithPath: String(describing: file))
        return "\(fileURL.lastPathComponent):\(line)"
    }
}

// ----------------------------------------------------------------------------

/*
extension CheckTests
{
// MARK: - Tests

    func testEqual()
    {
        let string = "value"
        let nilString: String? = nil


        checkThrowsError("isEqual") {
            try Check.equal(1, 2)
        }
        checkThrowsError("isEqual") {
            try Check.equal(string, nilString)
        }

        checkNotThrowsError("isEqual") {
            try Check.equal(2, 2)
        }
        checkNotThrowsError("isEqual") {
            try Check.equal(string, string)
        }
    }

    func testNotEqual()
    {
        let string = "value"
        let nilString: String? = nil


        checkThrowsError("isNotEqual") {
            try Check.notEqual(2, 2)
        }
        checkThrowsError("isNotEqual") {
            try Check.notEqual(string, string)
        }

        checkNotThrowsError("isNotEqual") {
            try Check.notEqual(1, 2)
        }
        checkNotThrowsError("isNotEqual") {
            try Check.notEqual(string, nilString)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testSame()
    {
        let view = UIView()
        let otherView = UIView()


        checkThrowsError("isSame") {
            try Check.same(view, otherView)
        }

        checkNotThrowsError("isSame") {
            try Check.same(view, view)
        }
    }

    func testNotSame()
    {
        let view = UIView()
        let otherView = UIView()


        checkThrowsError("isNotSame") {
            try Check.notSame(view, view)
        }

        checkNotThrowsError("isNotSame") {
            try Check.notSame(view, otherView)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        checkThrowsError("isEmpty") {
            try Check.empty(string)
        }

        checkNotThrowsError("isEmpty") {
            try Check.empty(nilString)
        }
        checkNotThrowsError("isEmpty") {
            try Check.empty(emptyString)
        }

        // --

        let array = ["value", "otherValue"]
        let nilArray: [String]? = nil
        let emptyArray = [String]()

        checkThrowsError("isEmpty_Array") {
            try Check.empty(array)
        }

        checkNotThrowsError("isEmpty_Array") {
            try Check.empty(nilArray)
        }
        checkNotThrowsError("isEmpty_Array") {
            try Check.empty(emptyArray)
        }

        // --

        let map = ["key": "value", "otherKey": "otherValue"]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        checkThrowsError("isEmpty_Map") {
            try Check.empty(map)
        }

        checkNotThrowsError("isEmpty_Map") {
            try Check.empty(nilMap)
        }
        checkNotThrowsError("isEmpty_Map") {
            try Check.empty(emptyMap)
        }
    }

    func testAllEmpty_Array()
    {
        let string = "value"
        let emptyString = ""

        let array: [String]? = [emptyString]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        checkThrowsError("isAllEmpty_Array") {
            try Check.allEmpty([string])
        }
        checkThrowsError("isAllEmpty_Array") {
            try Check.allEmpty([emptyString, string])
        }

        checkNotThrowsError("isAllEmpty_Array") {
            try Check.allEmpty(array)
        }
        checkNotThrowsError("isAllEmpty_Array") {
            try Check.allEmpty(nilArray)
        }
        checkNotThrowsError("isAllEmpty_Array") {
            try Check.allEmpty(emptyArray)
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


        checkThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Check.allEmpty([string])
        }
        checkThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Check.allEmpty([nilString, string])
        }
        checkThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Check.allEmpty([emptyString, string])
        }

        checkNotThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Check.allEmpty(array)
        }
        checkNotThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Check.allEmpty(nilArray)
        }
        checkNotThrowsError("isAllEmpty_ArrayOfOptionals") {
            try Check.allEmpty(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testNotEmpty()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""


        checkThrowsError("isNotEmpty") {
            try Check.notEmpty(nilString)
        }
        checkThrowsError("isNotEmpty") {
            try Check.notEmpty(emptyString)
        }

        checkNotThrowsError("isNotEmpty") {
            try Check.notEmpty(string)
        }

        // --

        let array = ["value", "otherValue"]
        let nilArray: [String]? = nil
        let emptyArray = [String]()

        checkThrowsError("isNotEmpty_Array") {
            try Check.notEmpty(nilArray)
        }
        checkThrowsError("isNotEmpty_Array") {
            try Check.notEmpty(emptyArray)
        }

        checkNotThrowsError("isNotEmpty_Array") {
            try Check.notEmpty(array)
        }

        // --

        let map = ["key": "value", "otherKey": "otherValue"]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        checkThrowsError("isNotEmpty_Map") {
            try Check.notEmpty(nilMap)
        }
        checkThrowsError("isNotEmpty_Map") {
            try Check.notEmpty(emptyMap)
        }

        checkNotThrowsError("isNotEmpty_Map") {
            try Check.notEmpty(map)
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


        checkThrowsError("isAllNotEmpty_Array") {
            try Check.allNotEmpty([string, emptyString])
        }

        checkNotThrowsError("isAllNotEmpty_Array") {
            try Check.allNotEmpty(array)
        }
        checkNotThrowsError("isAllNotEmpty_Array") {
            try Check.allNotEmpty(nilArray)
        }
        checkNotThrowsError("isAllNotEmpty_Array") {
            try Check.allNotEmpty(emptyArray)
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


        checkThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Check.allNotEmpty([string, nilString])
        }
        checkThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Check.allNotEmpty([string, emptyString])
        }

        checkNotThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Check.allNotEmpty(array)
        }
        checkNotThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Check.allNotEmpty(nilArray)
        }
        checkNotThrowsError("isAllNotEmpty_ArrayOfOptionals") {
            try Check.allNotEmpty(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testBlank()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        checkThrowsError("isBlank") {
            try Check.blank(string)
        }

        checkNotThrowsError("isBlank") {
            try Check.blank(nilString)
        }
        checkNotThrowsError("isBlank") {
            try Check.blank(emptyString)
        }
        checkNotThrowsError("isBlank") {
            try Check.blank(whitespaceString)
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


        checkThrowsError("isAllBlank_Array") {
            try Check.allBlank([string])
        }
        checkThrowsError("isAllBlank_Array") {
            try Check.allBlank([emptyString, string])
        }
        checkThrowsError("isAllBlank_Array") {
            try Check.allBlank([whitespaceString, string])
        }

        checkNotThrowsError("isAllBlank_Array") {
            try Check.allBlank(array)
        }
        checkNotThrowsError("isAllBlank_Array") {
            try Check.allBlank(nilArray)
        }
        checkNotThrowsError("isAllBlank_Array") {
            try Check.allBlank(emptyArray)
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


        checkThrowsError("isAllBlank_ArrayOfOptionals") {
            try Check.allBlank([string])
        }
        checkThrowsError("isAllBlank_ArrayOfOptionals") {
            try Check.allBlank([nilString, string])
        }
        checkThrowsError("isAllBlank_ArrayOfOptionals") {
            try Check.allBlank([emptyString, string])
        }
        checkThrowsError("isAllBlank_ArrayOfOptionals") {
            try Check.allBlank([whitespaceString, string])
        }

        checkNotThrowsError("isAllBlank_ArrayOfOptionals") {
            try Check.allBlank(array)
        }
        checkNotThrowsError("isAllBlank_ArrayOfOptionals") {
            try Check.allBlank(nilArray)
        }
        checkNotThrowsError("isAllBlank_ArrayOfOptionals") {
            try Check.allBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testNotBlank()
    {
        let string = "value"
        let nilString: String? = nil
        let emptyString = ""
        let whitespaceString = " \t\r\n"


        checkThrowsError("isNotBlank") {
            try Check.notBlank(nilString)
        }
        checkThrowsError("isNotBlank") {
            try Check.notBlank(emptyString)
        }
        checkThrowsError("isNotBlank") {
            try Check.notBlank(whitespaceString)
        }

        checkNotThrowsError("isNotBlank") {
            try Check.notBlank(string)
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


        checkThrowsError("isAllNotBlank_Array") {
            try Check.allNotBlank([emptyString])
        }
        checkThrowsError("isAllNotBlank_Array") {
            try Check.allNotBlank([whitespaceString])
        }
        checkThrowsError("isAllNotBlank_Array") {
            try Check.allNotBlank([string, whitespaceString])
        }

        checkNotThrowsError("isAllNotBlank_Array") {
            try Check.allNotBlank(array)
        }
        checkNotThrowsError("isAllNotBlank_Array") {
            try Check.allNotBlank(nilArray)
        }
        checkNotThrowsError("isAllNotBlank_Array") {
            try Check.allNotBlank(emptyArray)
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


        checkThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Check.allNotBlank([nilString])
        }
        checkThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Check.allNotBlank([emptyString])
        }
        checkThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Check.allNotBlank([whitespaceString])
        }
        checkThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Check.allNotBlank([string, whitespaceString])
        }

        checkNotThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Check.allNotBlank(array)
        }
        checkNotThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Check.allNotBlank(nilArray)
        }
        checkNotThrowsError("isAllNotBlank_ArrayOfOptionals") {
            try Check.allNotBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testValid()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        checkThrowsError("isValid") {
            try Check.valid(notValidObject)
        }

        checkNotThrowsError("isValid") {
            try Check.valid(validObject)
        }
    }

    func testAllValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable]? = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        checkThrowsError("isAllValid_Array") {
            try Check.allValid([notValidObject])
        }
        checkThrowsError("isAllValid_Array") {
            try Check.allValid([validObject, notValidObject])
        }

        checkNotThrowsError("isAllValid_Array") {
            try Check.allValid(array)
        }
        checkNotThrowsError("isAllValid_Array") {
            try Check.allValid(nilArray)
        }
        checkNotThrowsError("isAllValid_Array") {
            try Check.allValid(emptyArray)
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


        checkThrowsError("isAllValid_ArrayOfOptionals") {
            try Check.allValid([notValidObject])
        }
        checkThrowsError("isAllValid_ArrayOfOptionals") {
            try Check.allValid([validObject, nilObject])
        }
        checkThrowsError("isAllValid_ArrayOfOptionals") {
            try Check.allValid([validObject, notValidObject])
        }

        checkNotThrowsError("isAllValid_ArrayOfOptionals") {
            try Check.allValid(array)
        }
        checkNotThrowsError("isAllValid_ArrayOfOptionals") {
            try Check.allValid(nilArray)
        }
        checkNotThrowsError("isAllValid_ArrayOfOptionals") {
            try Check.allValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testNotValid()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()


        checkThrowsError("isNotValid") {
            try Check.notValid(validObject)
        }

        checkNotThrowsError("isNotValid") {
            try Check.notValid(notValidObject)
        }
    }

    func testAllNotValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        checkThrowsError("isAllNotValid_Array") {
            try Check.allNotValid([validObject])
        }
        checkThrowsError("isAllNotValid_Array") {
            try Check.allNotValid([notValidObject, validObject])
        }

        checkNotThrowsError("isAllNotValid_Array") {
            try Check.allNotValid(array)
        }
        checkNotThrowsError("isAllNotValid_Array") {
            try Check.allNotValid(nilArray)
        }
        checkNotThrowsError("isAllNotValid_Array") {
            try Check.allNotValid(emptyArray)
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

        checkThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Check.allNotValid([validObject])
        }
        checkThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Check.allNotValid([nilObject])
        }
        checkThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Check.allNotValid([notValidObject, validObject])
        }

        checkNotThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Check.allNotValid(array)
        }
        checkNotThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Check.allNotValid(nilArray)
        }
        checkNotThrowsError("isAllNotValid_ArrayOfOptionals") {
            try Check.allNotValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testNilOrValid()
    {
        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        checkThrowsError("isNilOrValid") {
            try Check.nilOrValid(notValidObject)
        }

        checkNotThrowsError("isNilOrValid") {
            try Check.nilOrValid(validObject)
        }
        checkNotThrowsError("isNilOrValid") {
            try Check.nilOrValid(nilObject)
        }
    }

    func testAllNilOrValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [validObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        checkThrowsError("isAllNilOrValid_Array") {
            try Check.allNilOrValid([notValidObject])
        }
        checkThrowsError("isAllNilOrValid_Array") {
            try Check.allNilOrValid([validObject, notValidObject])
        }

        checkNotThrowsError("isAllNilOrValid_Array") {
            try Check.allNilOrValid(array)
        }
        checkNotThrowsError("isAllNilOrValid_Array") {
            try Check.allNilOrValid(nilArray)
        }
        checkNotThrowsError("isAllNilOrValid_Array") {
            try Check.allNilOrValid(emptyArray)
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


        checkThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Check.allNilOrValid([notValidObject])
        }
        checkThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Check.allNilOrValid([validObject, notValidObject])
        }
        checkThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Check.allNilOrValid([nilObject, notValidObject])
        }

        checkNotThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Check.allNilOrValid(array)
        }
        checkNotThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Check.allNilOrValid(nilArray)
        }
        checkNotThrowsError("isAllNilOrValid_ArrayOfOptionals") {
            try Check.allNilOrValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testNilOrNotValid()
    {
        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        checkThrowsError("isNilOrNotValid") {
            try Check.nilOrNotValid(validObject)
        }

        checkNotThrowsError("isNilOrNotValid") {
            try Check.nilOrNotValid(nilObject)
        }
        checkNotThrowsError("isNilOrNotValid") {
            try Check.nilOrNotValid(notValidObject)
        }
    }

    func testAllNilOrNotValid_Array()
    {
        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: [Validatable] = [notValidObject]
        let nilArray: [Validatable]? = nil
        let emptyArray = [Validatable]()


        checkThrowsError("isAllNilOrNotValid_Array") {
            try Check.allNilOrNotValid([validObject])
        }
        checkThrowsError("isAllNilOrNotValid_Array") {
            try Check.allNilOrNotValid([notValidObject, validObject])
        }

        checkNotThrowsError("isAllNilOrNotValid_Array") {
            try Check.allNilOrNotValid(array)
        }
        checkNotThrowsError("isAllNilOrNotValid_Array") {
            try Check.allNilOrNotValid(nilArray)
        }
        checkNotThrowsError("isAllNilOrNotValid_Array") {
            try Check.allNilOrNotValid(emptyArray)
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


        checkThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Check.allNilOrNotValid([validObject])
        }
        checkThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Check.allNilOrNotValid([nilObject, validObject])
        }
        checkThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Check.allNilOrNotValid([notValidObject, validObject])
        }

        checkNotThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Check.allNilOrNotValid(array)
        }
        checkNotThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Check.allNilOrNotValid(nilArray)
        }
        checkNotThrowsError("isAllNilOrNotValid_ArrayOfOptionals") {
            try Check.allNilOrNotValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testValidModel() {
        var parking: ParkingModel? = nil

        if let jsonObject = loadJson("test_parking_model_with_valid_vehicles_in_array") {
            checkNotThrowsError("isValidModel", errorType: ExpectationError.self) {
                parking = try ParkingModel(params: jsonObject)
            }
        }

        XCTAssertNotNil(parking)
        XCTAssertTrue(parking!.isValid())
    }

    func testNotValidModel() {
        var parking: ParkingModel? = nil

        if let jsonObject = loadJson("test_parking_model_with_one_non_valid_vehicle_in_array") {
            checkThrowsError("isNotValidModel", errorType: JsonSyntaxError.self) {
                parking = try ParkingModel(params: jsonObject)
            }
        }

        XCTAssertNil(parking)
    }
}
*/

// ----------------------------------------------------------------------------
