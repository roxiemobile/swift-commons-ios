// ----------------------------------------------------------------------------
//
//  Cloneable.swift
//
//  @author     Nikita Kolesnikov <kolesnikov-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2022, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

/// A protocol that objects adopt to provide functional copies of themselves.
public protocol Cloneable {

// MARK: - Methods

    /// Creates a new object that is a copy of the current instance.
    ///
    /// - Returns:
    ///   A new object that is a copy of this instance.
    ///
    func clone() -> Self
}
