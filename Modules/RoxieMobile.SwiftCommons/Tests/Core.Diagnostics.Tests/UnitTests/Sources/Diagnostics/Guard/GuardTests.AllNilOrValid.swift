// ----------------------------------------------------------------------------
//
//  GuardTests.AllNilOrValid.swift
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

    func testAllNilOrValid_ArrayOfOptionals() {
        let method = "Guard.allNilOrValid"

        let validObject: Validatable? = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable? = NotValidModel()

        let array: [Validatable?]? = [validObject, nilObject]
        let nilArray: [Validatable?]? = nil
        let emptyArray = [Validatable?]()


        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrValid([notValidObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrValid([validObject, notValidObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrValid([nilObject, notValidObject])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrValid(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrValid(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNilOrValid(emptyArray)
        }
    }

    func testAllNilOrValid_ArrayOfOptionals_Model() {
        let method = "Guard.allNilOrValid"

        let validObject: ValidModel? = ValidModel()
        let nilValidObject: ValidModel? = nil

        let notValidObject: NotValidModel? = NotValidModel()
        let nilNotValidObject: NotValidModel? = nil

        let array: Array<ValidModel?>? = [validObject, nilValidObject]
        let nilArray: Array<ValidModel?>? = nil
        let emptyArray = Array<ValidModel?>()


        guardThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrValid([notValidObject])
        }
        guardThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrValid([nilNotValidObject, notValidObject])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrValid(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrValid(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals_Model") {
            Guard.allNilOrValid(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------

