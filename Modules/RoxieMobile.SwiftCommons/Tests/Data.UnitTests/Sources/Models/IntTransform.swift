// ----------------------------------------------------------------------------
//
//  IntTransform.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

internal class IntTransform: TransformType
{
// MARK: - Construction

    init() {
        // Do nothing
    }

// MARK: - Methods

    func transformFromJSON(_ value: Any?) -> Int? {
        guard let string = value as? String else {
            return nil
        }
        return Int(string)
    }

    func transformToJSON(_ value: Int?) -> String? {
        guard let int = value else {
            return nil
        }
        return String("\(int)")
    }

// MARK: - Inner Types

    typealias Object = Int
    typealias JSON = String
}

// ----------------------------------------------------------------------------
