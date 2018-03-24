// ----------------------------------------------------------------------------
//
//  Roxie.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public final class Roxie: NonCreatable
{
// MARK: - Methods

    /// Returns the name of static type of the subject being reflected.
    public static func typeName(of subject: Any) -> String {
        return Reflection(of: subject).type.name
    }

    /// Checks if the application is running unit tests.
    public static var isRunningXCTest: Bool {
        // How to let the app know if its running Unit tests in a pure Swift project?
        // @link https://stackoverflow.com/a/29991529
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
}

// ----------------------------------------------------------------------------
