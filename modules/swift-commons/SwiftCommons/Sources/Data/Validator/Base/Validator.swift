// ----------------------------------------------------------------------------
//
//  Validator.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public protocol Validator
{
// MARK: - Methods

    func isValid(value: AnyObject?) -> Bool

}

// ----------------------------------------------------------------------------
