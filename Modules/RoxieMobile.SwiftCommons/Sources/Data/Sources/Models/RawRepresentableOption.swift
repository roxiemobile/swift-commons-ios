// ----------------------------------------------------------------------------
//
//  RawRepresentableOption.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

open class RawRepresentableOption<T:Hashable & Hashable>: RawRepresentable
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public required init?(rawValue: T) {
        self.rawValue = rawValue

        guard contains(value: rawValue) else {
            return nil
        }
    }

// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public static func option(_ value: T) -> Self {
        return self.init(rawValue: value)!
    }

    @available(*, deprecated, message: "\n• Write a description.")
    open func contains(value: T) -> Bool {
        return false
    }

// MARK: - Properties

    @available(*, deprecated, message: "\n• Write a description.")
    public let rawValue: T
}

// ----------------------------------------------------------------------------

extension RawRepresentableOption: Equatable
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public static func ==(_ lhs: RawRepresentableOption, _ rhs: RawRepresentableOption) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

// ----------------------------------------------------------------------------

extension RawRepresentableOption: Hashable
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public var hashValue: Int {
        return self.rawValue.hashValue
    }
}

// ----------------------------------------------------------------------------
