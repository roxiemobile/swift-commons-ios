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

public class RequirementException: NSException
{
// MARK: - Constants

    public init(reason aReason: String?, userInfo aUserInfo: [NSObject : AnyObject]?) {
        super.init(name: FatalError.Domain, reason: aReason, userInfo: aUserInfo)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - Constants

    private struct FatalError {
        static let Domain = "RequirementDomain"
    }

}

// ----------------------------------------------------------------------------
