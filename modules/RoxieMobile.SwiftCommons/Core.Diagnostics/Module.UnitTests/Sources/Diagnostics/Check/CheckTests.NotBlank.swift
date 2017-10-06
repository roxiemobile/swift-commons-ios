// ----------------------------------------------------------------------------
//
//  CheckTests.NotBlank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testNotBlank() {
        let method = "Check.notBlank"

        let value = "value"
        let nilValue: String? = nil
        let emptyValue = ""
        let whitespaceValue = " \t\r\n"


        checkThrowsError(method) {
            try Check.notBlank(nilValue)
        }
        checkThrowsError(method) {
            try Check.notBlank(emptyValue)
        }
        checkThrowsError(method) {
            try Check.notBlank(whitespaceValue)
        }

        checkNotThrowsError(method) {
            try Check.notBlank(value)
        }
    }
}

// ----------------------------------------------------------------------------
