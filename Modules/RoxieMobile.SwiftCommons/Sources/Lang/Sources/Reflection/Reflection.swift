// ----------------------------------------------------------------------------
//
//  Reflection.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public struct Reflection {
// MARK: - Construction

    public init(of subject: Any) {
        // Get type of subject
        let type = (subject is Any.Type) ? subject : Swift.type(of: subject)

        // Init instance
        self.subject = subject

        if let anyType = type as? Any.Type {
            self.type = Reflection.metatypeNameParser.reflect(anyType)
        } else {
            Roxie.fatalError("Unable to cast \(type)")
        }
    }

// MARK: - Properties

    public let subject: Any

    public let type: ReflectedType

// MARK: - Constants

    private static let metatypeNameParser: MetatypeNameParser = MetatypeNameParser()

}

// ----------------------------------------------------------------------------
