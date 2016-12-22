// ----------------------------------------------------------------------------
//
//  Serializable.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class Serializable: MDCoding
{
// MARK: - Construction

    @objc public required init?(coder decoder: NSCoder)
    {
        // Deserialize object
        if !decode(coder: decoder) { return nil }
    }

    init() {
        // Do nothing
    }

// MARK: - Methods

    public func encode(coder encoder: NSCoder) -> Bool {
        return true
    }

    public func decode(coder decoder: NSCoder) -> Bool {
        return true
    }

}

// ----------------------------------------------------------------------------
// MARK: - @interface NSObject
// ----------------------------------------------------------------------------

extension Serializable
{
// MARK: - Methods: Archiving

    @objc public var classForCoder: AnyClass {
        return self.dynamicType
    }

    @objc public func replacementObjectForCoder(aCoder: NSCoder) -> AnyObject? {
        return self
    }

    @objc public func awakeAfterUsingCoder(aDecoder: NSCoder) -> AnyObject? {
        return self
    }

    @objc public class func version() -> Int {
        return self.classVersion
    }

    @objc public class func setVersion(version: Int) {
        self.classVersion = version
    }

// --

    @objc public var classForKeyedArchiver: AnyClass {
        return self.dynamicType
    }

    @objc public func replacementObjectForKeyedArchiver(archiver: NSKeyedArchiver) -> AnyObject? {
        return self
    }

    @objc public class func classFallbacksForKeyedArchiver() -> [String] {
        return []
    }

// --

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

    @objc public func encodeWithCoder(aCoder: NSCoder) {
        encode(coder: aCoder)
    }

}

// ----------------------------------------------------------------------------
