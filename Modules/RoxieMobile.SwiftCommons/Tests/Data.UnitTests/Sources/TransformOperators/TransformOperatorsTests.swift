// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsConcurrent
import XCTest

// ----------------------------------------------------------------------------

class TransformOperatorsTests: XCTestCase
{
// MARK: - Methods

    internal func guardNegativeException(
            action: @escaping () -> ()
    ) -> Void {
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
