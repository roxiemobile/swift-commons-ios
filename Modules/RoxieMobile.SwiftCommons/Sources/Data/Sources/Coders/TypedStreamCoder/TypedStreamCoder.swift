// ----------------------------------------------------------------------------
//
//  TypedStreamCoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

internal protocol TypedStreamCoder {
    // Do nothing
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension TypedStreamCoder {

// MARK: - Protected Methods

    internal func _coderSignature() -> String {
        // swiftlint:disable:previous identifier_name

        // Typed Stream Coder
        return "roxie:tsc"
    }

    internal func _coderVersion() -> UInt16 {
        // swiftlint:disable:previous identifier_name

        // September of 2019
        return 1909
    }
}
