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
import SwiftCommonsCoreAbstractions
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testAllNotValid_Array() {
        let method = "Check.allNotValid"

        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()

        let array: Array<Validatable> = [notValidObject]
        let nilArray: Array<Validatable>? = nil
        let emptyArray = Array<Validatable>()


        checkThrowsError("\(method)_Array") {
            try Check.allNotValid([validObject])
        }
        checkThrowsError("\(method)_Array") {
            try Check.allNotValid([notValidObject, validObject])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allNotValid(array)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotValid(nilArray)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotValid(emptyArray)
        }

        // --

        let arrayOfModels: Array<NotValidModel>? = [NotValidModel()]
        let nilArrayOfModels: Array<NotValidModel>? = nil
        let emptyArrayOfModels = Array<NotValidModel>()


        checkThrowsError("\(method)_Array") {
            try Check.allNotValid([ValidModel()])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allNotValid(arrayOfModels)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotValid(nilArrayOfModels)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotValid(emptyArrayOfModels)
        }
    }

    func testAllNotValid_ArrayOfOptionals() {
        let method = "Check.allNotValid"

        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: Array<Validatable?>? = [notValidObject]
        let nilArray: Array<Validatable?>? = nil
        let emptyArray = Array<Validatable?>()

        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotValid([validObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotValid([nilObject])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotValid([notValidObject, validObject])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotValid(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotValid(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotValid(emptyArray)
        }

        // --

        let arrayOfModels: Array<NotValidModel?>? = [NotValidModel()]
        let nilArrayOfModels: Array<NotValidModel?>? = nil
        let emptyArrayOfModels = Array<NotValidModel?>()


        checkThrowsError("\(method)_Array") {
            try Check.allNotValid([ValidModel(), nil])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allNotValid(arrayOfModels)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotValid(nilArrayOfModels)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotValid(emptyArrayOfModels)
        }
    }
}

// ----------------------------------------------------------------------------
