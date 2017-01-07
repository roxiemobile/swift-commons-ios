// ----------------------------------------------------------------------------
//
//  Assertion.swift
//
//  @author     Vasily Ivanov <IvanovVF@ekassir.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

// @deprecated
internal func mdc_assertion(@autoclosure condition: () -> Bool, message: String = String(), file: StaticString = #file, line: UInt = #line)
{
    if !condition() {
        mdc_assertionFailure(message, file: file, line: line)
    }
}

// @deprecated
internal func mdc_assertionFailure(message: String, file: StaticString = #file, line: UInt = #line)
{
    let errorMessage = "Assertion violated: \(message)\nFile: \(file)\nLine: \(line)"
    Logger.e(errorMessage)
    assertionFailure(errorMessage)
}

// ----------------------------------------------------------------------------
