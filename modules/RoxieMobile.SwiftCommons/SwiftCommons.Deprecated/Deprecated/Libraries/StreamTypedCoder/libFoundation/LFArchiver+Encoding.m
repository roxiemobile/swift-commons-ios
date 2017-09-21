// ----------------------------------------------------------------------------
//
//  LFArchiver+Encoding.m
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import "LFArchiver+Encoding.h"

#import "LFUnarchiver.h"
#import "LFUnknownTypeException.h"

// ----------------------------------------------------------------------------

@interface LFArchiver ()

// -- properties

@property(nonatomic, assign) BOOL traceMode;

// --

@end

// ----------------------------------------------------------------------------
#pragma mark - Static Methods
// ----------------------------------------------------------------------------

// FIXME: duplicate code
//static inline
//void _checkType(LFTagType type, LFTagType reqType)
//{
//    if (type != reqType) {
//        [NSException raise:LFInconsistentArchiveException format:@"Expected different typecode."];
//    }
//}

// FIXME: duplicate code
//static inline
//void _checkType2(LFTagType type, LFTagType reqType1, LFTagType reqType2)
//{
//    if ((type != reqType1) && (type != reqType2)) {
//        [NSException raise:LFInconsistentArchiveException format:@"Expected different typecode."];
//    }
//}

// ----------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------

@implementation LFArchiver (LFEncoding)

// ----------------------------------------------------------------------------
#pragma mark - Protected Methods
// ----------------------------------------------------------------------------

- (void)_serializeDataAt:(const void *)addr ofObjCType:(const char *)type
{
    if ( ! (addr && type)) {
        return;
    }

    LFTagType tag = (*type);
    switch (tag)
    {
// FIXME: uncomment!
//        case _C_ID:
//        {
//            [self _serializeObjectAt:(__autoreleasing id *)addr ofObjCType:type intoData:object];
//            break;
//        }

// FIXME: uncomment!
//        case _C_CHARPTR:
//        {
//// FIXME: delete!
////            if ( ! *(void **) addr) {
////                [self writeInt:-1 withTag:YES];
////                return;
////            }
////
////            int len = (int) _string_length(*(void **) addr);
////            [self serialize:object integer:len];
////            [object appendBytes:*(void **) addr length:len];
//
//            [self writeString:object withTag:NO];
//
//            break;
//        }

// FIXME: uncomment!
//        case _C_ARY_B:
//        {
//            int i, offset, itemSize, count = _atoi(type + 1);
//            const char *itemType = type;
//
//            while (isdigit(*++itemType));
//            itemSize = objc_sizeof_type(itemType);
//
//            for (i = offset = 0; i < count; i++, offset += itemSize) {
//                [self serialize:object dataAt:(char *) addr + offset ofObjCType:itemType context:callback];
//            }
//            break;
//        }

// FIXME: uncomment!
//        case _C_STRUCT_B:
//        {
//            int offset = 0;
//            int align, rem;
//
//            while (*type != _C_STRUCT_E && *type++ != '='); /* skip "<name>=" */
//            while (1) {
//                [self serialize:object dataAt:((char *) addr) + offset ofObjCType:type context:callback];
//                offset += objc_sizeof_type(type);
//                type = objc_skip_typespec(type);
//                if (*type != _C_STRUCT_E) {
//                    align = objc_alignof_type(type);
//                    if ((rem = offset % align)) {
//                        offset += align - rem;
//                    }
//                }
//                else {break;}
//            }
//            break;
//        }

// FIXME: uncomment!
//        case _C_PTR:
//        {
//            [self serialize:object dataAt:(*(char **) addr) ofObjCType:(++type) context:callback];
//            break;
//        }

// FIXME: uncomment!
//        case _C_CHR:
//        case _C_UCHR:
//        {
//            [object appendBytes:addr length:sizeof(unsigned char)];
//            break;
//        }

// FIXME: uncomment!
//        case _C_SHT:
//        case _C_USHT:
//        {
//            [object appendBytes:addr length:sizeof(unsigned short)];
//            break;
//        }

// FIXME: uncomment!
//        case _C_INT: {
//            int value = *((int *) addr);
//            [self writeInt:value];
//            break;
//        }

// FIXME: uncomment!
//        case _C_UINT: {
//            unsigned int value = *((unsigned int *) addr);
//            [self writeUnsignedInt:value];
//            break;
//        }

// FIXME: uncomment!
//        case _C_LNG:
//        case _C_ULNG:
//        {
//            [object appendBytes:addr length:sizeof(unsigned long)];
//            break;
//        }

// FIXME: uncomment!
//        case _C_FLT:
//        {
//            [object appendBytes:addr length:sizeof(float)];
//            break;
//        }

// FIXME: uncomment!
//        case _C_DBL:
//        {
//            [object appendBytes:addr length:sizeof(double)];
//            break;
//        }

        default: {
            [LFUnknownTypeException raiseForType:type];
        }
    }
}

