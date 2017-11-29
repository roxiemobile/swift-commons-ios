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
        roxie_abstractMethodError(message: "Abstract method ‘\(funcName)’ must be overridden in a subclass.")
    }
}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

fileprivate func roxie_abstractMethodError(message: String, file: StaticString = #file, line: UInt = #line) -> Never {
    let logMessage = "Fatal error: \(message)\nFile: \(file)\nLine: \(line)"

#if DEBUG
    preconditionFailure(logMessage)
#else
    AbstractMethodException(reason: logMessage, userInfo: nil).raise()

    // Suppress error "Return from a ‘noreturn’ function"
    fatalError(logMessage)
#endif
}

// ----------------------------------------------------------------------------
