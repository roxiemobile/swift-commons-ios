// ----------------------------------------------------------------------------
//
//  LFUnarchiver.h
//  Based on part of libFoundation.
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import <Foundation/Foundation.h>

// ----------------------------------------------------------------------------

@interface LFUnarchiver : NSCoder

// -- properties

// Managing an Decoder
@property(readonly, assign, getter=isAtEnd) BOOL atEnd;
@property(readonly, assign) unsigned int systemVersion;

// -- functions

// Initializing an Decoder
- (instancetype)initForReadingWithData:(NSData *)data;

// Decoding objects
+ (id)unarchiveObjectWithData:(NSData *)data;
+ (id)unarchiveObjectWithFile:(NSString *)path;

// Substituting classes or objects
+ (NSString *)classNameDecodedForArchiveClassName:(NSString *)nameInArchive;
+ (void)decodeClassName:(NSString *)nameInArchive asClassName:(NSString *)trueName;

- (NSString *)classNameDecodedForArchiveClassName:(NSString *)nameInArchive;
- (void)decodeClassName:(NSString *)nameInArchive asClassName:(NSString *)trueName;

// NOTE: Not supported yet ..
- (void)replaceObject:(id)object withObject:(id)newObject;

// --

@end

// ----------------------------------------------------------------------------

FOUNDATION_EXPORT NSString * const LFInconsistentArchiveException;

// ----------------------------------------------------------------------------
