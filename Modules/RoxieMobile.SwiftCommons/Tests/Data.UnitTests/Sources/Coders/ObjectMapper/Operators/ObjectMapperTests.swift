// ----------------------------------------------------------------------------
//
//  ObjectMapperTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsConcurrent
import XCTest

// ----------------------------------------------------------------------------

class ObjectMapperTests: XCTestCase {

// MARK: - Methods

    internal func assertNoThrow(action: @escaping () -> Void) {
        var exception: NSException?

        objcTry {
            action()
        }.objcCatch { ex in
            exception = ex
        }.objcFinally {
            XCTAssertNil(exception)
        }
    }

    internal func assertThrowsException(action: @escaping () -> Void) {
        var exception: NSException?

        objcTry {
            action()
        }.objcCatch { ex in
            exception = ex
        }.objcFinally {
            XCTAssertNotNil(exception)
        }
    }
}
