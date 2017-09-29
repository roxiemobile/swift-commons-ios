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

// FIXME: Delete!
//    internal init<T>(_ type: T.Type)
//    {
//        var isOptional = false
//        var isImplicitlyUnwrappedOptional = false
//        var isProtocol = false
//
//        if let optional = type as? OptionalWrapper {
//            type = optional.wrappedType
//            isOptional = true
//        }
//        else if let optional = type as? ImplicitlyUnwrappedOptionalWrapper {
//            type = optional.wrappedType
//            isImplicitlyUnwrappedOptional = true
//        }
//
//        // Build full name
//        var components = "\(type)".split(separator: ".", omittingEmptySubsequences: false)
//        if (components.first?.starts(with: "__lldb_expr_") ?? false) {
//            components = Array(components[0...])
//        }
//
//        // Init instance variables
//        self.name = String(components.last!)
//        self.fullName = components.joined(separator: ".")
//        self.isOptional = isOptional
//        self.isImplicitlyUnwrappedOptional = isImplicitlyUnwrappedOptional
//    }

// MARK: - Properties

    public let name: String

    public let fullName: String

    public let isOptional: Bool

    public let isImplicitlyUnwrappedOptional: Bool

    public let isProtocol: Bool
}

// ----------------------------------------------------------------------------
