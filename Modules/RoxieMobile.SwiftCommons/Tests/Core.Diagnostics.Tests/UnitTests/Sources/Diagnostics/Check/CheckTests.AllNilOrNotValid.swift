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
import SwiftCommonsCoreAbstractions
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testAllNilOrNotValid_ArrayOfOptionals() {
        let method = "Check.allNilOrNotValid"

        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: Array<Validatable?>? = [notValidObject, nilObject]
        let nilArray: Array<Validatable?>? = nil
        let emptyArray = Array<Validatable?>()


        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrNotValid([validObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrNotValid([nilObject, validObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrNotValid([notValidObject, validObject])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrNotValid(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrNotValid(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNilOrNotValid(emptyArray)
        }
    }

    func testAllNilOrNotValid_ArrayOfOptionals_Model() {
        let method = "Check.allNilOrNotValid"

        let validObject: ValidModel? = ValidModel()
        let nilValidObject: ValidModel? = nil

        let notValidObject: NotValidModel? = NotValidModel()
        let nilNotValidObject: NotValidModel? = nil

        let array: Array<NotValidModel?>? = [notValidObject, nilNotValidObject]
        let nilArray: Array<NotValidModel?>? = nil
        let emptyArray = Array<NotValidModel?>()


        checkThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrNotValid([validObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrNotValid([nilValidObject, validObject])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrNotValid(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrNotValid(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals_Model") {
            try Check.allNilOrNotValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
