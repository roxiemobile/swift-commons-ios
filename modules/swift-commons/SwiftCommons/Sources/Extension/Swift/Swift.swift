// ----------------------------------------------------------------------------
//
//  Swift.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

/// The MDCoding protocol declares the two methods that a class must implement
/// so that instances of that class can be encoded and decoded.
public protocol MDCoding: AnyObject
{
    /// Decodes an object initialized from data in a given unarchiver.
    init?(coder decoder: NSCoder)

    /// Encodes the receiver using a given archiver.
    func encode(coder encoder: NSCoder) -> Bool

    /// Decodes the receiver using a given unarchiver.
    func decode(coder decoder: NSCoder) -> Bool

}

// ----------------------------------------------------------------------------

/// The MDCopying protocol declares a method for providing functional copies
/// of an object.
public protocol MDCopying: NSCopying
{
// MARK: - Functions

    /// Returns a new instance that’s a copy of the receiver.
    func copy() -> Self

}

// ----------------------------------------------------------------------------

/// A type with a customized textual representation.
@objc public protocol MDPrintable
{
    /// A textual representation of `self`.
    var description: String { get }
}

/// A type with a customized textual representation for debugging purposes.
@objc public protocol MDDebugPrintable
{
    /// A textual representation of `self`, suitable for debugging.
    var debugDescription: String { get }
}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

public func demangledTypeName(object: Any) -> String {
    return String(object.dynamicType)
}

public func typeName(object: Any) -> String {
    return demangledTypeName(object).componentsSeparatedByString(".").last!
}

public func className(clazz: AnyClass) -> String {
    return NSStringFromClass(clazz).componentsSeparatedByString(".").last!
}

public func fullTypeName<T : Any>(obj: T) -> String {
    return String(reflecting: T.self)
}

public func briefTypeName<T : Any>(obj: T) -> String {
    var typeString = fullTypeName(obj)
    
    let typeSuffix = ".Type"
    if typeString.hasSuffix(typeSuffix) {
        typeString = typeString.substringToIndex(typeString.characters.count - typeSuffix.characters.count)
    }
    
    let typePrefix = "Swift."
    if typeString.hasPrefix(typePrefix) {
        typeString = typeString.substringFromIndex(typePrefix.characters.count)
    }
    
    return typeString
}

// ----------------------------------------------------------------------------

// How can I create instances of managed object subclasses in a NSManagedObject extension?
// @link http://stackoverflow.com/q/27109268

public func typeCheck<T>(object: AnyObject?, type: T.Type) -> Bool {
    return (object is T)
}

public func typeCast<T>(object: AnyObject, type: T.Type) -> T {
    return (object as! T)
}

public func optionalTypeCast<T>(object: AnyObject?, type: T.Type) -> T? {
    return (object as? T)
}

// ----------------------------------------------------------------------------

/// Creates a custom tag for any class.
public func mdc_customTag(clazz: AnyClass) -> String
{
    let nameTag = NSStringFromClass(clazz).mdc_md5String.substringToIndex(8)
    let timeTag = mach_absolute_time().mdc_hexString.substringFromIndex(8)

    // Done
    return "urn:tag:\(nameTag):\(timeTag)"
}

// ----------------------------------------------------------------------------
// MARK: - Operators
// ----------------------------------------------------------------------------

infix operator &&= {}


public func &&= (inout lhs: Bool, rhs: Bool ) {
    lhs = lhs && rhs
}

public func &&= (inout lhs: Bool, rhs: Bool?) {
    lhs = lhs && (rhs ?? false)
}

// ----------------------------------------------------------------------------
