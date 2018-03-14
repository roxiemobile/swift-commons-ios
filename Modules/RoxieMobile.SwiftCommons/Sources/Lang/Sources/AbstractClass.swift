// ----------------------------------------------------------------------------
//
//  AbstractClass.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public protocol AbstractClass {
    // Do nothing
}

// ----------------------------------------------------------------------------

extension AbstractClass
{
// MARK: - Methods

    public func raiseAbstractMethodException(funcName: String = #function, _ file: StaticString = #file, _ line: UInt = #line) -> Never {
        roxie_abstractMethod_raiseException(message: "Abstract method ‘\(funcName)’ must be overridden in a subclass.")
    }
}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

fileprivate func roxie_abstractMethod_raiseException(message: String, file: StaticString = #file, line: UInt = #line) -> Never {
    let logMessage = "Fatal error: \(message)\nFile: \(file)\nLine: \(line)"

#if DEBUG
    if Roxie.isRunningXCTest {
        AbstractMethodException(reason: logMessage, userInfo: nil).raise()
    } else {
        preconditionFailure(logMessage)
    }
#else
    AbstractMethodException(reason: logMessage, userInfo: nil).raise()
#endif

    // Suppress error "Return from a ‘noreturn’ function"
    fatalError(logMessage)
}

// ----------------------------------------------------------------------------
