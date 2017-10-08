// ----------------------------------------------------------------------------
//
//  ObjectMapperException.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

public final class ObjectMapperException: NSException
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public init(reason: String?, userInfo: [AnyHashable: Any]? = nil) {
        super.init(name: Inner.ExceptionName, reason: reason, userInfo: userInfo)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: ObjectMapperException.self))
    }
}

// ----------------------------------------------------------------------------

func roxie_objectMapper_raiseException(message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    let logMessage = "Fatal error: \(message())\nFile: \(file)\nLine: \(line)"

#if DEBUG
    preconditionFailure(logMessage)
#else
    ObjectMapperException(reason: logMessage, userInfo: nil).raise()

    // Suppress error "Return from a ‘noreturn’ function"
    Swift.fatalError(logMessage)
#endif
}

// ----------------------------------------------------------------------------

func roxie_objectMapper_assertionFailure(tag: String, message: @autoclosure () -> String, error: Error? = nil, file: StaticString = #file, line: UInt = #line) {
    let logMessage = "Assertion violated: \(message())\nFile: \(file)\nLine: \(line)"
    Logger.e(tag, logMessage, error)
    assertionFailure(logMessage)
}

// ----------------------------------------------------------------------------
