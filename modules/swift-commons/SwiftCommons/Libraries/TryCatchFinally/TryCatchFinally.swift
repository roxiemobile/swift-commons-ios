//
//  TryCatchFinally.swift
//  TryCatchFinally
//
//  Created by Ken Ferry on 1/7/15.
//  Copyright (c) 2015 Understudy. All rights reserved.
//

import Foundation

public func Try(Try: @escaping () -> ()) -> TryCatchFinally {
    return TryCatchFinally(Try)
}

public final class TryCatchFinally
{
    init(_ Try: @escaping () -> ()) {
        tryFunc = Try
    }

    deinit {
        tryCatchFinally(tryFunc, catchFunc, finallyFunc)
    }

    let tryFunc: () -> ()

    var catchFunc: (NSException) -> Void = { _ in }

    var finallyFunc: () -> () = { }

    @discardableResult public func Catch(Catch: @escaping (NSException) -> ()) -> TryCatchFinally
    {
        catchFunc = { e in Catch(e) }
        return self
    }

    public func Finally(finally: @escaping () -> ()) {
        finallyFunc = finally
    }

}
