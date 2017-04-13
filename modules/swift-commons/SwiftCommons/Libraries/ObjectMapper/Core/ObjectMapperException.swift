// ----------------------------------------------------------------------------
//
//  ObjectMapperException.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class ObjectMapperException: NSException
{
// MARK: - Constants

    public init(reason aReason: String?, userInfo aUserInfo: [NSObject : AnyObject]?) {
        super.init(name: NSExceptionName(rawValue: ObjectMapper.Domain), reason: aReason, userInfo: aUserInfo)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - Constants

    private struct ObjectMapper {
        static let Domain = "ObjectMapperDomain"
    }

}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

public func rxm_objectMapperError(message: String, file: StaticString = #file, line: UInt = #line) -> Never
{
#if DEBUG
    preconditionFailure(message)
#else
    ObjectMapperException(reason: "Fatal error: \(message)\nFile: \(file)\nLine: \(line)", userInfo: nil).raise()

    // NOTE: Suppress error "Return from a 'noreturn' function"
    fatalError(message)
#endif
}

// ----------------------------------------------------------------------------

public func rxm_objectMapperAssertion(message: String, file: StaticString = #file, line: UInt = #line)
{
    let errorMessage = "Assertion violated: \(message)\nFile: \(file)\nLine: \(line)"
    Logger.e(#function, errorMessage)
    assertionFailure(errorMessage)
}

// ----------------------------------------------------------------------------
