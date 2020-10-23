// ----------------------------------------------------------------------------
//
//  ObjectMapperTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsConcurrent
import XCTest

// ----------------------------------------------------------------------------

class ObjectMapperTests: XCTestCase {

// MARK: - Methods

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
