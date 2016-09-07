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

public func mdc_assert(@autoclosure condition: () -> Bool, message: String = String(), file: StaticString = #file, line: UInt = #line)
{
    if !condition() {
        mdc_assertFailure(message, file: file, line: line)
    }
}

public func mdc_assertFailure(message: String, file: StaticString = #file, line: UInt = #line)
{
    let errorMessage = "Assertion violated: \(message)\nFile: \(file)\nLine: \(line)"
    MDLog.e(errorMessage)
    assertionFailure(errorMessage)
}

// ----------------------------------------------------------------------------
