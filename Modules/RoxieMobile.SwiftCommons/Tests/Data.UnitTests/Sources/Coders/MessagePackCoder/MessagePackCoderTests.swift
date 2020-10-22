// ----------------------------------------------------------------------------
//
//  MessagePackCoderTests.swift
//
//  @author     Aleksandr Serov <serov-ae@roxiemobile.com>
//  @copyright  Copyright (c) 2020, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsConcurrent
import XCTest

// ----------------------------------------------------------------------------

final class MessagePackCoderTests: XCTestCase {
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
        let encoder = MessagePackEncoder(forWritingInto: nil, failurePolicy: policy, sortDictionaryKeys: true)
        encoder.encode(object)

        XCTAssert(encoder.error == nil)
        XCTAssert(encoder.encodedData.isNotEmpty)

        // Decode
        let decoder = MessagePackDecoder(forReadingFrom: encoder.encodedData, failurePolicy: policy)
        let decodedObject = decoder.decodeObject() as? T

        XCTAssert(decoder.error == nil)
        XCTAssert(decodedObject != nil)

        // Done
        return decodedObject
    }
}
