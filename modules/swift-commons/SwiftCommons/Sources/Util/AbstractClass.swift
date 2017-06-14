// ----------------------------------------------------------------------------
//
//  AbstractClass.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
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

    public func raiseAbstractMethodException(funcName: String = #function, _ file: StaticString = #file, _ line: UInt = #line) -> Never  {
        rxm_abstractMethodError(message: "Abstract method '\(funcName)' must be overridden in a subclass")
    }
}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

private func rxm_abstractMethodError(message: String, file: StaticString = #file, line: UInt = #line) -> Never
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
