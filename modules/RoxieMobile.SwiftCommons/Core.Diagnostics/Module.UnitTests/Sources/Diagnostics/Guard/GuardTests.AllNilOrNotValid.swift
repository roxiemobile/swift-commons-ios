// ----------------------------------------------------------------------------
//
//  GuardTests.AllNilOrNotValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testAllNilOrNotValid_Array() {
        let method = "Guard.allNilOrNotValid"

//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable] = [notValidObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        guardThrowsException("\(method)_Array") {
//            Guard.allNilOrNotValid([validObject])
//        }
//        guardThrowsException("\(method)_Array") {
//            Guard.allNilOrNotValid([notValidObject, validObject])
//        }
//
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNilOrNotValid(array)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNilOrNotValid(nilArray)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNilOrNotValid(emptyArray)
//        }

        XCTFail(method)
    }

    func testAllNilOrNotValid_ArrayOfOptionals() {
        let method = "Guard.allNilOrNotValid"

//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [notValidObject, nilObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrNotValid([validObject])
//        }
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrNotValid([nilObject, validObject])
//        }
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrNotValid([notValidObject, validObject])
//        }
//
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrNotValid(array)
//        }
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrNotValid(nilArray)
//        }
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNilOrNotValid(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
