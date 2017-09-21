// ----------------------------------------------------------------------------
//
//  Serializable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

@available(*, deprecated)
open class Serializable: MDCoding
{
// MARK: - Construction

    @available(*, deprecated)
    @objc public required init?(coder decoder: NSCoder)
    {
        // Deserialize object
        if !decode(coder: decoder) { return nil }
    }

    @available(*, deprecated)
    init() {
        // Do nothing
    }

// MARK: - Methods

    @available(*, deprecated)
    @discardableResult public func encode(coder encoder: NSCoder) -> Bool {
        return true
    }

    @available(*, deprecated)
    @discardableResult public func decode(coder decoder: NSCoder) -> Bool {
        return true
    }
}

// ----------------------------------------------------------------------------
// MARK: - @interface NSObject
// ----------------------------------------------------------------------------

extension Serializable
{
// MARK: - Methods: Archiving

    @available(*, deprecated)
    @objc public var classForCoder: AnyClass {
        return type(of: self)
    }

    @available(*, deprecated)
    @objc public func replacementObjectForCoder(_ aCoder: NSCoder) -> AnyObject? {
        return self
    }

    @available(*, deprecated)
    @objc public func awakeAfterUsingCoder(_ aDecoder: NSCoder) -> AnyObject? {
        return self
    }

    @available(*, deprecated)
    @objc public class func version() -> Int {
        return self.classVersion
    }

    @available(*, deprecated)
    @objc public class func setVersion(version: Int) {
        self.classVersion = version
    }

// --

    @available(*, deprecated)
    @objc public var classForKeyedArchiver: AnyClass {
        return type(of: self)
    }

    @available(*, deprecated)
    @objc public func replacementObjectForKeyedArchiver(archiver: NSKeyedArchiver) -> AnyObject? {
        return self
    }

    @available(*, deprecated)
    @objc public class func classFallbacksForKeyedArchiver() -> [String] {
        return []
    }

// --

    @available(*, deprecated)
    @objc public class func classForKeyedUnarchiver() -> AnyClass {
        return self
    }

// MARK: - Variables

    private static var classVersion: Int = 1
}

// ----------------------------------------------------------------------------
// MARK: - @protocol NSCoding
// ----------------------------------------------------------------------------

extension Serializable
{
// MARK: - Methods

    @available(*, deprecated)
    @objc public func encodeWithCoder(_ aCoder: NSCoder) {
        encode(coder: aCoder)
    }
}

// ----------------------------------------------------------------------------
