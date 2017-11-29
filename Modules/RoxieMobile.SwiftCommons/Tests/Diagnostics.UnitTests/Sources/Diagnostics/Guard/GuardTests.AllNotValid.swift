// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotValid.swift
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

extension GuardTests
{
// MARK: - Tests

    func testAllNotValid_Array() {
        let method = "Guard.allNotValid"

        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: Array<Validatable> = [notValidObject]
        let nilArray: Array<Validatable>? = nil
        let emptyArray = Array<Validatable>()


        guardThrowsException("\(method)_Array") {
            Guard.allNotValid([validObject])
        }
        guardThrowsException("\(method)_Array") {
            Guard.allNotValid([notValidObject, validObject])
        }

        guardNotThrowsException("\(method)_Array") {
            Guard.allNotValid(array)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allNotValid(nilArray)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allNotValid(emptyArray)
        }

        // --

        let arrayOfModels: Array<NotValidModel>? = [NotValidModel()]
        let nilArrayOfModels: Array<NotValidModel>? = nil
        let emptyArrayOfModels = Array<NotValidModel>()


        guardThrowsException("\(method)_Array") {
            Guard.allNotValid([ValidModel()])
        }

        guardNotThrowsException("\(method)_Array") {
            Guard.allNotValid(arrayOfModels)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allNotValid(nilArrayOfModels)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allNotValid(emptyArrayOfModels)
        }
    }

    func testAllNotValid_ArrayOfOptionals() {
        let method = "Guard.allNotValid"

        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: Array<Validatable?>? = [notValidObject]
        let nilArray: Array<Validatable?>? = nil
        let emptyArray = Array<Validatable?>()


        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotValid([validObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotValid([nilObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotValid([notValidObject, validObject])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotValid(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotValid(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotValid(emptyArray)
        }

        // --

        let arrayOfModels: Array<NotValidModel?>? = [NotValidModel()]
        let nilArrayOfModels: Array<NotValidModel?>? = nil
        let emptyArrayOfModels = Array<NotValidModel?>()


        guardThrowsException("\(method)_Array") {
            Guard.allNotValid([ValidModel(), nil])
        }

        guardNotThrowsException("\(method)_Array") {
            Guard.allNotValid(arrayOfModels)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allNotValid(nilArrayOfModels)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allNotValid(emptyArrayOfModels)
        }
    }
}

// ----------------------------------------------------------------------------
