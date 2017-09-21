// ----------------------------------------------------------------------------
//
//  ObjectUtils.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public final class ObjectUtils: NonCreatable
{
// MARK: - Methods

    /// Returns a default value if the object passed is {@code nil}.
    @available(*, deprecated)
    public static func defaultIfNil<T>(object: T?, defaultValue: T?) -> T? {
        return (object != nil) ? object : defaultValue
    }
}

// ----------------------------------------------------------------------------
