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
public class RequirementException: NSException
{
// MARK: - Constants

    public init(_ message: String?, userInfo aUserInfo: [NSObject: AnyObject]?) {
        super.init(name: NSExceptionName(rawValue: Inner.Domain), reason: message, userInfo: aUserInfo)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - Constants

    private struct Inner {
        static let Domain = "RequirementDomain"
    }
}

// ----------------------------------------------------------------------------
