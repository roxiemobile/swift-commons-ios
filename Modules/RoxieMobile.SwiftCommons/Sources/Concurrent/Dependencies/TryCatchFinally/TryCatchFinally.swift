//
//  TryCatchFinally.swift
//  TryCatchFinally
//
//  Created by Ken Ferry on 1/7/15.
//  Copyright (c) 2015 Understudy. All rights reserved.
//

import Foundation
import SwiftCommonsObjC

public func objcTry(_ tryBlock: @escaping () -> Void) -> TryCatchFinally {
    return TryCatchFinally(tryBlock)
}

public final class TryCatchFinally {

    init(_ tryBlock: @escaping () -> Void) {
        _tryFunc = tryBlock
    }

    deinit {
        roxie_tryCatchFinally(_tryFunc, _catchFunc, _finallyFunc)
    }

    private let _tryFunc: () -> Void

    private var _catchFunc: (NSException) -> Void = { _ in }

    private var _finallyFunc: () -> Void = {}

    @discardableResult
    public func objcCatch(_ catchBlock: @escaping (NSException) -> Void) -> TryCatchFinally {
        _catchFunc = { ex in catchBlock(ex) }
        return self
    }

    public func objcFinally(_ finallyBlock: @escaping () -> Void) {
        _finallyFunc = finallyBlock
    }
}
