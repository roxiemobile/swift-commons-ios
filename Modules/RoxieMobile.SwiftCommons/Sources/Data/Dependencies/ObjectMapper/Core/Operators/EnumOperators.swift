//
//  EnumOperators.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2016-09-26.
//  Copyright © 2016 hearst. All rights reserved.
//

import Foundation


// MARK:- RawRepresentable types

/// RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout T, right: Map) {
    left <~ (right, EnumTransform())
}

public func >>> <T: RawRepresentable>(left: T, right: Map) {
    left >>> (right, EnumTransform())
}

/// Optional RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout T?, right: Map) {
    left <~ (right, EnumTransform())
}

public func >>> <T: RawRepresentable>(left: T?, right: Map) {
    left >>> (right, EnumTransform())
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout T!, right: Map) {
    left <~ (right, EnumTransform())
}
#endif


// MARK:- Array of RawRepresentable types

/// Array of RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout [T], right: Map) {
    left <~ (right, EnumTransform())
}

public func >>> <T: RawRepresentable>(left: [T], right: Map) {
    left >>> (right, EnumTransform())
}

/// Optional array of RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout [T]?, right: Map) {
    left <~ (right, EnumTransform())
}

public func >>> <T: RawRepresentable>(left: [T]?, right: Map) {
    left >>> (right, EnumTransform())
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional array of RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout [T]!, right: Map) {
    left <~ (right, EnumTransform())
}
#endif


// MARK:- Dictionary of RawRepresentable types

/// Dictionary of RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout [String: T], right: Map) {
    left <~ (right, EnumTransform())
}

public func >>> <T: RawRepresentable>(left: [String: T], right: Map) {
    left >>> (right, EnumTransform())
}

/// Optional dictionary of RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout [String: T]?, right: Map) {
    left <~ (right, EnumTransform())
}

public func >>> <T: RawRepresentable>(left: [String: T]?, right: Map) {
    left >>> (right, EnumTransform())
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional dictionary of RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout [String: T]!, right: Map) {
    left <~ (right, EnumTransform())
}
#endif


// MARK:- Set of RawRepresentable types

/// Set of RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout Set<T>, right: Map) {
    left <~ (right, EnumTransform())
}

public func >>> <T: RawRepresentable>(left: Set<T>, right: Map) {
    left >>> (right, EnumTransform())
}

/// Optional set of RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout Set<T>?, right: Map) {
    left <~ (right, EnumTransform())
}

public func >>> <T: RawRepresentable>(left: Set<T>?, right: Map) {
    left >>> (right, EnumTransform())
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional set of RawRepresentable types
public func <~ <T: RawRepresentable>(left: inout Set<T>!, right: Map) {
    left <~ (right, EnumTransform())
}
#endif
