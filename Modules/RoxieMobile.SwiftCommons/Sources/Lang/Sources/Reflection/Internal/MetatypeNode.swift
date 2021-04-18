// ----------------------------------------------------------------------------
//
//  MetatypeNode.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

class MetatypeNode {

// MARK: - Construction

    init(value: String, child: MetatypeNode? = nil) {
        self.value = value
        self.child = child
    }

// MARK: - Properties

    let value: String

    let child: MetatypeNode?
}