// ----------------------------------------------------------------------------

- (void)_serializeObjectAt:(id *)object ofObjCType:(const char *)type intoData:(NSMutableData *)data
{
// FIXME: uncomment!
//    LFTagType tag = (*type);
//    NSAssert(((*type == _C_ID) || (*type == _C_CLASS)), @"Unexpected type!");
//
//    if (self.traceMode) {
//        [self _traceObject:*object];
//    } else {
//        [self _encodeObject:*object];
//    }

    [LFUnknownTypeException raiseForType:type];
}

// ----------------------------------------------------------------------------

// FIXME: delete!
//- (void)serialize:(id)object integer:(int)value
//{
//    unsigned int ni = htonl(value);
//    [object appendBytes:&ni length:sizeof(unsigned int)];
//}

// FIXME: delete!
//- (void)serialize:(id)object integer:(int)value atIndex:(unsigned int)index
//{
//    unsigned int ni = htonl(value);
//    NSRange range = { index, sizeof(int) };
//    [object replaceBytesInRange:range withBytes:&ni];
//}

// ----------------------------------------------------------------------------
#pragma mark - Methods
// ----------------------------------------------------------------------------

- (void)writeBytes:(const void *)bytes length:(NSUInteger)length
{
    NSAssert(self.traceMode == NO, @"Nothing can be written during trace-mode.");

    if ((length > 0) && (bytes != nil)) {
        [self.archiverData appendBytes:bytes length:length];
    }
}

// ----------------------------------------------------------------------------

- (void)writeTag:(LFTagType)tag {
    [self writeBytes:&tag length:sizeof(tag)];
}

// ----------------------------------------------------------------------------

- (void)writeString:(NSString *)value withTag:(BOOL)withTag
{
    NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    NSUInteger length = data.length;

    if (withTag) {
        [self writeTag:(LFTagType)(length >= USHRT_MAX ? _C_CHARPTR : _C_ATOM)];
    }

    [self encodeBytes:data.bytes length:length];
}

// ----------------------------------------------------------------------------

- (void)writeLongLong:(long long)value {
    [self writeLongLong:value withTag:NO];
}

- (void)writeLongLong:(long long)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_LNG_LNG];
    }

    value = htonll(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeUnsignedLongLong:(unsigned long long)value {
    [self writeUnsignedLongLong:value withTag:NO];
}

- (void)writeUnsignedLongLong:(unsigned long long)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_ULNG_LNG];
    }

    value = htonll(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeLong:(long)value {
    [self writeLong:value withTag:NO];
}

- (void)writeLong:(long)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_LNG];
    }

    value = (long)htonl(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeUnsignedLong:(unsigned long)value {
    [self writeUnsignedLong:value withTag:NO];
}

- (void)writeUnsignedLong:(unsigned long)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_ULNG];
    }

    value = htonl(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeInt:(int)value {
    [self writeInt:value withTag:NO];
}

- (void)writeInt:(int)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_INT];
    }

    value = htonl(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeUnsignedInt:(unsigned int)value {
    [self writeUnsignedInt:value withTag:NO];
}

- (void)writeUnsignedInt:(unsigned int)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_UINT];
    }

    value = htonl(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeShort:(short)value {
    [self writeShort:value withTag:NO];
}

- (void)writeShort:(short)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_SHT];
    }

    value = htons(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeUnsignedShort:(unsigned short)value {
    [self writeUnsignedShort:value withTag:NO];
}

- (void)writeUnsignedShort:(unsigned short)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_USHT];
    }

    value = htons(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeChar:(char)value {
    [self writeChar:value withTag:NO];
}

- (void)writeChar:(char)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_CHR];
    }

    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeUnsignedChar:(unsigned char)value {
    [self writeUnsignedChar:value withTag:NO];
}

