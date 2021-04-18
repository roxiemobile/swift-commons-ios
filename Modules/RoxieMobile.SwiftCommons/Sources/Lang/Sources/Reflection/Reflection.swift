// ----------------------------------------------------------------------------
//
//  Reflection.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public struct Reflection {

// MARK: - Construction

    public init(of subject: Any) {

        // Get type of subject
        let type = (subject as? Any.Type) ?? Swift.type(of: subject)

        // Init instance
        self.subject = subject
        self.type = Reflection.metatypeNameParser.reflect(type)
    }

// MARK: - Properties

    public let subject: Any

    public let type: ReflectedType

// MARK: - Constants

    private static let metatypeNameParser = MetatypeNameParser()
}
