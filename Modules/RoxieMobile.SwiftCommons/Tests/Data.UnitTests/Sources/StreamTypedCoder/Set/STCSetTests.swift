// ----------------------------------------------------------------------------
//
//  STCSetTests.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

class STCSetTests: StreamTypeCoderTests
{
    internal func transform<T>(set: inout Set<T>, from nsset: NSSet) {
        set = Set<T>(nsset.allObjects.map({ (item) -> T in
            return item as! T
        }))
    }
}

// ----------------------------------------------------------------------------
