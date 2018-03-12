// ----------------------------------------------------------------------------
//
//  RawRepresentableOption.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

open class RawRepresentableOption<T: Hashable & Hashable>: RawRepresentable
{
// MARK: - Construction

    /// Creates a new instance with the specified raw value.
    ///
    /// - Parameters:
    ///   - rawValue: The raw value to use for the new instance.
    ///
    public required init?(rawValue: T) {
        self.rawValue = rawValue

        guard allowed(rawValue: rawValue) else {
            return nil
        }
    }

// MARK: - Methods

    /// Creates a new instance with the specified raw value. Terminates execution if passed raw value
    /// are not allowed to use with Option which must be created.
    ///
    /// - Parameters:
    ///   - rawValue: The raw value to use for the new instance.
    ///
    public static func option(_ rawValue: T) -> Self {
        return self.init(rawValue: rawValue)!
    }

    /// Creates a new instance with the specified raw value. Terminates execution if passed object holds
    /// raw value which are not allowed to use with Option which must be created.
    ///
    /// - Parameters:
    ///   - object: The object of the RawRepresentable type which holds a raw value.
    ///
    public static func option<U: RawRepresentable>(_ object: U) -> Self where U.RawValue == T {
        return option(object.rawValue)
    }

    /// Returns a Boolean value that indicates whether the given value allowed to use as Option's raw value.
    ///
    /// - Parameters:
    ///   - rawValue: The raw value to check.
    ///
    open func allowed(rawValue: T) -> Bool {
        return false
    }

// MARK: - Properties

    /// The corresponding value of the raw type.
    public let rawValue: T
}

// ----------------------------------------------------------------------------

extension RawRepresentableOption: Equatable
{
// MARK: - Methods

    /// Returns a Boolean value indicating whether two instances wrap the same raw value.
    public static func == (_ lhs: RawRepresentableOption, _ rhs: RawRepresentableOption) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

// ----------------------------------------------------------------------------

extension RawRepresentableOption: Hashable
{
// MARK: - Methods

    /// The hash value.
    public var hashValue: Int {
        return self.rawValue.hashValue
    }
}

// ----------------------------------------------------------------------------
