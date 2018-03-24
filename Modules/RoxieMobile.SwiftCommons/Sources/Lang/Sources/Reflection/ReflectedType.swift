// ----------------------------------------------------------------------------
//
//  ReflectedType.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public struct ReflectedType
{
// MARK: - Construction

    internal init(name: String, fullName: String, isOptional: Bool, isImplicitlyUnwrappedOptional: Bool, isProtocol: Bool)
    {
        // Init instance
        self.name = name
        self.fullName = fullName
        self.isOptional = isOptional
        self.isImplicitlyUnwrappedOptional = isImplicitlyUnwrappedOptional
        self.isProtocol = isProtocol
    }

// MARK: - Properties

    public let name: String

    public let fullName: String

    public let isOptional: Bool

    public let isImplicitlyUnwrappedOptional: Bool

    public let isProtocol: Bool
}

// ----------------------------------------------------------------------------
