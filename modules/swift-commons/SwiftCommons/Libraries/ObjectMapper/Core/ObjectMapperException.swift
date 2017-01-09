// ----------------------------------------------------------------------------
//
//  ObjectMapperException.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
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
        super.init(name: ObjectMapper.Domain, reason: aReason, userInfo: aUserInfo)
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

@noreturn public func rxm_objectMapperError(message: String, file: StaticString = #file, line: UInt = #line)
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
    Logger.e(errorMessage)
    assertionFailure(errorMessage)
}

// ----------------------------------------------------------------------------
