// ----------------------------------------------------------------------------
//
//  AbstractMethodException.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public final class AbstractMethodException: FatalErrorException
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public override init(reason aReason: String?, userInfo aUserInfo: [AnyHashable : Any]? = nil) {
        super.init(name: Inner.ExceptionName, reason: aReason, userInfo: aUserInfo)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: AbstractMethodException.self))
    }
}

// ----------------------------------------------------------------------------
