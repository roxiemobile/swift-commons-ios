// ----------------------------------------------------------------------------
//
//  FatalErrorException.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class FatalErrorException: NSException
{
// MARK: - Constants

    public init(reason aReason: String?, userInfo aUserInfo: [NSObject: AnyObject]?) {
        super.init(name: NSExceptionName(rawValue: FatalError.Domain), reason: aReason, userInfo: aUserInfo)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - Constants

    private struct FatalError {
        static let Domain = "FatalErrorDomain"
    }
}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

public func rxm_fatalError(message: String, file: StaticString = #file, line: UInt = #line) -> Never
{
#if DEBUG
    preconditionFailure(message)
#else
    FatalErrorException(reason: "Fatal error: \(message)\nFile: \(file)\nLine: \(line)", userInfo: nil).raise()

    // NOTE: Suppress error "Return from a 'noreturn' function"
    fatalError(message)
#endif
}

// ----------------------------------------------------------------------------

public func rxm_fatalError(message: String, error: NSError?, file: StaticString = #file, line: UInt = #line) -> Never
{
    var logMessage = message

    // Add error description
    if let err = error
    {
        if !logMessage.isEmpty {
            logMessage += "\nCaused by error: "
        }

        logMessage += "\(err.domain)(code: \(err.code))"

        if let message = error?.localizedDescription.trim(), !message.isEmpty {
            logMessage += " with reason: \(message)"
        }
    }

    // Terminate application with runtime exception
    rxm_fatalError(message: logMessage, file: file, line: line)
}

// ----------------------------------------------------------------------------

public func rxm_fatalError(message: String, exception: NSException?, file: StaticString = #file, line: UInt = #line) -> Never
{
    var logMessage = message

    // Add exception description
    if let exc = exception
    {
        if !logMessage.isEmpty {
            logMessage += "\nCaused by exception: "
        }

        logMessage += "\(exc.name)"

        if let message = exc.reason?.trim(), !message.isEmpty {
            logMessage += " with reason: \(message)"
        }

        if let stackTrace = exception?.callStackSymbols, !stackTrace.isEmpty {
            logMessage += "\nStack trace:"

            for line in stackTrace {
                logMessage += "\n\(line)"
            }
        }
    }

    // Terminate application with runtime exception
    rxm_fatalError(message: logMessage, file: file, line: line)
}

// ----------------------------------------------------------------------------
