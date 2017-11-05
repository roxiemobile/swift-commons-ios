// ----------------------------------------------------------------------------
//
//  Roxie.FatalError.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Roxie
{
// MARK: - Methods

    /**
     Unconditionally prints a given message and stops execution.
    
     - Parameters:
       - message: The string to print. The default is an empty string.
       - file: The file name to print with `message`. The default is the file where `fatalError(_:file:line:)` is called.
       - line: The line number to print along with `message`. The default is the line number where `fatalError(_:file:line:)` is called.
     */
    public static func fatalError(_ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) -> Never {
        let logMessage = "Fatal error: \(message())\nFile: \(file)\nLine: \(line)"

    #if DEBUG
        preconditionFailure(logMessage)
    #else
        FatalErrorException(reason: logMessage, userInfo: nil).raise()

        // Suppress error "Return from a ‘noreturn’ function"
        Swift.fatalError(logMessage)
    #endif
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func fatalError(_ message: @autoclosure () -> String = "", error: Error?, file: StaticString = #file, line: UInt = #line) -> Never {
        var logMessage = message()

        // Add error description
        if let err = error {
            logMessage += "\nCaused by error: " + String(describing: err).trim()
        }

        // Terminate application with runtime exception
        Roxie.fatalError(logMessage, file: file, line: line)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func fatalError(_ message: @autoclosure () -> String = "", error: NSError?, file: StaticString = #file, line: UInt = #line) -> Never {
        var logMessage = message()

        // Add error description
        if let err = error {
            if !logMessage.isEmpty {
                logMessage += "\nCaused by error: "
            }

            logMessage += "\(err.domain)(code: \(err.code))"

            if let message = error?.localizedDescription.trim(), message.isNotEmpty {
                logMessage += " with reason: \(message)"
            }
        }

        // Terminate application with runtime exception
        Roxie.fatalError(logMessage, file: file, line: line)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func fatalError(_ message: @autoclosure () -> String = "", exception: NSException?, file: StaticString = #file, line: UInt = #line) -> Never {
        var logMessage = message()

        // Add exception description
        if let exc = exception {
            if !logMessage.isEmpty {
                logMessage += "\nCaused by exception: "
            }

            logMessage += "\(exc.name)"

            if let message = exc.reason?.trim(), message.isNotEmpty {
                logMessage += " with reason: \(message)"
            }

            if let stackTrace = exception?.callStackSymbols, stackTrace.isNotEmpty {
                logMessage += "\nStack trace:"

                for line in stackTrace {
                    logMessage += "\n\(line)"
                }
            }
        }

        // Terminate application with runtime exception
        Roxie.fatalError(logMessage, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------
