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

    @noreturn public func raiseAbstractMethodException(funcName: String, _ file: StaticString = #file, _ line: UInt = #line)
    {
        let message = "Abstract method '\(funcName)' must be overridden in a subclass"

#if DEBUG
        preconditionFailure(message)
#else
        AbstractMethodException(reason: "Fatal error: \(message)\nFile: \(file)\nLine: \(line)", userInfo: nil).raise()

        // NOTE: Suppress error "Return from a 'noreturn' function"
        fatalError(message)
#endif
    }
}

// ----------------------------------------------------------------------------
