// ----------------------------------------------------------------------------
//
//  StreamTypeCoderTests.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsObjC
import SwiftCommonsConcurrent
import XCTest

// ----------------------------------------------------------------------------

class StreamTypeCoderTests: XCTestCase
{
// MARK: - Tests

    internal func assertNoThrow(action: @escaping () -> Void) -> Void {
        var exception: NSException? = nil

        objcTry {
            action()
        }.objcCatch { e in
            exception = e
        }.objcFinally {
            XCTAssertNil(exception)
        }
    }

    internal func assertThrowsException(action: @escaping () -> Void) -> Void {
        var exception: NSException? = nil

        objcTry {
            action()
        }.objcCatch { e in
            exception = e
        }.objcFinally {
            XCTAssertNotNil(exception)
        }
    }
}

// ----------------------------------------------------------------------------
