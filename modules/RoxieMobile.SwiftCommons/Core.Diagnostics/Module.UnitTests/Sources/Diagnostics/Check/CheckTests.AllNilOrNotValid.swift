// ----------------------------------------------------------------------------
//
//  CheckTests.AllNilOrNotValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testAllNilOrNotValid_Array() {
        let method = "Check.allNilOrNotValid"

//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable] = [notValidObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        checkThrowsError("\(method)_Array") {
//            try Check.allNilOrNotValid([validObject])
//        }
//        checkThrowsError("\(method)_Array") {
//            try Check.allNilOrNotValid([notValidObject, validObject])
//        }
//
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNilOrNotValid(array)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNilOrNotValid(nilArray)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNilOrNotValid(emptyArray)
//        }

        XCTFail(method)
    }

    func testAllNilOrNotValid_ArrayOfOptionals() {
        let method = "Check.allNilOrNotValid"

//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [notValidObject, nilObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrNotValid([validObject])
//        }
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrNotValid([nilObject, validObject])
//        }
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrNotValid([notValidObject, validObject])
//        }
//
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrNotValid(array)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrNotValid(nilArray)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrNotValid(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
