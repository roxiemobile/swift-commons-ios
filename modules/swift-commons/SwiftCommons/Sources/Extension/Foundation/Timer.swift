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

    public class func rxm_scheduledTimerWithTimeInterval(ti: TimeInterval, repeats yesOrNo: Bool, completion: TimerCompletionHandler) -> Timer
    {
        let timer = scheduledTimer(timeInterval: ti, target: self, selector: #selector(Timer.rxm_executeCompletionHandler(_:)), userInfo: unsafeBitCast(completion, to: AnyObject.self), repeats: yesOrNo)

        return timer
    }

    public class func rxm_timerWithTimeInterval(ti: TimeInterval, repeats yesOrNo: Bool, completion: TimerCompletionHandler) -> Timer
    {
        let timer = Timer(timeInterval: ti, target: self, selector: #selector(Timer.rxm_executeCompletionHandler(_:)),
                    userInfo: unsafeBitCast(completion, to: AnyObject.self), repeats: yesOrNo)
        return timer
    }

// MARK: - Methods

    static func rxm_executeCompletionHandler(_ timer: Timer)
    {
        if let userInfo = timer.userInfo as? AnyObject {
            let completionHandler = unsafeBitCast(userInfo, to: TimerCompletionHandler.self)
            completionHandler(timer)
        }
    }

// MARK: - Inner Types

    public typealias TimerCompletionHandler = (@convention(block) (_ timer: Timer) -> Void)

}

// ----------------------------------------------------------------------------
