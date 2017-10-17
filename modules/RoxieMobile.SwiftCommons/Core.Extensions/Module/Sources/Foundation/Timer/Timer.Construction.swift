// ----------------------------------------------------------------------------
//
//  Timer.Construction.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// Cast closures/blocks
// @link http://stackoverflow.com/a/26739820

// typealias in class vs in function in swift (iOS)
// @link http://stackoverflow.com/a/28376161

// ----------------------------------------------------------------------------

public extension Timer
{
// MARK: - Construction

    /// Creates and returns a new `Timer` object initialized with the specified block object
    /// and schedules it on the current run loop in the default mode.
    ///
    /// - Parameters:
    ///   - timeInterval: The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
    ///   - repeats: If `true`, the timer will repeatedly reschedule itself until invalidated. If `false`, the timer will be invalidated after it fires.
    ///   - block: The execution body of the timer; the timer itself is passed as the parameter to this block when executed to aid in avoiding cyclical references.
    ///
    public static func roxie_scheduledTimer(
            timeInterval ti: TimeInterval,
            repeats: Bool,
            block: @escaping TimerCompletionHandler
    ) -> Timer {

        let userInfo = UserInfo(completion: block)
        return scheduledTimer(timeInterval: ti, target: self, selector: Inner.ExecuteCompletionHandler, userInfo: userInfo, repeats: repeats)
    }

    /// Creates and returns a new `Timer` object initialized with the specified block object. This timer
    /// needs to be scheduled on a run loop (via -[NSRunLoop addTimer:]) before it will fire.
    ///
    /// - Parameters:
    ///   - timeInterval: The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
    ///   - repeats: If `true`, the timer will repeatedly reschedule itself until invalidated. If `false`, the timer will be invalidated after it fires.
    ///   - block: The execution body of the timer; the timer itself is passed as the parameter to this block when executed to aid in avoiding cyclical references.
    ///
    public static func roxie_timer(
            timeInterval ti: TimeInterval,
            repeats: Bool,
            block: @escaping TimerCompletionHandler
    ) -> Timer {

        let userInfo = UserInfo(completion: block)
        return Timer(timeInterval: ti, target: self, selector: Inner.ExecuteCompletionHandler, userInfo: userInfo, repeats: repeats)
    }

// MARK: - Private Methods

    @objc
    private static func roxie_executeCompletionHandler(_ timer: Timer) -> Void {
        if let userInfo = (timer.userInfo as? UserInfo) {
            userInfo.completion(timer)
        }
    }

// MARK: - Inner Types

    public typealias TimerCompletionHandler = (@convention(block) (_ timer: Timer) -> Void)

    private struct UserInfo {
        let completion: TimerCompletionHandler
    }

// MARK: - Constants

    private struct Inner {
        static let ExecuteCompletionHandler = #selector(Timer.roxie_executeCompletionHandler(_:))
    }
}

// ----------------------------------------------------------------------------
