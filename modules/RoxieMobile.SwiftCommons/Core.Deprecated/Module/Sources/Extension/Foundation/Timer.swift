// ----------------------------------------------------------------------------
//
//  Timer.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
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

    @available(*, deprecated)
    public class func rxm_scheduledTimerWithTimeInterval(ti: TimeInterval, repeats yesOrNo: Bool, completion: @escaping TimerCompletionHandler) -> Timer
    {
        let userInfo = UserInfo(completion: completion)
        return scheduledTimer(timeInterval: ti, target: self, selector: Inner.ExecuteCompletionHandler, userInfo: userInfo, repeats: yesOrNo)
    }

    @available(*, deprecated)
    public class func rxm_timerWithTimeInterval(ti: TimeInterval, repeats yesOrNo: Bool, completion: @escaping TimerCompletionHandler) -> Timer
    {
        let userInfo = UserInfo(completion: completion)
        return Timer(timeInterval: ti, target: self, selector: Inner.ExecuteCompletionHandler, userInfo: userInfo, repeats: yesOrNo)
    }

// MARK: - Methods

    @available(*, deprecated)
    @objc static func rxm_executeCompletionHandler(_ timer: Timer)
    {
        if let userInfo = (timer.userInfo as? UserInfo) {
            userInfo.completion(timer)
        }
    }

// MARK: - Inner Types

    public typealias TimerCompletionHandler = (@convention(block) (_ timer: Timer) -> Void)

    @available(*, deprecated)
    private struct UserInfo {
        let completion: TimerCompletionHandler
    }

// MARK: - Constants

    @available(*, deprecated)
    private struct Inner {
        static let ExecuteCompletionHandler = #selector(Timer.rxm_executeCompletionHandler(_:))
    }
}

// ----------------------------------------------------------------------------
