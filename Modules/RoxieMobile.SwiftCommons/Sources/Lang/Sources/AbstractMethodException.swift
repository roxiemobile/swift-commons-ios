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

/// An exception which raises when attempting to call an abstract method.
public final class AbstractMethodException: FatalErrorException
{
// MARK: - Construction

    /// Initializes and returns a newly created exception object.
    ///
    /// - Parameters:
    ///   - reason: A human-readable message string summarizing the reason for the exception.
    ///   - userInfo: A dictionary containing user-defined information relating to the exception.
    ///
    public override init(reason: String?, userInfo: [AnyHashable: Any]? = nil) {
        super.init(name: Inner.ExceptionName, reason: reason, userInfo: userInfo)
    }

    /// Returns an object initialized from data in a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

// MARK: - Methods

    /// TODO
    public class func raise(reason: String, userInfo: [AnyHashable: Any]? = nil) {
        self.init(reason: reason, userInfo: userInfo).raise()
    }

// MARK: - Constants

    private struct Inner
    {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: AbstractMethodException.self))
    }
}

// ----------------------------------------------------------------------------
