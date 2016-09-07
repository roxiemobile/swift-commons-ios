// ----------------------------------------------------------------------------
//
//  Validator.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

public protocol Validator
{
// MARK: - Functions

    func isValid(value: AnyObject?) -> Bool

}

// ----------------------------------------------------------------------------
