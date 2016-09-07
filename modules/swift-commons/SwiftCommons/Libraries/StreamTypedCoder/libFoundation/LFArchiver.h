// ----------------------------------------------------------------------------
//
//  LFArchiver.h
//  Based on part of libFoundation.
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

#import <Foundation/Foundation.h>

// ----------------------------------------------------------------------------

@interface LFArchiver : NSCoder

// -- properties

// Getting the archived data
@property(readonly, strong) NSMutableData *archiverData;

// -- functions

// Initializing an Encoder
- (instancetype)initForWritingWithMutableData:(NSMutableData *)data;

// Archiving data
+ (NSData *)archivedDataWithRootObject:(id)rootObject;
+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path;

- (void)encodeRootObject:(id)rootObject;
- (void)encodeConditionalObject:(id)object;

// Substituting classes or objects
- (NSString *)classNameEncodedForTrueClassName:(NSString *)trueName;
- (void)encodeClassName:(NSString *)trueName intoClassName:(NSString *)inArchiveName;

// NOTE: Not supported yet ..
- (void)replaceObject:(id)object withObject:(id)newObject;

// --

@end

// ----------------------------------------------------------------------------

FOUNDATION_EXPORT NSString * const LFCoderSignature;
FOUNDATION_EXPORT UInt16 LFCoderVersion;

// ----------------------------------------------------------------------------
