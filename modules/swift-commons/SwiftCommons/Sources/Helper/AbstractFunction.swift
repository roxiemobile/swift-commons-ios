// ----------------------------------------------------------------------------
//
//  AbstractFunction.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

// @deprecated
@noreturn public func mdc_abstractFunction(file: StaticString = #file, line: UInt = #line) {
    mdc_fatalError("This function must be overridden")
}

// ----------------------------------------------------------------------------
