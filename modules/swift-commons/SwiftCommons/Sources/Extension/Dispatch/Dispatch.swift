// ----------------------------------------------------------------------------
//
//  Dispatch.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Dispatch
import Foundation

// ----------------------------------------------------------------------------
// GCD wrapper in Swift
// @link https://gist.github.com/Inferis/0813bf742742774d55fa
// ----------------------------------------------------------------------------

public func mdc_dispatch_main_async(block: dispatch_block_t) {
    dispatch_async(dispatch_get_main_queue(), block)
}

// ----------------------------------------------------------------------------

public func mdc_dispatch_main_sync(block: dispatch_block_t)
{
    if NSThread.isMainThread() {
        block()
    } else {
        dispatch_sync(dispatch_get_main_queue(), block)
    }
}

// ----------------------------------------------------------------------------

public func mdc_dispatch_main_after(delay: Double, block: dispatch_block_t)
{
    let when = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(when, dispatch_get_main_queue(), block)
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

public func mdc_dispatch_background_async(block: dispatch_block_t) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block)
}

// ----------------------------------------------------------------------------

public func mdc_dispatch_background_sync(block: dispatch_block_t) {
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block)
}

// ----------------------------------------------------------------------------

public func mdc_dispatch_background_after(delay: Double, block: dispatch_block_t)
{
    let when = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(when, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block)
}

// ----------------------------------------------------------------------------
