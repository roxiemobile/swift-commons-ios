// ----------------------------------------------------------------------------
//
//  GuardTests.Valid.swift
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

    func testValid() {
        let method = "Guard.valid"

        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()


        guardThrowsException(method) {
            Guard.valid(notValidObject)
        }

        guardNotThrowsException(method) {
            Guard.valid(validObject)
        }
    }
}
