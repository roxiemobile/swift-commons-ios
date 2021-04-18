// ----------------------------------------------------------------------------
//
//  NotValidModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsAbstractions

// ----------------------------------------------------------------------------

struct NotValidModel: Validatable {

// MARK: - Methods

    var isValid: Bool {
        return false
    }
}
