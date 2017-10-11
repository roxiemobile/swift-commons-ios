// ----------------------------------------------------------------------------
//
//  GuardTests.AllNil.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testAllNil() {
        let method = "Guard.allNil"

// FIXME: C#
//        const string value = "value";
//        const string nilValue = null;
//        const string emptyValue = "";
//
//        string[] nilArray = null;
//        string[] emptyArray = {};
//
//
//        guardThrowsException("\(method)_Array") {
//            Guard.allNull(ToArray(nilValue, value))
//        }
//        guardThrowsException("\(method)_Array") {
//            Guard.allNull(ToArray(nilValue, emptyValue))
//        }
//
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNull(ToArray(nilValue, nilValue))
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNull(nilArray)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNull(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
