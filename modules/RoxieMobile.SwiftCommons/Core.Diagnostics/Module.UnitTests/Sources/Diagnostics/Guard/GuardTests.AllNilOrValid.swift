// ----------------------------------------------------------------------------
//
//  GuardTests.AllNilOrValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testAllNilOrValid_Array() {
        let method = "Guard.allNilOrValid"

//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable] = [validObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        guardThrowsException("\(method)_Array") {
//            Guard.allNilOrValid([notValidObject])
//        }
//        guardThrowsException("\(method)_Array") {
//            Guard.allNilOrValid([validObject, notValidObject])
//        }
//
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNilOrValid(array)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNilOrValid(nilArray)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNilOrValid(emptyArray)
//        }

        XCTFail(method)
    }

    func testAllNilOrValid_ArrayOfOptionals() {
        let method = "Guard.allNilOrValid"

//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [validObject, nilObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrValid([notValidObject])
//        }
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrValid([validObject, notValidObject])
//        }
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrValid([nilObject, notValidObject])
//        }
//
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrValid(array)
//        }
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrValid(nilArray)
//        }
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrValid(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
