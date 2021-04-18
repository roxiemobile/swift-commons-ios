// ----------------------------------------------------------------------------
//
//  GuardTests.NilOrNotValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import SwiftCommonsAbstractions
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests {

// MARK: - Tests

    func testNilOrNotValid() {
        let method = "Guard.nilOrNotValid"

        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        guardThrowsException(method) {
            Guard.nilOrNotValid(validObject)
        }

        guardNotThrowsException(method) {
            Guard.nilOrNotValid(nilObject)
        }
        guardNotThrowsException(method) {
            Guard.nilOrNotValid(notValidObject)
        }
    }
}
