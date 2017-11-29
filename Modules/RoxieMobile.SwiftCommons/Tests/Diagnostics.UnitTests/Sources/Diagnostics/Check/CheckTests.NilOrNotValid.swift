// ----------------------------------------------------------------------------
//
//  CheckTests.NilOrNotValid.swift
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

extension CheckTests
{
// MARK: - Tests

    func testNilOrNotValid() {
        let method = "Check.nilOrNotValid"

        let validObject: Validatable = ValidModel()
        let nilObject: Validatable? = nil
        let notValidObject: Validatable = NotValidModel()


        checkThrowsError(method) {
            try Check.nilOrNotValid(validObject)
        }

        checkNotThrowsError(method) {
            try Check.nilOrNotValid(nilObject)
        }
        checkNotThrowsError(method) {
            try Check.nilOrNotValid(notValidObject)
        }
    }
}

// ----------------------------------------------------------------------------
