//
//  EnumOperators.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2016-09-26.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014-2018 Tristan Himmelman
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
