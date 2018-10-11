// ----------------------------------------------------------------------------
//
//  UnfairLock.swift
//  ReactiveSwift
//
//  Created by Justin Spahr-Summers on 2014-06-10.
//  Copyright (c) 2014 GitHub. All rights reserved.
//
// ----------------------------------------------------------------------------

// ReactiveSwift — Streams of values over time.
// @link https://github.com/ReactiveCocoa/ReactiveSwift/blob/master/Sources/Atomic.swift#L109

// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

@available(iOS 10.0, *)
@available(macOS 10.12, *)
@available(tvOS 10.0, *)
@available(watchOS 3.0, *)
public final class UnfairLock
{
    fileprivate let _lock: os_unfair_lock_t

    public init() {
        _lock = .allocate(capacity: 1)
        _lock.initialize(to: os_unfair_lock())
    }

    deinit {
        _lock.deinitialize(count: 1)
        _lock.deallocate()
    }
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Lockable
// ----------------------------------------------------------------------------

@available(iOS 10.0, *)
@available(macOS 10.12, *)
@available(tvOS 10.0, *)
@available(watchOS 3.0, *)
extension UnfairLock: Lockable
{
    /// lock the unfair lock and block other threads from accessing until unlocked
    public func lock() {
        os_unfair_lock_lock(_lock)
    }

    /// lock the unfair lock if it is not already locked and block other threads from accessing until unlocked
    public func tryLock() -> Bool {
        return os_unfair_lock_trylock(_lock)
    }

    /// unlock the unfair lock and allow other threads access once again
    public func unlock() {
        os_unfair_lock_unlock(_lock)
    }
}

// ----------------------------------------------------------------------------
