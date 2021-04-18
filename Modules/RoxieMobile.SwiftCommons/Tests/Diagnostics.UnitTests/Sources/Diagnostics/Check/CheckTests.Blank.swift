// ----------------------------------------------------------------------------
//
//  CheckTests.Blank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests {

// MARK: - Tests

    func testBlank() {
        let method = "Check.blank"

        let value = "value"
        let nilValue: String? = nil
        let emptyValue = ""
        let whitespaceValue = " \t\r\n"


        checkThrowsError(method) {
            try Check.blank(value)
        }

        checkNotThrowsError(method) {
            try Check.blank(nilValue)
        }
        checkNotThrowsError(method) {
            try Check.blank(emptyValue)
        }
        checkNotThrowsError(method) {
            try Check.blank(whitespaceValue)
        }
    }
}
