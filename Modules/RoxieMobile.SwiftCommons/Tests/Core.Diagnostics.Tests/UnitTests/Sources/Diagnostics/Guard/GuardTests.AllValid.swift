// ----------------------------------------------------------------------------
//
//  GuardTests.AllValid.swift
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

extension GuardTests
{
// MARK: - Tests

    func testAllValid_Array() {
        let method = "Guard.allValid"

        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: Array<Validatable>? = [validObject]
        let nilArray: Array<Validatable>? = nil
        let emptyArray = Array<Validatable>()


        guardThrowsException("\(method)_Array") {
            Guard.allValid([notValidObject])
        }
        guardThrowsException("\(method)_Array") {
            Guard.allValid([validObject, notValidObject])
        }

        guardNotThrowsException("\(method)_Array") {
            Guard.allValid(array)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allValid(nilArray)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allValid(emptyArray)
        }

        // --

        let arrayOfModels: Array<ValidModel>? = [ValidModel()]
        let nilArrayOfModels: Array<ValidModel>? = nil
        let emptyArrayOfModels = Array<ValidModel>()


        guardThrowsException("\(method)_Array") {
            Guard.allValid([NotValidModel()])
        }

        guardNotThrowsException("\(method)_Array") {
            Guard.allValid(arrayOfModels)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allValid(nilArrayOfModels)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allValid(emptyArrayOfModels)
        }
    }

    func testAllValid_ArrayOfOptionals() {
        let method = "Guard.allValid"

        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: Array<Validatable?>? = [validObject]
        let nilArray: Array<Validatable?>? = nil
        let emptyArray = Array<Validatable?>()


        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allValid([notValidObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allValid([validObject, nilObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allValid([validObject, notValidObject])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allValid(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allValid(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allValid(emptyArray)
        }

        // --

        let arrayOfModels: Array<ValidModel?>? = [ValidModel()]
        let nilArrayOfModels: Array<ValidModel?>? = nil
        let emptyArrayOfModels = Array<ValidModel?>()


        guardThrowsException("\(method)_Array") {
            Guard.allValid([NotValidModel(), nil])
        }

        guardNotThrowsException("\(method)_Array") {
            Guard.allValid(arrayOfModels)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allValid(nilArrayOfModels)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allValid(emptyArrayOfModels)
        }
    }
}

// ----------------------------------------------------------------------------
