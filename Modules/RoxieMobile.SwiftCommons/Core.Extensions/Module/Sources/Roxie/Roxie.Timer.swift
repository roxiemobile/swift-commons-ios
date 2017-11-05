// ----------------------------------------------------------------------------
//
//  Roxie.Timer.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

// Cast closures/blocks
// @link http://stackoverflow.com/a/26739820

// typealias in class vs in function in swift (iOS)
// @link http://stackoverflow.com/a/28376161

// ----------------------------------------------------------------------------

public extension Roxie
{
// MARK: - Construction

    /// Creates and returns a new `Timer` object initialized with the specified block object
    /// and schedules it on the current run loop in the default mode.
    ///
    /// - Parameters:
    ///   - interval: The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
    ///   - repeats: If `true`, the timer will repeatedly reschedule itself until invalidated. If `false`, the timer will be invalidated after it fires.
    ///   - block: The execution body of the timer; the timer itself is passed as the parameter to this block when executed to aid in avoiding cyclical references.
    ///
    /// - Returns:
    ///   A new `Timer` object, configured according to the specified parameters.
    ///
    public static func scheduledTimer(
            withTimeInterval interval: TimeInterval,
            repeats: Bool,
            block: @escaping TimerBlock
    ) -> Timer {

        if #available(*, iOS 10.0) {
            return Timer.scheduledTimer(withTimeInterval: interval, repeats: repeats, block: block)
        }
        else {
            let blockHolder = TimerBlockHolder(block: block)
            return Timer.scheduledTimer(timeInterval: interval, target: self, selector: Inner.ExecuteTimerBlock, userInfo: blockHolder, repeats: repeats)
        }
    }

    /// Creates and returns a new `Timer` object initialized with the specified block object. This timer
    /// needs to be scheduled on a run loop (via -[NSRunLoop addTimer:]) before it will fire.
    ///
    /// - Parameters:
    ///   - timeInterval: The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
    ///   - repeats: If `true`, the timer will repeatedly reschedule itself until invalidated. If `false`, the timer will be invalidated after it fires.
    ///   - block: The execution body of the timer; the timer itself is passed as the parameter to this block when executed to aid in avoiding cyclical references.
    ///
    public static func timer(
            timeInterval interval: TimeInterval,
            repeats: Bool,
            block: @escaping TimerBlock
    ) -> Timer {

        if #available(*, iOS 10.0) {
            return Timer(timeInterval: interval, repeats: repeats, block: block)
        }
        else {
            let blockHolder = TimerBlockHolder(block: block)
            return Timer(timeInterval: interval, target: self, selector: Inner.ExecuteTimerBlock, userInfo: blockHolder, repeats: repeats)
        }
    }

// MARK: - Private Methods

    @objc
    private static func executeTimerBlock(_ timer: Timer) -> Void {
        if let holder = (timer.userInfo as? TimerBlockHolder) {
            holder.block(timer)
        }
    }

// MARK: - Inner Types

    public typealias TimerBlock = (@convention(block) (_ timer: Timer) -> Void)

    private struct TimerBlockHolder {
        let block: TimerBlock
    }

// MARK: - Constants

    private struct Inner {
        static let ExecuteTimerBlock = #selector(Roxie.executeTimerBlock(_:))
    }
}

// ----------------------------------------------------------------------------
