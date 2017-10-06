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

    @available(*, deprecated, message: "\n• Write a description.")
    public init(reason aReason: String?, userInfo aUserInfo: [AnyHashable : Any]? = nil) {
        super.init(name: Inner.ExceptionName, reason: aReason, userInfo: aUserInfo)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    internal override init(name aName: NSExceptionName, reason aReason: String?, userInfo aUserInfo: [AnyHashable : Any]? = nil) {
        super.init(name: aName, reason: aReason, userInfo: aUserInfo)
    }

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: FatalErrorException.self))
    }
}

// ----------------------------------------------------------------------------
