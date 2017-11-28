// ----------------------------------------------------------------------------
//
//  GuardTests.AllNilOrNotValid.swift
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

    func testAllNilOrNotValid_ArrayOfOptionals() {
        let method = "Guard.allNilOrNotValid"

        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: Array<Validatable?>? = [notValidObject, nilObject]
        let nilArray: Array<Validatable?>? = nil
        let emptyArray = Array<Validatable?>()


        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrNotValid([validObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrNotValid([nilObject, validObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrNotValid([notValidObject, validObject])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrNotValid(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrNotValid(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrNotValid(emptyArray)
        }
    }


    func testAllNilOrNotValid_ArrayOfOptionals_Model() {
        let method = "Guard.allNilOrNotValid"

        let validObject: ValidModel? = ValidModel()
        let nilValidObject: ValidModel? = nil

        let notValidObject: NotValidModel? = NotValidModel()
        let nilNotValidObject: NotValidModel? = nil

        let array: Array<NotValidModel?>? = [notValidObject, nilNotValidObject]
        let nilArray: Array<NotValidModel?>? = nil
        let emptyArray = Array<NotValidModel?>()


        guardThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrNotValid([validObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrNotValid([nilValidObject, validObject])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrNotValid(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrNotValid(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrNotValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
