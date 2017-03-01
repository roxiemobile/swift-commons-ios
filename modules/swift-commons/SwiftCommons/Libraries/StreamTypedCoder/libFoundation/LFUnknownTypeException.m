// ----------------------------------------------------------------------------
//
//  LFUnknownTypeException.m
//  Based on part of libFoundation.
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import "LFUnknownTypeException.h"

// ----------------------------------------------------------------------------

@implementation LFUnknownTypeException

// ----------------------------------------------------------------------------
#pragma mark - Methods
// ----------------------------------------------------------------------------

+ (void)raiseForType:(const char *)type {
    [[self exceptionForType:type] raise];
}

// ----------------------------------------------------------------------------

+ (instancetype)exceptionForType:(const char *)type
{
    NSString *value   = [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
    NSString *message = [NSString stringWithFormat:@"Unknown Objective-C type encoding: %@", value];

    // Create exception
    id object = [[LFUnknownTypeException alloc] initWithName:NSInvalidArgumentException
            reason:message userInfo:@{ @"type": value }];

    // Done
    return object;
}

// ----------------------------------------------------------------------------

@end

// ----------------------------------------------------------------------------
