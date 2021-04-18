// ----------------------------------------------------------------------------
//
//  SerializableObject.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsAbstractions

// ----------------------------------------------------------------------------

/// The abstract base class for all types that can be serialized with the NSCoder.
open class SerializableObject: Serializable, NSCoding {

// MARK: - Construction

    /// Initializes a new instance of the class from data in a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    /// - Returns:
    ///   `self`, initialized using the data in decoder.
    @objc
    public required init?(coder decoder: NSCoder) {
        // Deserialize object
        guard decodeObject(with: decoder) else {
            return nil
        }
    }

    /// Creates a new instance of the class.
    public init() {
        // Do nothing
    }

// MARK: - Properties

    /// Returns the version number assigned to the class.
    public class var classVersion: Int {
        return 1
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

extension SerializableObject {

// MARK: - Methods: Archiving

    /// Overridden by subclasses to substitute a class other than its own during coding.
    ///
    /// - Returns:
    ///   The receiver's class.
    ///
    @objc
    public var classForCoder: AnyClass {
        return type(of: self)
    }

    /// Overridden by subclasses to substitute another object for itself during encoding.
    ///
    /// - Parameters
    ///   - coder: The coder encoding the receiver.
    ///
    /// - Returns:
    ///   The object encode instead of the receiver (if different).
    ///
    @objc
    public func replacementObjectForCoder(_ coder: NSCoder) -> AnyObject? {
        return self
    }

    /// Overridden by subclasses to substitute another object in place of the object
    /// that was decoded and subsequently received this message.
    ///
    /// - Parameters:
    ///   - decoder: The decoder used to decode the receiver.
    ///
    /// - Returns:
    ///   The receiver, or another object to take the place of the object that was decoded
    ///   and subsequently received this message.
    ///
    @objc
    public func awakeAfterUsingCoder(_ decoder: NSCoder) -> AnyObject? {
        return self
    }

    /// Returns the version number assigned to the class.
    @objc
    public class func version() -> Int {
        return _serialVersionUID
    }

    /// Sets the receiver's version number.
    ///
    /// - Parameters:
    ///   - version: The version number for the receiver.
    ///
    @objc
    public class func setVersion(version: Int) {
        _serialVersionUID = version
    }

// --

    /// Subclasses to substitute a new class for instances during keyed archiving.
    ///
    /// - Returns:
    ///   The receiver's class.
    ///
    @objc
    public var classForKeyedArchiver: AnyClass {
        return type(of: self)
    }

    /// Overridden by subclasses to substitute another object for itself during keyed archiving.
    ///
    /// - Parameters:
    ///   - archiver: A keyed archiver creating an archive.
    ///
    /// - Returns:
    ///   The object encode instead of the receiver (if different).
    ///
    @objc
    public func replacementObjectForKeyedArchiver(archiver: NSKeyedArchiver) -> AnyObject? {
        return self
    }

    /// Overridden to return the names of classes that can be used to decode objects
    /// if their class is unavailable.
    ///
    /// - Returns:
    ///   An array of string objects that specify the names of classes in preferred order
    ///   for unarchiving.
    @objc
    public class func classFallbacksForKeyedArchiver() -> [String] {
        return []
    }

// --

    /// Overridden by subclasses to substitute a new class during keyed unarchiving.
    ///
    /// - Returns:
    ///   The class to substitute for the receiver during keyed unarchiving.
    ///
    @objc
    public class func classForKeyedUnarchiver() -> AnyClass {
        return self
    }

// MARK: - Variables

    private static var _serialVersionUID: Int = classVersion
}
