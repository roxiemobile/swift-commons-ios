// ----------------------------------------------------------------------------
//
//  TypedStreamCoderTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsConcurrent
import XCTest

// ----------------------------------------------------------------------------

final class TypedStreamCoderTests: XCTestCase
{
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

    internal func cloneSimpleObject<T: Equatable>(_ object: T) -> T? {
        let policy: CodingFailurePolicy = .raiseException

        // Encode
        let encoder = TypedStreamEncoder(forWritingInto: nil, failurePolicy: policy)
        encoder.encode(object)
        

        XCTAssert(encoder.error == nil)
        XCTAssert(encoder.encodedData.isNotEmpty)

        // Decode
        let decoder = TypedStreamDecoder(forReadingFrom: encoder.encodedData, failurePolicy: policy)
        let decodedObject = decoder.decodeObject() as? T

        XCTAssert(decoder.error == nil)
        XCTAssert(decodedObject != nil)

        // Done
        return decodedObject
    }
}

// ----------------------------------------------------------------------------
