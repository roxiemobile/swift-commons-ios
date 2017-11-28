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

open class FatalErrorException: NSException
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public init(reason: String?, userInfo: [AnyHashable: Any]? = nil) {
        super.init(name: Inner.ExceptionName, reason: reason, userInfo: userInfo)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    internal override init(name: NSExceptionName, reason: String?, userInfo: [AnyHashable: Any]? = nil) {
        super.init(name: name, reason: reason, userInfo: userInfo)
    }

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: FatalErrorException.self))
    }
}

// ----------------------------------------------------------------------------
