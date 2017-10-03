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

    @available(*, deprecated, message: "\n• Write a description.")
    public static func typeName(of subject: Any) -> String {
        return Reflection(of: subject).type.name
    }
}

// ----------------------------------------------------------------------------
