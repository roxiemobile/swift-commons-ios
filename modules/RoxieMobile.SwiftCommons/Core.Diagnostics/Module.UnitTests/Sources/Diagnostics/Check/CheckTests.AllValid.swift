// ----------------------------------------------------------------------------
//
//  CheckTests.AllValid.swift
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

    func testAllValid_Array() {
        let method = "Check.allValid"

//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable]? = [validObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        checkThrowsError("\(method)_Array") {
//            try Check.allValid([notValidObject])
//        }
//        checkThrowsError("\(method)_Array") {
//            try Check.allValid([validObject, notValidObject])
//        }
//
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allValid(array)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allValid(nilArray)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allValid(emptyArray)
//        }

        XCTFail(method)
    }

    func testAllValid_ArrayOfOptionals() {
        let method = "Check.allValid"

//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [validObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allValid([notValidObject])
//        }
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allValid([validObject, nilObject])
//        }
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allValid([validObject, notValidObject])
//        }
//
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allValid(array)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allValid(nilArray)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allValid(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
