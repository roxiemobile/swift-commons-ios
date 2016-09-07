//
//  TryCatchFinally.swift
//  TryCatchFinally
//
//  Created by Ken Ferry on 1/7/15.
//  Copyright (c) 2015 Understudy. All rights reserved.
//

import Foundation

public func Try(Try: () -> ()) -> TryCatchFinally {
    return TryCatchFinally(Try)
}

public final class TryCatchFinally
{
    init(_ Try: () -> ()) {
        tryFunc = Try
    }

    deinit {
        tryCatchFinally(tryFunc, catchFunc, finallyFunc)
    }

    let tryFunc: () -> ()

    var catchFunc = {
        (e: NSException!) -> () in return
    }

    var finallyFunc: () -> () = {
    }

    public func Catch(Catch: (NSException) -> ()) -> TryCatchFinally
    {
        // objc bridging needs NSException!, not NSException as we'd like to expose to clients.
        catchFunc = {
            (e: NSException!) in Catch(e)
        }
        return self
    }

    public func Finally(finally: () -> ()) {
        finallyFunc = finally
    }

}
