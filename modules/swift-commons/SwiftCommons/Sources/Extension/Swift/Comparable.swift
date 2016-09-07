// ----------------------------------------------------------------------------
//
//  Comparable.swift
//
//  @author     Vasily Ivanov <IvanovVF@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       www.ekassir.com
//
// ----------------------------------------------------------------------------

extension Comparable
{
// MARK: - Functions

    public func limitedToRange(min min: Self, max: Self) -> Self
    {
        if self > max {
            return max
        }
        else if self < min {
            return min
        }
        return self
    }

}

// ----------------------------------------------------------------------------
