// ----------------------------------------------------------------------------
//
//  Assertion.swift
//
//  @author     Vasily Ivanov <ivanovvf@ekassir.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

// @deprecared
internal func mdc_assertion(@autoclosure condition: () -> Bool, message: String = String(), file: StaticString = #file, line: UInt = #line)
{
    if !condition() {
        mdc_assertionFailure(message, file: file, line: line)
    }
}

// @deprecared
internal func mdc_assertionFailure(message: String, file: StaticString = #file, line: UInt = #line)
{
    let errorMessage = "Assertion violated: \(message)\nFile: \(file)\nLine: \(line)"
    MDLog.e(errorMessage)
    assertionFailure(errorMessage)
}

// ----------------------------------------------------------------------------
