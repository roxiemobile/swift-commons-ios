// ----------------------------------------------------------------------------
//
//  MetatypeNode.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

class MetatypeNode
{
// MARK: - Construction

    init(value: String, child: MetatypeNode? = nil)
    {
        // Init instance
        self.value = value
        self.child = child
    }

// MARK: - Properties

    let value: String

    let child: MetatypeNode?
}

// ----------------------------------------------------------------------------
