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

public protocol ValidatableThrowable
{
// MARK: - Functions

    func validateThrowable() throws -> Bool

}

public protocol Validatable
{
// MARK: - Functions
    
    func validate() -> Bool
    
}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

public func vld_isValid(array: Validatable? ...) -> Bool
{
    // Validate objects
    return p_vld_isValidArray(array, nilDefault: false)
}

public func vld_isValid(array: [Validatable]? ...) -> Bool
{
    // Validate objects
    return array.all { arr in
        guard let arr = arr else {
            return false
        }
        
        return p_vld_isValidArray(arr)
    }
}

public func vld_isValid(array: [Validatable?]? ...) -> Bool
{
    // Validate objects
    return array.all { arr in
        guard let arr = arr else {
            return false
        }
        
        return p_vld_isValidArray(arr, nilDefault: false)
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

public func vld_isNilOrValid(array: Validatable? ...) -> Bool
{
    // Validate objects
    return p_vld_isValidArray(array, nilDefault: true)
}

public func vld_isNilOrValid(array: [Validatable]? ...) -> Bool
{
    // Validate objects
    return array.all { arr in
        guard let arr = arr else {
            return true
        }
        
        return p_vld_isValidArray(arr)
    }
}

public func vld_isNilOrValid(array: [Validatable?]? ...) -> Bool
{
    // Validate objects
    return array.all { arr in
        guard let arr = arr else {
            return true
        }
        
        return p_vld_isValidArray(arr, nilDefault: true)
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

// FIXME: Delete!
private func p_vld_isValidArray(array: [Validatable?], nilDefault: Bool) -> Bool
{
    return array.all { obj in
        guard let obj = obj else {
            return nilDefault
        }
        
        return obj.validate()
    }
}

// FIXME: Delete!
private func p_vld_isValidArray(array: [Validatable]) -> Bool
{
    return array.all { obj in obj.validate() }
}

// ----------------------------------------------------------------------------
