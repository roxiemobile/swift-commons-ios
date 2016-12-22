// ----------------------------------------------------------------------------
//
//  Validatable.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public protocol Validatable
{
// MARK: - Methods

    func isValid() -> Bool

}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

// @deprecated
internal func vld_isValid(array: [Validatable?]) -> Bool
{
    // Validate objects
    return array.all { obj in (obj != nil) && obj!.isValid() }
}

// @deprecated
internal func vld_isValid(array: Validatable?...) -> Bool {
    return vld_isValid(array)
}


// @deprecated
internal func vld_isValid(array: [[Validatable]?]) -> Bool
{
    // Validate objects
    return array.all { arr in (arr != nil) && arr!.all { obj in obj.isValid() } }
}

// @deprecated
internal func vld_isValid(array: [Validatable]? ...) -> Bool {
    return vld_isValid(array)
}


// @deprecated
internal func vld_isValid(array: [[Validatable?]?]) -> Bool
{
    // Validate objects
    return array.all { arr in (arr != nil) && arr!.all { obj in (obj != nil) && obj!.isValid() } }
}

// @deprecated
internal func vld_isValid(array: [Validatable?]? ...) -> Bool {
    return vld_isValid(array)
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

// @deprecated
internal func vld_isNilOrValid(array: [Validatable?]) -> Bool
{
    // Validate objects
    return array.all { obj in (obj == nil) || obj!.isValid() }
}

// @deprecated
internal func vld_isNilOrValid(array: Validatable? ...) -> Bool {
    return vld_isNilOrValid(array)
}


// @deprecated
internal func vld_isNilOrValid(array: [[Validatable]?]) -> Bool
{
    // Validate objects
    return array.all { arr in (arr == nil) || arr!.all { obj in obj.isValid() } }
}

// @deprecated
internal func vld_isNilOrValid(array: [Validatable]? ...) -> Bool {
    return vld_isNilOrValid(array)
}


// @deprecated
internal func vld_isNilOrValid(array: [[Validatable?]?]) -> Bool
{
    // Validate objects
    return array.all { arr in
        (arr == nil) || arr!.all { obj in
            guard let obj = obj else {
                return false
            }
            return obj.isValid()
        }
    }
}

// @deprecated
internal func vld_isNilOrValid(array: [Validatable?]? ...) -> Bool {
    return vld_isNilOrValid(array)
}

// ----------------------------------------------------------------------------
