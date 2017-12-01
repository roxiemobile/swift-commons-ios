// ----------------------------------------------------------------------------
//
//  GuardTests.NotBlank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testNotBlank() {
        let method = "Guard.notBlank"

        let value = "value"
        let nilValue: String? = nil
        let emptyValue = ""
        let whitespaceValue = " \t\r\n"


        guardThrowsException(method) {
            Guard.notBlank(nilValue)
        }
        guardThrowsException(method) {
            Guard.notBlank(emptyValue)
        }
        guardThrowsException(method) {
            Guard.notBlank(whitespaceValue)
        }

        guardNotThrowsException(method) {
            Guard.notBlank(value)
        }
    }
}

// ----------------------------------------------------------------------------
