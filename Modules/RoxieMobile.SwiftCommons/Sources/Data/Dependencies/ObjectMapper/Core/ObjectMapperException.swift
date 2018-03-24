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
import SwiftCommonsLang
import SwiftCommonsLogging

// ----------------------------------------------------------------------------

public final class ObjectMapperException: NSException
{
// MARK: - Construction

    /// Initializes and returns a newly created exception object.
    ///
    /// - Parameters:
    ///   - reason: A human-readable message string summarizing the reason for the exception.
    ///   - userInfo: A dictionary containing user-defined information relating to the exception.
    ///
    public init(reason: String?, userInfo: [AnyHashable: Any]? = nil) {
        super.init(name: Inner.ExceptionName, reason: reason, userInfo: userInfo)
    }

    /// Returns an object initialized from data in a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: ObjectMapperException.self))
    }
}

// ----------------------------------------------------------------------------

internal func roxie_objectMapper_raiseException(message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    let logMessage = "Fatal error: \(message())\nFile: \(file)\nLine: \(line)"

#if DEBUG
    if Roxie.isRunningXCTest {
        ObjectMapperException(reason: logMessage, userInfo: nil).raise()
    } else {
        preconditionFailure(logMessage)
    }
#else
    ObjectMapperException(reason: logMessage, userInfo: nil).raise()
#endif

    // Suppress error "Return from a ‘noreturn’ function"
    Swift.fatalError(logMessage)
}

// ----------------------------------------------------------------------------

internal func roxie_objectMapper_assertionFailure(tag: String, message: @autoclosure () -> String, error: Error? = nil, file: StaticString = #file, line: UInt = #line) {
    let logMessage = "Assertion violated: \(message())\nFile: \(file)\nLine: \(line)"
    Logger.e(tag, logMessage, error)
    assertionFailure(logMessage)
}

// ----------------------------------------------------------------------------
