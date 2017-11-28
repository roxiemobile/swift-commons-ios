// ----------------------------------------------------------------------------
//
//  Roxie.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public final class Roxie: NonCreatable
{
// MARK: - Methods

    /// Returns the name of static type of the subject being reflected.
    public static func typeName(of subject: Any) -> String {
        return Reflection(of: subject).type.name
    }
}

// ----------------------------------------------------------------------------
