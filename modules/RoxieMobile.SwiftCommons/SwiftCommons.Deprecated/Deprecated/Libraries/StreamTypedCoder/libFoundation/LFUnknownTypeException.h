// ----------------------------------------------------------------------------
//
//  LFUnknownTypeException.h
//  Based on part of libFoundation.
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
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
