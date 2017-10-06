// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotValid.swift
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

    func testAllNotValid_Array() {
        let method = "Check.allNotValid"

//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable] = [notValidObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        checkThrowsError("\(method)_Array") {
//            try Check.allNotValid([validObject])
//        }
//        checkThrowsError("\(method)_Array") {
//            try Check.allNotValid([notValidObject, validObject])
//        }
//
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNotValid(array)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNotValid(nilArray)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNotValid(emptyArray)
//        }

        XCTFail(method)
    }

    func testAllNotValid_ArrayOfOptionals() {
        let method = "Check.allNotValid"

//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [notValidObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotValid([validObject])
//        }
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotValid([nilObject])
//        }
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotValid([notValidObject, validObject])
//        }
//
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotValid(array)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotValid(nilArray)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotValid(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
