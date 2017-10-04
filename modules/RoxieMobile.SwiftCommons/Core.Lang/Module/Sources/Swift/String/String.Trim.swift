// ----------------------------------------------------------------------------
//
//  String.Trim.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension String
{
// MARK: - Methods

    /// Trims whitespaces from the beginning of self.
    public func trimStart() -> String {
        return stripStart()
    }

    /// Trims whitespaces from the end of self.
    public func trimEnd() -> String {
        return stripEnd()
    }

    /// Trims whitespaces from both the beginning and the end of self.
    public func trim() -> String {
        return strip()
    }
}

// ----------------------------------------------------------------------------
