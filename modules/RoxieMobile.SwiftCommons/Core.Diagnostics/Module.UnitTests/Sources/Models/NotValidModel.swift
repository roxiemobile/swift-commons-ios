// ----------------------------------------------------------------------------
//
//  NotValidModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

struct NotValidModel: Validatable
{
// MARK: - Methods

    func isValid() -> Bool {
        return false
    }
}

// ----------------------------------------------------------------------------
