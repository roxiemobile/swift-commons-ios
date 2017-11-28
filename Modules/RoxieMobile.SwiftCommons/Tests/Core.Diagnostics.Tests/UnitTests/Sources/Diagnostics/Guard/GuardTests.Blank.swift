// ----------------------------------------------------------------------------
//
//  GuardTests.Blank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testBlank() {
        let method = "Guard.blank"

        let value = "value"
        let nilValue: String? = nil
        let emptyValue = ""
        let whitespaceValue = " \t\r\n"


        guardThrowsException(method) {
            Guard.blank(value)
        }

        guardNotThrowsException(method) {
            Guard.blank(nilValue)
        }
        guardNotThrowsException(method) {
            Guard.blank(emptyValue)
        }
        guardNotThrowsException(method) {
            Guard.blank(whitespaceValue)
        }
    }
}

// ----------------------------------------------------------------------------
