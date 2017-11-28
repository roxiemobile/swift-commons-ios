//
//  TryCatchFinally.h
//  TryCatchFinally
//
//  Created by Ken Ferry on 1/7/15.
//  Copyright (c) 2015 Understudy. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN
void roxie_tryCatchFinally(
    void(^ _Nonnull tryBlock)(void),
    void(^ _Nonnull catchBlock)(NSException * _Nonnull e),
    void(^ _Nonnull finallyBlock)(void)
);
NS_ASSUME_NONNULL_END
