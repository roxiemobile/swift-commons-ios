// ----------------------------------------------------------------------------
//
//  AbstractClass.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public protocol AbstractClass {
    // Do nothing
}

// ----------------------------------------------------------------------------

extension AbstractClass
{
// MARK: - Methods

    @noreturn public func raiseAbstractMethodException(funcName: String = #function, _ file: StaticString = #file, _ line: UInt = #line) {
        rxm_abstractMethodError("Abstract method '\(funcName)' must be overridden in a subclass")
    }
}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

@noreturn private func rxm_abstractMethodError(message: String, file: StaticString = #file, line: UInt = #line)
{
#if DEBUG
    preconditionFailure(message)
#else
    AbstractMethodException(reason: "Fatal error: \(message)\nFile: \(file)\nLine: \(line)", userInfo: nil).raise()

    // NOTE: Suppress error "Return from a 'noreturn' function"
    fatalError(message)
#endif
}

// ----------------------------------------------------------------------------
