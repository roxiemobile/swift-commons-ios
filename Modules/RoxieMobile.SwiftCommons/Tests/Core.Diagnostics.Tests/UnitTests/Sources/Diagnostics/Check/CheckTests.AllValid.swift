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
import SwiftCommonsCoreAbstractions
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testAllValid_Array() {
        let method = "Check.allValid"

        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: Array<Validatable>? = [validObject]
        let nilArray: Array<Validatable>? = nil
        let emptyArray = Array<Validatable>()


        checkThrowsError("\(method)_Array") {
            try Check.allValid([notValidObject])
        }
        checkThrowsError("\(method)_Array") {
            try Check.allValid([validObject, notValidObject])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allValid(array)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allValid(nilArray)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allValid(emptyArray)
        }

        // --

        let arrayOfModels: Array<ValidModel>? = [ValidModel()]
        let nilArrayOfModels: Array<ValidModel>? = nil
        let emptyArrayOfModels = Array<ValidModel>()


        checkThrowsError("\(method)_Array") {
            try Check.allValid([NotValidModel()])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allValid(arrayOfModels)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allValid(nilArrayOfModels)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allValid(emptyArrayOfModels)
        }
    }

    func testAllValid_ArrayOfOptionals() {
        let method = "Check.allValid"

        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: Array<Validatable?>? = [validObject]
        let nilArray: Array<Validatable?>? = nil
        let emptyArray = Array<Validatable?>()


        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allValid([notValidObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allValid([validObject, nilObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allValid([validObject, notValidObject])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allValid(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allValid(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allValid(emptyArray)
        }

        // --

        let arrayOfModels: Array<ValidModel?>? = [ValidModel()]
        let nilArrayOfModels: Array<ValidModel?>? = nil
        let emptyArrayOfModels = Array<ValidModel?>()


        checkThrowsError("\(method)_Array") {
            try Check.allValid([NotValidModel(), nil])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allValid(arrayOfModels)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allValid(nilArrayOfModels)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allValid(emptyArrayOfModels)
        }
    }
}

// ----------------------------------------------------------------------------
