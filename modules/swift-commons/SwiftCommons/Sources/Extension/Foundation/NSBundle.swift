// ----------------------------------------------------------------------------
//
//  NSBundle.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2015, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSBundle
{
// MARK: - Properties

    public var shortVersionString: String? {
        return self.infoDictionary?[Inner.ShortVersionStringKey] as? String
    }

    public var executableName: String? {
        return self.infoDictionary?[kCFBundleExecutableKey as String] as? String
    }

// MARK: - Constants

    private struct Inner {
        static let ShortVersionStringKey = "CFBundleShortVersionString"
    }

}

// ----------------------------------------------------------------------------
