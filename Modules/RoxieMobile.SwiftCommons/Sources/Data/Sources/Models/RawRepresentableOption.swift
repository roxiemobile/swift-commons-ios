// ----------------------------------------------------------------------------
//
//  RawRepresentableOption.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2017, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

open class RawRepresentableOption<T:Hashable & Hashable>: RawRepresentable
{
// MARK: - Construction

    public required init(rawValue: T) {
        self.rawValue = rawValue
    }

    public convenience init(_ rawValue: T) {
        self.init(rawValue: rawValue)
    }

// MARK: - Properties

    public let rawValue: T
}

// ----------------------------------------------------------------------------

extension RawRepresentableOption: Equatable
{
// MARK: - Methods

    public static func ==(_ lhs: RawRepresentableOption, _ rhs: RawRepresentableOption) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

// ----------------------------------------------------------------------------

extension RawRepresentableOption: Hashable
{
// MARK: - Methods

    public var hashValue: Int {
        return self.rawValue.hashValue
    }
}

// ----------------------------------------------------------------------------
