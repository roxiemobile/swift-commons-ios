// ----------------------------------------------------------------------------
//
//  LFUnarchiver+Decoding.h
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import "LFUnarchiver.h"

#import "LFEncoding.h"

// ----------------------------------------------------------------------------

@interface LFUnarchiver (LFDecoding)

// -- functions

- (void)readBytes:(void *)bytes length:(NSUInteger)length;

- (LFTagType )readTag;
- (NSString *)readStringWithTag:(BOOL)withTag;

- (long long)readLongLong;
- (long long)readLongLongWithTag:(BOOL)withTag;

- (unsigned long long)readUnsignedLongLong;
- (unsigned long long)readUnsignedLongLongWithTag:(BOOL)withTag;

- (long)readLong;
- (long)readLongWithTag:(BOOL)withTag;

- (unsigned long)readUnsignedLong;
- (unsigned long)readUnsignedLongWithTag:(BOOL)withTag;

- (int)readInt;
- (int)readIntWithTag:(BOOL)withTag;

- (unsigned int)readUnsignedInt;
- (unsigned int)readUnsignedIntWithTag:(BOOL)withTag;

- (short)readShort;
- (short)readShortWithTag:(BOOL)withTag;

- (unsigned short)readUnsignedShort;
- (unsigned short)readUnsignedShortWithTag:(BOOL)withTag;

- (char)readChar;
- (char)readCharWithTag:(BOOL)withTag;

- (unsigned char)readUnsignedChar;
- (unsigned char)readUnsignedCharWithTag:(BOOL)withTag;

- (NSInteger )readInteger;
- (NSUInteger)readUnsignedInteger;

- (float)readFloat;
- (float)readFloatWithTag:(BOOL)withTag;

- (double)readDouble;
- (double)readDoubleWithTag:(BOOL)withTag;

- (BOOL)readBool;
- (BOOL)readBoolWithTag:(BOOL)withTag;

// --

@end

// ----------------------------------------------------------------------------
