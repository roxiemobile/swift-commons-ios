// ----------------------------------------------------------------------------
//
//  GuardTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import SwiftCommonsConcurrent
import XCTest

// ----------------------------------------------------------------------------

final class GuardTests: XCTestCase
{
// MARK: - Methods

    internal func guardThrowsException(
            _ method: String,
            exceptionType: NSException.Type = GuardException.self,
            file: StaticString = #file,
            line: UInt = #line,
            action: @escaping () -> Void
    ) -> Void {

        XCTAssert(!method.isEmpty, "‘method’ is empty");
        var cause: NSException? = nil

        objcTry {
            action()
        }.objcCatch { exception in
            cause = exception
        }

        if let exception = cause {
            if type(of: exception) == exceptionType {
                // Do nothing
            }
            else {
                XCTFail("\(prefix(file, line)) - \(method): Unknown exception is thrown")
            }
        }
        else {
            XCTFail("\(prefix(file, line)) - \(method): Method not thrown an exception")
        }
    }

    internal func guardNotThrowsException(
            _ method: String,
            exceptionType: NSException.Type = GuardException.self,
            file: StaticString = #file,
            line: UInt = #line,
            action: @escaping () -> Void
    ) -> Void {

        XCTAssert(!method.isEmpty, "‘method’ is empty");
        var cause: NSException? = nil

        objcTry {
            action()
        }.objcCatch { exception in
            cause = exception
        }

        if let exception = cause {
            if type(of: exception) == exceptionType {
                XCTFail("\(prefix(file, line)) - \(method): Method thrown an exception")
            }
            else {
                XCTFail("\(prefix(file, line)) - \(method): Unknown exception is thrown")
            }
        }
        else {
            // Do nothing
        }
    }

// MARK: - Private Methods

    private func prefix(_ file: StaticString, _ line: UInt) -> String {
        let fileURL = URL(fileURLWithPath: String(describing: file))
        return "\(fileURL.lastPathComponent):\(line)"
    }
}

// ----------------------------------------------------------------------------
