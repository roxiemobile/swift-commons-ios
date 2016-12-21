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

// @deprecated
//    public protocol ValidatableThrowable
//    {
//    // MARK: - Functions
//
//        func validateThrowable() throws -> Bool
//
//    }

public protocol Validatable
{
// MARK: - Functions
    
    func validate() throws
    
}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

// @deprecated
//    public func vld_isValid(array: Validatable? ...) -> Bool
//    {
//        // Validate objects
//        return p_vld_isValidArray(array, nilDefault: false)
//    }

// @deprecated
//    public func vld_isValid(array: [Validatable]? ...) -> Bool
//    {
//        // Validate objects
//        return array.all { arr in
//            guard let arr = arr else {
//                return false
//            }
//            
//            return p_vld_isValidArray(arr)
//        }
//    }

// @deprecated
//    public func vld_isValid(array: [Validatable?]? ...) -> Bool
//    {
//        // Validate objects
//        return array.all { arr in
//            guard let arr = arr else {
//                return false
//            }
//            
//            return p_vld_isValidArray(arr, nilDefault: false)
//        }
//    }

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

// @deprecated
//    public func vld_isNilOrValid(array: Validatable? ...) -> Bool
//    {
//        // Validate objects
//        return p_vld_isValidArray(array, nilDefault: true)
//    }

// @deprecated
//    public func vld_isNilOrValid(array: [Validatable]? ...) -> Bool
//    {
//        // Validate objects
//        return array.all { arr in
//            guard let arr = arr else {
//                return true
//            }
//            
//            return p_vld_isValidArray(arr)
//        }
//    }

// @deprecated
//    public func vld_isNilOrValid(array: [Validatable?]? ...) -> Bool
//    {
//        // Validate objects
//        return array.all { arr in
//            guard let arr = arr else {
//                return true
//            }
//            
//            return p_vld_isValidArray(arr, nilDefault: true)
//        }
//    }

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

// FIXME: Delete!
// @deprecated
//    private func p_vld_isValidArray(array: [Validatable?], nilDefault: Bool) -> Bool
//    {
//        return array.all { obj in
//            guard let obj = obj else {
//                return nilDefault
//            }
//            
//            return obj.validate()
//        }
//    }

// FIXME: Delete!
// @deprecated
//    private func p_vld_isValidArray(array: [Validatable]) -> Bool
//    {
//        return array.all { obj in obj.validate() }
//    }

// ----------------------------------------------------------------------------
