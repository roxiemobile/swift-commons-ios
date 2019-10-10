// ----------------------------------------------------------------------------
//
//  MessagePackCoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

internal protocol MessagePackCoder
{
    // Do nothing
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension MessagePackCoder
{
// MARK: - Protected Methods

    internal func _coderSignature() -> String {
        // Message Pack Coder
        return "roxie:mpc"
    }

    internal func _coderVersion() -> UInt16 {
        // October of 2019
        return 1910
    }
}

// ----------------------------------------------------------------------------
