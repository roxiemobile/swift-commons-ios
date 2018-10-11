// ----------------------------------------------------------------------------
//
//  PthreadLock.swift
//  ReactiveSwift
//
//  Created by Justin Spahr-Summers on 2014-06-10.
//  Copyright (c) 2014 GitHub. All rights reserved.
//
// ----------------------------------------------------------------------------

// ReactiveSwift — Streams of values over time.
// @link https://github.com/ReactiveCocoa/ReactiveSwift/blob/master/Sources/Atomic.swift#L141

// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public final class PthreadLock
{
    fileprivate let _lock: UnsafeMutablePointer<pthread_mutex_t>

    public init(recursive: Bool = false) {
        _lock = .allocate(capacity: 1)
        _lock.initialize(to: pthread_mutex_t())

        let attr = UnsafeMutablePointer<pthread_mutexattr_t>.allocate(capacity: 1)
        attr.initialize(to: pthread_mutexattr_t())
        pthread_mutexattr_init(attr)

        defer {
            pthread_mutexattr_destroy(attr)
            attr.deinitialize(count: 1)
            attr.deallocate()
        }

        // Darwin pthread for 32-bit ARM somehow returns `EAGAIN` when
        // using `trylock` on a `PTHREAD_MUTEX_ERRORCHECK` mutex.
#if DEBUG && !arch(arm)
        pthread_mutexattr_settype(attr, Int32(recursive ? PTHREAD_MUTEX_RECURSIVE : PTHREAD_MUTEX_ERRORCHECK))
#else
        pthread_mutexattr_settype(attr, Int32(recursive ? PTHREAD_MUTEX_RECURSIVE : PTHREAD_MUTEX_NORMAL))
#endif

        let status = pthread_mutex_init(_lock, attr)
        assert(status == 0, "Unexpected pthread mutex error code: \(status)")
    }

    deinit {
        let status = pthread_mutex_destroy(_lock)
        assert(status == 0, "Unexpected pthread mutex error code: \(status)")

        _lock.deinitialize(count: 1)
        _lock.deallocate()
    }
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Lockable
// ----------------------------------------------------------------------------

extension PthreadLock: Lockable
{
    /// lock the mutex and block other threads from accessing until unlocked
    public func lock() {
        let status = pthread_mutex_lock(_lock)
        assert(status == 0, "Unexpected pthread mutex error code: \(status)")
    }

    /// lock the mutex if it is not already locked and block other threads from accessing until unlocked
    public func tryLock() -> Bool {
        let status = pthread_mutex_trylock(_lock)
        switch status {
            case 0:
                return true
            case EBUSY:
                return false
            default:
                assertionFailure("Unexpected pthread mutex error code: \(status)")
                return false
        }
    }

    /// unlock the mutex and allow other threads access once again
    public func unlock() {
        let status = pthread_mutex_unlock(_lock)
        assert(status == 0, "Unexpected pthread mutex error code: \(status)")
    }
}

// ----------------------------------------------------------------------------
