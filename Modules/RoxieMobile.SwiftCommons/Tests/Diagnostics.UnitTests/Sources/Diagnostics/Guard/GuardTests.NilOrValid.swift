// ----------------------------------------------------------------------------
//
//  GuardTests.NilOrValid.swift
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

    func testNilOrValid() {
        let method = "Guard.nilOrValid"

        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        guardThrowsException(method) {
            Guard.nilOrValid(notValidObject)
        }

        guardNotThrowsException(method) {
            Guard.nilOrValid(validObject)
        }
        guardNotThrowsException(method) {
            Guard.nilOrValid(nilObject)
        }
    }
}
