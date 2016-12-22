// ----------------------------------------------------------------------------
//
//  NSTimer.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// Cast closures/blocks
// @link http://stackoverflow.com/a/26739820

// typealias in class vs in function in swift (iOS)
// @link http://stackoverflow.com/a/28376161

// ----------------------------------------------------------------------------

public extension NSTimer
{
// MARK: - Construction

    public class func mdc_scheduledTimerWithTimeInterval(ti: NSTimeInterval, repeats yesOrNo: Bool, completion: TimerCompletionHandler) -> NSTimer
    {
        let timer = scheduledTimerWithTimeInterval(ti, target: self, selector: #selector(NSTimer.mdc_executeCompletionHandler(_:)),
                    userInfo: unsafeBitCast(completion, AnyObject.self), repeats: yesOrNo)
        return timer
    }

    public class func mdc_timerWithTimeInterval(ti: NSTimeInterval, repeats yesOrNo: Bool, completion: TimerCompletionHandler) -> NSTimer
    {
        let timer = NSTimer(timeInterval: ti, target: self, selector: #selector(NSTimer.mdc_executeCompletionHandler(_:)),
                    userInfo: unsafeBitCast(completion, AnyObject.self), repeats: yesOrNo)
        return timer
    }

// MARK: - Methods

    static func mdc_executeCompletionHandler(timer: NSTimer)
    {
        if let userInfo: AnyObject? = timer.userInfo {
            let completionHandler = unsafeBitCast(userInfo, TimerCompletionHandler.self)
            completionHandler(timer: timer)
        }
    }

// MARK: - Inner Types

    public typealias TimerCompletionHandler = (@convention(block) (timer: NSTimer) -> Void)

}

// ----------------------------------------------------------------------------
