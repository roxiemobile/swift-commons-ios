// ----------------------------------------------------------------------------
//
//  BoolModelWithDefaultValuesOptional.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class BoolModelWithDefaultValuesOptional: ValidatableModel
{
// MARK: - Properties

    fileprivate(set) var required: Bool? = false
    fileprivate(set) var deleted : Bool? = false

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.required <~ (map["required"], BooleanTransform(false))
        self.deleted  <~ (map["deleted" ], BooleanTransform(false))
        print("Done!")
    }
}

// ----------------------------------------------------------------------------
