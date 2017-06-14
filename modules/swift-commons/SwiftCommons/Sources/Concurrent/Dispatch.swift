// ----------------------------------------------------------------------------
//
//  Dispatch.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Dispatch
import Foundation

// ----------------------------------------------------------------------------
// GCD wrapper in Swift
// @link https://gist.github.com/Inferis/0813bf742742774d55fa
// ----------------------------------------------------------------------------

public func rxm_dispatch_main_async(block: @escaping () -> Void) {
    DispatchQueue.main.async(execute: block)
}

// ----------------------------------------------------------------------------

public func rxm_dispatch_main_sync(block: () -> Void)
{
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.sync(execute: block)
    }
}

// ----------------------------------------------------------------------------

public func rxm_dispatch_main_after(delay: Double, block: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: block)
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

public func rxm_dispatch_background_async(block: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).async(execute: block)
}

// ----------------------------------------------------------------------------

public func rxm_dispatch_background_sync(block: () -> Void) {
    DispatchQueue.global(qos: .background).sync(execute: block)
}

// ----------------------------------------------------------------------------

public func rxm_dispatch_background_after(delay: Double, block: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + delay, execute: block)
}

// ----------------------------------------------------------------------------
