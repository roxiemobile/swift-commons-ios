// ----------------------------------------------------------------------------
//
//  RequirementException.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2017, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

/// Thrown to indicate that an requirement has failed.
@available(*, deprecated)
public class RequirementException: NSException
{
// MARK: - Constants

    @available(*, deprecated)
    public init(_ message: String?, userInfo aUserInfo: [NSObject: AnyObject]?) {
        super.init(name: NSExceptionName(rawValue: Inner.Domain), reason: message, userInfo: aUserInfo)
    }

    @available(*, deprecated)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - Constants

    @available(*, deprecated)
    private struct Inner {
        static let Domain = "RequirementDomain"
    }
}

// ----------------------------------------------------------------------------
