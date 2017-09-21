// ----------------------------------------------------------------------------
//
//  Bundle.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2015, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Bundle
{
// MARK: - Properties

    @available(*, deprecated)
    public var shortVersionString: String? {
        return self.infoDictionary?[Inner.ShortVersionStringKey] as? String
    }

    @available(*, deprecated)
    public var executableName: String? {
        return self.infoDictionary?[kCFBundleExecutableKey as String] as? String
    }

// MARK: - Constants

    @available(*, deprecated)
    private struct Inner {
        static let ShortVersionStringKey = "CFBundleShortVersionString"
    }
}

// ----------------------------------------------------------------------------
