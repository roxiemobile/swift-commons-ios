// ----------------------------------------------------------------------------
//
//  CheckTests.AllNilOrValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testAllNilOrValid_Array() {
        let method = "Check.allNilOrValid"

//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable] = [validObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        checkThrowsError("\(method)_Array") {
//            try Check.allNilOrValid([notValidObject])
//        }
//        checkThrowsError("\(method)_Array") {
//            try Check.allNilOrValid([validObject, notValidObject])
//        }
//
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNilOrValid(array)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNilOrValid(nilArray)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNilOrValid(emptyArray)
//        }

        XCTFail(method)
    }

    func testAllNilOrValid_ArrayOfOptionals() {
        let method = "Check.allNilOrValid"

//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [validObject, nilObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrValid([notValidObject])
//        }
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrValid([validObject, notValidObject])
//        }
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrValid([nilObject, notValidObject])
//        }
//
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrValid(array)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrValid(nilArray)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNilOrValid(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
