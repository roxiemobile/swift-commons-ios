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

    /// Creates and raises a fatal error exception with the specified message.
    ///
    /// - Parameters:
    ///   - message: The string containing a human-readable reason for the receiver. The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func fatalError(_ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) -> Never {
        let logMessage = "Fatal error: \(message())\nFile: \(file)\nLine: \(line)"

    #if DEBUG
        if Roxie.isRunningXCTest {
            FatalErrorException(reason: logMessage, userInfo: nil).raise()
        } else {
            preconditionFailure(logMessage)
        }
    #else
        FatalErrorException(reason: logMessage, userInfo: nil).raise()
    #endif

        // Suppress error "Return from a ‘noreturn’ function"
        Swift.fatalError(logMessage)
    }

    /// Creates and raises a fatal error exception with the specified message and the cause.
    ///
    /// - Parameters:
    ///   - message: The string containing a human-readable reason for the receiver. The default is an empty string.
    ///   - cause: The error that caused this exception to be raised. A `nil` value is permitted, and indicates that the cause is nonexistent or unknown.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func fatalError(_ message: @autoclosure () -> String = "", cause error: Error?, file: StaticString = #file, line: UInt = #line) -> Never {
        var logMessage = message()

        // Add error description
        if let err = error {
            logMessage += "\nCaused by error: " + String(describing: err).trim()
        }

        // Terminate application with runtime exception
        Roxie.fatalError(logMessage, file: file, line: line)
    }

    /// Creates and raises a fatal error exception with the specified message and the cause.
    ///
    /// - Parameters:
    ///   - message: The string containing a human-readable reason for the receiver. The default is an empty string.
    ///   - cause: The error that caused this exception to be raised. A `nil` value is permitted, and indicates that the cause is nonexistent or unknown.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func fatalError(_ message: @autoclosure () -> String = "", cause error: NSError?, file: StaticString = #file, line: UInt = #line) -> Never {
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

    /// Creates and raises a fatal error exception with the specified message and the cause.
    ///
    /// - Parameters:
    ///   - message: The string containing a human-readable reason for the receiver. The default is an empty string.
    ///   - cause: The exception that caused this exception to be raised. A `nil` value is permitted, and indicates that the cause is nonexistent or unknown.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func fatalError(_ message: @autoclosure () -> String = "", cause exception: NSException?, file: StaticString = #file, line: UInt = #line) -> Never {
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
