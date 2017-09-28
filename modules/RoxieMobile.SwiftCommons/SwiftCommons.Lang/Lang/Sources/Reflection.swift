// ----------------------------------------------------------------------------
//
//  Reflection.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public struct Reflection
{
// MARK: - Construction

    public init(of value: Any)
    {
        // Get type of subject
        let type = (value is Any.Type) ? (value as! Any.Type) : Swift.type(of: value)

        // Init instance variables
        self.subject = value
        self.type = ReflectedType(type)
    }

// MARK: - Properties

    let subject: Any

    let type: ReflectedType

// MARK: - Inner Types

    public struct ReflectedType
    {
        fileprivate init(_ subjectType: Any.Type)
        {
            var type = subjectType
            var isOptional = false
            var isImplicitlyUnwrappedOptional = false
    
            if let optional = type as? OptionalWrapper {
                type = optional.wrappedType
                isOptional = true
            }
            else if let optional = type as? ImplicitlyUnwrappedOptionalWrapper {
                type = optional.wrappedType
                isImplicitlyUnwrappedOptional = true
            }
            
            // Build full name
            var components = "\(type)".split(separator: ".", omittingEmptySubsequences: false)
            if (components.first?.starts(with: "__lldb_expr_") ?? false) {
                components = Array(components[0...])
            }

            // Init instance variables
            self.name = String(components.last!)
            self.fullName = components.joined(separator: ".")
            self.isOptional = isOptional
            self.isImplicitlyUnwrappedOptional = isImplicitlyUnwrappedOptional
            self.subjectType = subjectType
        }
        
        let name: String
        let fullName: String
        let isOptional: Bool
        let isImplicitlyUnwrappedOptional: Bool
        lazy var mirror = Mirror(reflecting: self.subjectType)

        private let subjectType: Any.Type
    }
}

// ----------------------------------------------------------------------------
