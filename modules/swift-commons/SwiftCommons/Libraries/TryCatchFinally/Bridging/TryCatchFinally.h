//
//  TryCatchFinally.h
//  TryCatchFinally
//
//  Created by Ken Ferry on 1/7/15.
//  Copyright (c) 2015 Understudy. All rights reserved.
//

#import <Foundation/Foundation.h>

void tryCatchFinally(void( ^ _Nonnull tryBlock)(), void(^ _Nonnull catchBlock)(NSException * _Nonnull e), void(^ _Nonnull finallyBlock)());
