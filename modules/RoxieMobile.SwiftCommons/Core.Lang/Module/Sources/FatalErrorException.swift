// ----------------------------------------------------------------------------
//
//  FatalErrorException.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class FatalErrorException: NSException
{
// MARK: - Construction

    public init(reason aReason: String?, userInfo aUserInfo: [NSObject: AnyObject]?) {
        super.init(name: Inner.ExceptionName, reason: aReason, userInfo: aUserInfo)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: FatalErrorException.self))
    }
}

// ----------------------------------------------------------------------------
