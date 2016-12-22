// ----------------------------------------------------------------------------
//
//  StaticValidator.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

public protocol StaticValidator
{
// MARK: - Methods

    static func isValid(value: AnyObject?) -> Bool

}

// ----------------------------------------------------------------------------
