//
//  IntegerOperators.swift
//  ObjectMapper
//
//  Created by Suyeol Jeon on 17/02/2017.
//  Copyright © 2017 hearst. All rights reserved.
//

import Foundation

// MARK: - Signed Integer

/// SignedInteger mapping
public func <~ <T: SignedInteger>(left: inout T, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result: T? = toSignedInteger(right.currentValue)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}

/// Optional SignedInteger mapping
public func <~ <T: SignedInteger>(left: inout T?, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            let result: T? = toSignedInteger(right.currentValue)
            right.roxie_checkValue(result, optional: true)
            left = result

        case .toJSON:
            left >>> right
    }
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// ImplicitlyUnwrappedOptional SignedInteger mapping
public func <~ <T: SignedInteger>(left: inout T!, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result: T? = toSignedInteger(right.currentValue)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}
#endif


// MARK: - Unsigned Integer

/// UnsignedInteger mapping
public func <~ <T: UnsignedInteger>(left: inout T, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result: T? = toUnsignedInteger(right.currentValue)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}


/// Optional UnsignedInteger mapping
public func <~ <T: UnsignedInteger>(left: inout T?, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            let result: T? = toUnsignedInteger(right.currentValue)
            right.roxie_checkValue(result, optional: true)
            left = result

        case .toJSON:
            left >>> right
    }
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// ImplicitlyUnwrappedOptional UnsignedInteger mapping
public func <~ <T: UnsignedInteger>(left: inout T!, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result: T? = toUnsignedInteger(right.currentValue)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}
#endif

// MARK: - Casting Utils

/// Convert any value to `SignedInteger`.
private func toSignedInteger<T: SignedInteger>(_ value: Any?) -> T? {
    guard
        let value = value,
        case let number as NSNumber = value
    else {
        return nil
    }

    if T.self == Int.self, let x = Int(exactly: number.int64Value) {
        return T.init(x)
    }
    if T.self == Int8.self, let x = Int8(exactly: number.int64Value) {
        return T.init(x)
    }
    if T.self == Int16.self, let x = Int16(exactly: number.int64Value) {
        return T.init(x)
    }
    if T.self == Int32.self, let x = Int32(exactly: number.int64Value) {
        return T.init(x)
    }
    if T.self == Int64.self, let x = Int64(exactly: number.int64Value) {
        return T.init(x)
    }

    return nil
}

/// Convert any value to `UnsignedInteger`.
private func toUnsignedInteger<T: UnsignedInteger>(_ value: Any?) -> T? {
    guard
        let value = value,
        case let number as NSNumber = value
    else {
        return nil
    }

    if T.self == UInt.self, let x = UInt(exactly: number.uint64Value) {
        return T.init(x)
    }
    if T.self == UInt8.self, let x = UInt8(exactly: number.uint64Value) {
        return T.init(x)
    }
    if T.self == UInt16.self, let x = UInt16(exactly: number.uint64Value) {
        return T.init(x)
    }
    if T.self == UInt32.self, let x = UInt32(exactly: number.uint64Value) {
        return T.init(x)
    }
    if T.self == UInt64.self, let x = UInt64(exactly: number.uint64Value) {
        return T.init(x)
    }

    return nil
}
