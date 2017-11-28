// ----------------------------------------------------------------------------
//
//  GuardTests.NotValid.swift
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

    func testNotValid() {
        let method = "Guard.notValid"

        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()


        guardThrowsException(method) {
            Guard.notValid(validObject)
        }

        guardNotThrowsException(method) {
            Guard.notValid(notValidObject)
        }
    }
}

// ----------------------------------------------------------------------------
