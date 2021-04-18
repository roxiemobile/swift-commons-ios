// ----------------------------------------------------------------------------
//
//  InconsistentArchiveException.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsLang

// ----------------------------------------------------------------------------

/// TODO
public final class InconsistentArchiveException: FatalErrorException {

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
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - Methods

    /// TODO
    public class func raise(reason: String, userInfo: [AnyHashable: Any]? = nil) -> Never {
        self.init(reason: reason, userInfo: userInfo).raise()

        // SUPPRESS: Function with uninhabited return type 'Never' is missing call to another
        // never-returning function on all paths
        Swift.fatalError(reason)
    }

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: InconsistentArchiveException.self))
    }
}
