// ----------------------------------------------------------------------------
//
//  CheckTests.NilOrValid.swift
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

extension CheckTests {

// MARK: - Tests

    func testNilOrValid() {
        let method = "Check.nilOrValid"

        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        checkThrowsError(method) {
            try Check.nilOrValid(notValidObject)
        }

        checkNotThrowsError(method) {
            try Check.nilOrValid(validObject)
        }
        checkNotThrowsError(method) {
            try Check.nilOrValid(nilObject)
        }
    }
}
