// ----------------------------------------------------------------------------
//
//  CheckTests.AllNil.swift
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

    func testAllNil() {
        let method = "Check.AllNil"

// FIXME: C#
//        const string value = "value"
//        const string nilValue = null
//        const string emptyValue = ""
//
//        string[] nilArray = null
//        string[] emptyArray = {}
//
//
//        checkThrowsError("\(method)_Array",
//            Check.allNil(ToArray(nilValue, value))
//        }
//        checkThrowsError("\(method)_Array",
//            Check.allNil(ToArray(nilValue, emptyValue))
//        }
//
//        checkNotThrowsError("\(method)_Array",
//            Check.allNil(ToArray(nilValue, nilValue))
//        }
//        checkNotThrowsError("\(method)_Array",
//            Check.allNil(nilArray)
//        }
//        checkNotThrowsError("\(method)_Array",
//            Check.allNil(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
