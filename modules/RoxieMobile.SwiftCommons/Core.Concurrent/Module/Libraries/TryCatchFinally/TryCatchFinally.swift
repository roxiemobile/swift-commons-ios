//
//  TryCatchFinally.swift
//  TryCatchFinally
//
//  Created by Ken Ferry on 1/7/15.
//  Copyright (c) 2015 Understudy. All rights reserved.
//

import Foundation
import SwiftCommonsCoreConcurrentObjC

public func objcTry(Try: @escaping () -> Void) -> TryCatchFinally {
    return TryCatchFinally(Try)
}

public final class TryCatchFinally
{
    init(_ tryBlock: @escaping () -> Void) {
        self.tryFunc = tryBlock
    }

    deinit {
        roxie_tryCatchFinally(tryFunc, catchFunc, finallyFunc)
    }

    let tryFunc: () -> Void

    var catchFunc: (NSException) -> Void = { _ in }

    var finallyFunc: () -> Void = {}

    @discardableResult
    public func objcCatch(_ catchBlock: @escaping (NSException) -> Void) -> TryCatchFinally
    {
        self.catchFunc = { e in catchBlock(e) }
        return self
    }

    public func objcFinally(_ finallyBlock: @escaping () -> Void) {
        self.finallyFunc = finallyBlock
    }
}
