// ----------------------------------------------------------------------------
//
//  LoggerContract.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

/// Represents a type used to perform logging.
public protocol LoggerContract
{
// MARK: - Methods: Verbose

    func v(_ tag: String, _ message: String, file: StaticString, line: UInt)
    func v(_ type: Any.Type, _ message: String, file: StaticString, line: UInt)

// MARK: - Methods: Debug

    func d(_ tag: String, _ message: String, file: StaticString, line: UInt)
    func d(_ type: Any.Type, _ message: String, file: StaticString, line: UInt)

// MARK: - Methods: Information

    func i(_ tag: String, _ message: String, file: StaticString, line: UInt)
    func i(_ type: Any.Type, _ message: String, file: StaticString, line: UInt)

// MARK: - Methods: Warning

    func w(_ tag: String, _ message: String, file: StaticString, line: UInt)
    func w(_ type: Any.Type, _ message: String, file: StaticString, line: UInt)

    func w(_ tag: String, _ message: String, _ error: Error?, file: StaticString, line: UInt)
    func w(_ type: Any.Type, _ message: String, _ error: Error?, file: StaticString, line: UInt)

    func w(_ tag: String, _ message: String, _ error: NSError?, file: StaticString, line: UInt)
    func w(_ type: Any.Type, _ message: String, _ error: NSError?, file: StaticString, line: UInt)

    func w(_ tag: String, _ message: String, _ exception: NSException?, file: StaticString, line: UInt)
    func w(_ type: Any.Type, _ message: String, _ exception: NSException?, file: StaticString, line: UInt)

    func w(_ tag: String, _ error: Error, file: StaticString, line: UInt)
    func w(_ type: Any.Type, _ error: Error, file: StaticString, line: UInt)

    func w(_ tag: String, _ error: NSError, file: StaticString, line: UInt)
    func w(_ type: Any.Type, _ error: NSError, file: StaticString, line: UInt)

    func w(_ tag: String, _ exception: NSException, file: StaticString, line: UInt)
    func w(_ type: Any.Type, _ exception: NSException, file: StaticString, line: UInt)

// MARK: - Methods: Error

    func e(_ tag: String, _ message: String, file: StaticString, line: UInt)
    func e(_ type: Any.Type, _ message: String, file: StaticString, line: UInt)

    func e(_ tag: String, _ message: String, _ error: Error?, file: StaticString, line: UInt)
    func e(_ type: Any.Type, _ message: String, _ error: Error?, file: StaticString, line: UInt)

    func e(_ tag: String, _ message: String, _ error: NSError?, file: StaticString, line: UInt)
    func e(_ type: Any.Type, _ message: String, _ error: NSError?, file: StaticString, line: UInt)

    func e(_ tag: String, _ message: String, _ exception: NSException?, file: StaticString, line: UInt)
    func e(_ type: Any.Type, _ message: String, _ exception: NSException?, file: StaticString, line: UInt)

    func e(_ tag: String, _ error: Error, file: StaticString, line: UInt)
    func e(_ type: Any.Type, _ error: Error, file: StaticString, line: UInt)

    func e(_ tag: String, _ error: NSError, file: StaticString, line: UInt)
    func e(_ type: Any.Type, _ error: NSError, file: StaticString, line: UInt)

    func e(_ tag: String, _ exception: NSException, file: StaticString, line: UInt)
    func e(_ type: Any.Type, _ exception: NSException, file: StaticString, line: UInt)
}

// ----------------------------------------------------------------------------
