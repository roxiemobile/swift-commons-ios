// ----------------------------------------------------------------------------
//
//  GuardException.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

/// Thrown to indicate that an requirement has failed.
public class GuardException: NSException
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public init(_ message: String?, userInfo aUserInfo: [NSObject: AnyObject]?) {
        super.init(name: Inner.ExceptionName, reason: message, userInfo: aUserInfo)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: GuardException.self))
    }
}

// ----------------------------------------------------------------------------
