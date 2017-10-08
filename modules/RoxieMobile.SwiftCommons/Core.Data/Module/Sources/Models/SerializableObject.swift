// ----------------------------------------------------------------------------
//
//  SerializableObject.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

/// The abstract base class for all types that can be serialized with the NSCoder.
open class SerializableObject: Serializable, NSCoding
{
// MARK: - Construction

    /// Initializes a new instance of the class from data in a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    /// - Returns:
    ///   `self`, initialized using the data in decoder.
    @objc
    public required init?(coder decoder: NSCoder)
    {
        // Deserialize object
        guard decodeObject(with: decoder) else {
            return nil
        }
    }

    /// Creates a new instance of the class.
    public init() {
        // Do nothing
    }

// MARK: - Methods

    /// Encodes the receiver using a given archiver.
    ///
    /// - Parameters:
    ///   - encoder: An archiver object.
    ///
    /// - Returns:
    ///   `true` if encoding succeeded; otherwise, `false`.
    ///
    @discardableResult
    open func encodeObject(with encoder: NSCoder) -> Bool {
        return true
    }

    /// Decodes the receiver using a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    /// - Returns:
    ///   `true` if decoding succeeded; otherwise, `false`.
    ///
    @discardableResult
    open func decodeObject(with decoder: NSCoder) -> Bool {
        return true
    }

    /// Encodes the receiver using a given archiver.
    ///
    /// - Parameters:
    ///   - encoder: An archiver object.
    ///
    @objc
    open func encode(with encoder: NSCoder) {
        encodeObject(with: encoder)
    }
}

// ----------------------------------------------------------------------------
// MARK: - @interface NSObject
// ----------------------------------------------------------------------------

extension SerializableObject
{
// MARK: - Methods: Archiving

    @available(*, deprecated, message: "\n• Write a description.")
    @objc
    public var classForCoder: AnyClass {
        return type(of: self)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    @objc
    public func replacementObjectForCoder(_ aCoder: NSCoder) -> AnyObject? {
        return self
    }

    @available(*, deprecated, message: "\n• Write a description.")
    @objc
    public func awakeAfterUsingCoder(_ aDecoder: NSCoder) -> AnyObject? {
        return self
    }

    @available(*, deprecated, message: "\n• Write a description.")
    @objc
    public class func version() -> Int {
        return self.classVersion
    }

    @available(*, deprecated, message: "\n• Write a description.")
    @objc
    public class func setVersion(version: Int) {
        self.classVersion = version
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    @objc
    public var classForKeyedArchiver: AnyClass {
        return type(of: self)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    @objc
    public func replacementObjectForKeyedArchiver(archiver: NSKeyedArchiver) -> AnyObject? {
        return self
    }

    @available(*, deprecated, message: "\n• Write a description.")
    @objc
    public class func classFallbacksForKeyedArchiver() -> [String] {
        return []
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    @objc
    public class func classForKeyedUnarchiver() -> AnyClass {
        return self
    }

// MARK: - Variables

    private static var classVersion: Int = 1
}

// ----------------------------------------------------------------------------

