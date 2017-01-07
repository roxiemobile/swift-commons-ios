// ----------------------------------------------------------------------------
//
//  LFUnknownTypeException.h
//  Based on part of libFoundation.
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import "LFEncoding.h"

// ----------------------------------------------------------------------------

@interface LFUnknownTypeException : NSException

// -- functions

+ (instancetype)exceptionForType:(const char *)type;

+ (void)raiseForType:(const char *)type;

// --

@end

// ----------------------------------------------------------------------------
