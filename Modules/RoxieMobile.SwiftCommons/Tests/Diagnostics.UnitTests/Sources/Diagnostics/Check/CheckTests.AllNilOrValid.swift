// ----------------------------------------------------------------------------
//
//  CheckTests.AllNilOrValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import SwiftCommonsAbstractions
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testAllNilOrValid_ArrayOfOptionals() {
        let method = "Check.allNilOrValid"

        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: Array<Validatable?>? = [validObject, nilObject]
        let nilArray: Array<Validatable?>? = nil
        let emptyArray = Array<Validatable?>()


        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrValid([notValidObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrValid([validObject, notValidObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrValid([nilObject, notValidObject])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrValid(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrValid(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrValid(emptyArray)
        }
    }

    func testAllNilOrValid_ArrayOfOptionals_Model() {
        let method = "Check.allNilOrValid"

        let validObject: ValidModel? = ValidModel()
        let nilValidObject: ValidModel? = nil

        let notValidObject: NotValidModel? = NotValidModel()
        let nilNotValidObject: NotValidModel? = nil

        let array: Array<ValidModel?>? = [validObject, nilValidObject]
        let nilArray: Array<ValidModel?>? = nil
        let emptyArray = Array<ValidModel?>()


        checkThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrValid([notValidObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrValid([nilNotValidObject, notValidObject])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrValid(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrValid(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