- (void)writeUnsignedChar:(unsigned char)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_UCHR];
    }

    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeInteger:(NSInteger)value
{
    if (value <= INT_MIN || value >= INT_MAX)
    {
        [self writeTag:_C_LNG];
        [self writeLong:(long)value];
    }
    else
    if (value <= SHRT_MIN || value >= SHRT_MAX)
    {
        [self writeTag:_C_INT];
        [self writeInt:(int)value];
    }
    else
    if (value <= CHAR_MIN || value >= CHAR_MAX)
    {
        [self writeTag:_C_SHT];
        [self writeShort:(short)value];
    }
    else {
        [self writeTag:_C_CHR];
        [self writeChar:(char)value];
    }
}

// ----------------------------------------------------------------------------

- (void)writeUnsignedInteger:(NSUInteger)value
{
    if (value >= UINT_MAX)
    {
        [self writeTag:_C_ULNG];
        [self writeUnsignedLong:(unsigned long)value];
    }
    else
    if (value >= USHRT_MAX)
    {
        [self writeTag:_C_UINT];
        [self writeUnsignedInt:(unsigned int)value];
    }
    else
    if (value >= UCHAR_MAX)
    {
        [self writeTag:_C_USHT];
        [self writeUnsignedShort:(unsigned short)value];
    }
    else {
        [self writeTag:_C_UCHR];
        [self writeUnsignedChar:(unsigned char)value];
    }
}

// ----------------------------------------------------------------------------

- (void)writeFloat:(float)value {
    return [self writeFloat:value withTag:NO];
}

- (void)writeFloat:(float)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_FLT];
    }

    value = objc_htonf(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeDouble:(double)value {
    return [self writeDouble:value withTag:NO];
}

- (void)writeDouble:(double)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_DBL];
    }

    value = objc_htond(value);
    [self writeBytes:&value length:sizeof(value)];
}

// ----------------------------------------------------------------------------

- (void)writeBool:(BOOL)value {
    [self writeBool:value withTag:NO];
}

- (void)writeBool:(BOOL)value withTag:(BOOL)withTag
{
    if (withTag) {
        [self writeTag:_C_BOOL];
    }

    UInt8 ni = (value ? YES : NO);
    [self writeBytes:&ni length:sizeof(ni)];
}

// ----------------------------------------------------------------------------

// FIXME: uncomment!
//    - (void)writeObjC:(const void *)value type:(const char *)type
//    {
//        if ( ! (value && type)) {
//            return;
//        }
//
//        if (self.traceMode)
//        {
//            // No need to track base-types in trace-mode
//            LFTagType tag = (*type);
//            switch (tag)
//            {
//                case _C_ID:
//                case _C_CLASS:
//                case _C_CHARPTR:
//                case _C_ARY_B:
//                case _C_STRUCT_B:
//                case _C_PTR:
//                {
//                    [self _serializeDataAt:value ofObjCType:type];
//                    break;
//                }
//
//                default: {
//                    // Do nothing
//                }
//            }
//        }
//        else {
//            [self _serializeDataAt:value ofObjCType:type];
//        }
//    }

// ----------------------------------------------------------------------------

@end

// ----------------------------------------------------------------------------
