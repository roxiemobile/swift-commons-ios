// ----------------------------------------------------------------------------
//
//  LFArchiver+Encoding.h
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import "LFArchiver.h"
#import "LFEncoding.h"

// ----------------------------------------------------------------------------

@interface LFArchiver (LFEncoding)

// -- functions

- (void)writeBytes:(const void *)bytes length:(NSUInteger)length;

- (void)writeTag:(LFTagType)tag;
- (void)writeString:(NSString *)value withTag:(BOOL)withTag;

- (void)writeLongLong:(long long)value;
- (void)writeLongLong:(long long)value withTag:(BOOL)withTag;

- (void)writeUnsignedLongLong:(unsigned long long)value;
- (void)writeUnsignedLongLong:(unsigned long long)value withTag:(BOOL)withTag;

- (void)writeLong:(long)value;
- (void)writeLong:(long)value withTag:(BOOL)withTag;

- (void)writeUnsignedLong:(unsigned long)value;
- (void)writeUnsignedLong:(unsigned long)value withTag:(BOOL)withTag;

- (void)writeInt:(int)value;
- (void)writeInt:(int)value withTag:(BOOL)withTag;

- (void)writeUnsignedInt:(unsigned int)value;
- (void)writeUnsignedInt:(unsigned int)value withTag:(BOOL)withTag;

- (void)writeShort:(short)value;
- (void)writeShort:(short)value withTag:(BOOL)withTag;

- (void)writeUnsignedShort:(unsigned short)value;
- (void)writeUnsignedShort:(unsigned short)value withTag:(BOOL)withTag;

- (void)writeChar:(char)value;
- (void)writeChar:(char)value withTag:(BOOL)withTag;

- (void)writeUnsignedChar:(unsigned char)value;
- (void)writeUnsignedChar:(unsigned char)value withTag:(BOOL)withTag;

- (void)writeInteger:(NSInteger)value;
- (void)writeUnsignedInteger:(NSUInteger)value;

- (void)writeFloat:(float)value;
- (void)writeFloat:(float)value withTag:(BOOL)withTag;

- (void)writeDouble:(double)value;
- (void)writeDouble:(double)value withTag:(BOOL)withTag;

- (void)writeBool:(BOOL)value;
- (void)writeBool:(BOOL)value withTag:(BOOL)withTag;

// --

@end

// ----------------------------------------------------------------------------
