// ----------------------------------------------------------------------------
//
//  LFUnarchiver+Decoding.m
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import "LFUnarchiver+Decoding.h"

#import "LFMemory.h"
#import "LFUnknownTypeException.h"

// ----------------------------------------------------------------------------

@interface LFUnarchiver ()

// -- properties

@property(nonatomic, strong) NSData *buffer;
@property(nonatomic, assign) NSUInteger position;

// --

@end

// ----------------------------------------------------------------------------
#pragma mark - Static Methods
// ----------------------------------------------------------------------------

// FIXME: duplicate code
static inline
void _checkType(LFTagType type, LFTagType reqType)
{
    if (type != reqType) {
        [NSException raise:LFInconsistentArchiveException format:@"Expected different typecode."];
    }
}

// FIXME: duplicate code
static inline
void _checkType2(LFTagType type, LFTagType reqType1, LFTagType reqType2)
{
    if ((type != reqType1) && (type != reqType2)) {
        [NSException raise:LFInconsistentArchiveException format:@"Expected different typecode."];
    }
}

// ----------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------

@implementation LFUnarchiver (LFDecoding)

// ----------------------------------------------------------------------------
#pragma mark - Properties
// ----------------------------------------------------------------------------

// ...

// ----------------------------------------------------------------------------
#pragma mark - Protected Methods
// ----------------------------------------------------------------------------

// FIXME: delete!
//    - (void)deserialize:(id)object bytes:(void*)buffer length:(NSUInteger)length atCursor:(NSUInteger *)position
//    {
//        NSRange range = { *position, length };
//        [object getBytes:buffer range:range];
//        *position += length;
//    }

// ----------------------------------------------------------------------------
#pragma mark - Methods
// ----------------------------------------------------------------------------

- (void)readBytes:(void *)bytes length:(NSUInteger)length
{
    if ((bytes != nil) && (length > 0))
    {
        [self.buffer getBytes:bytes range:NSMakeRange(self.position, length)];
        self.position += length;
    }
}

// ----------------------------------------------------------------------------

- (LFTagType)readTag
{
    LFTagType tag = 0;
    [self readBytes:&tag length:sizeof(tag)];

    if (tag == 0) {
        [NSException raise:LFInconsistentArchiveException format:@"Found invalid type tag (0)."];
    }

    // Done
    return tag;
}

// ----------------------------------------------------------------------------

- (NSString *)readStringWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType2([self readTag], _C_ATOM, _C_CHARPTR);
    }

    NSString  *result = nil;

    // Decode string's data
    NSUInteger length = 0;
    Byte *bytes = [self decodeBytesWithReturnedLength:&length];

    // Build string from raw data
    if ((length > 0) && (bytes != nil)) {
        result = [[NSString alloc] initWithBytes:bytes length:length encoding:NSUTF8StringEncoding];
    } else {
        result = [NSString string];
    }

    // Done
    return result;
}

// ----------------------------------------------------------------------------

- (long long)readLongLong {
    return [self readLongLongWithTag:NO];
}

- (long long)readLongLongWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_LNG_LNG);
    }

    long long value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = ntohll(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (unsigned long long)readUnsignedLongLong {
    return [self readUnsignedLongLongWithTag:NO];
}

- (unsigned long long)readUnsignedLongLongWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_ULNG_LNG);
    }

    unsigned long long value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = ntohll(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (long)readLong {
    return [self readLongWithTag:NO];
}

- (long)readLongWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_LNG);
    }

    long value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = ntohl(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (unsigned long)readUnsignedLong {
    return [self readUnsignedLongWithTag:NO];
}

- (unsigned long)readUnsignedLongWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_ULNG);
    }

    unsigned long value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = ntohl(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (int)readInt {
    return [self readIntWithTag:NO];
}

- (int)readIntWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_INT);
    }

    int value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = ntohl(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (unsigned int)readUnsignedInt {
    return [self readUnsignedIntWithTag:NO];
}

- (unsigned int)readUnsignedIntWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_UINT);
    }

    unsigned int value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = ntohl(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (short)readShort {
    return [self readShortWithTag:NO];
}

- (short)readShortWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_SHT);
    }

    short value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = ntohs(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (unsigned short)readUnsignedShort {
    return [self readUnsignedShortWithTag:NO];
}

- (unsigned short)readUnsignedShortWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_USHT);
    }

    unsigned short value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = ntohs(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (char)readChar {
    return [self readCharWithTag:NO];
}

- (char)readCharWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_CHR);
    }

    char value = 0;
    [self readBytes:&value length:sizeof(value)];

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (unsigned char)readUnsignedChar {
    return [self readUnsignedCharWithTag:NO];
}

- (unsigned char)readUnsignedCharWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_UCHR);
    }

    unsigned char value = 0;
    [self readBytes:&value length:sizeof(value)];

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (NSInteger)readInteger
{
    NSInteger value = 0;

    // Read unsigned int
    LFTagType tag = [self readTag];
    switch (tag)
    {
        case _C_CHR: {
            value = [self readChar];
            break;
        }

        case _C_SHT: {
            value = [self readShort];
            break;
        }

        case _C_INT: {
            value = [self readInt];
            break;
        }

        case _C_LNG: {
            value = [self readLong];
            break;
        }

        default: {
            char type[] = { tag, 0 };
            [LFUnknownTypeException raiseForType:type];
        }
    }

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (NSUInteger)readUnsignedInteger
{
    NSUInteger value = 0;

    // Read unsigned int
    LFTagType tag = [self readTag];
    switch (tag)
    {
        case _C_UCHR: {
            value = [self readUnsignedChar];
            break;
        }

        case _C_USHT: {
            value = [self readUnsignedShort];
            break;
        }

        case _C_UINT: {
            value = [self readUnsignedInt];
            break;
        }

        case _C_ULNG: {
            value = [self readUnsignedLong];
            break;
        }

        default: {
            char type[] = { tag, 0 };
            [LFUnknownTypeException raiseForType:type];
        }
    }

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (float)readFloat {
    return [self readFloatWithTag:NO];
}

- (float)readFloatWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_FLT);
    }

    float value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = objc_ntohf(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (double)readDouble {
    return [self readDoubleWithTag:NO];
}

- (double)readDoubleWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_DBL);
    }

    double value = 0;
    [self readBytes:&value length:sizeof(value)];
    value = objc_ntohd(value);

    // Done
    return value;
}

// ----------------------------------------------------------------------------

- (BOOL)readBool {
    return [self readBoolWithTag:NO];
}

- (BOOL)readBoolWithTag:(BOOL)withTag
{
    if (withTag) {
        _checkType([self readTag], _C_BOOL);
    }

    Byte value = 0;
    [self readBytes:&value length:sizeof(value)];

    // Done
    return (value != 0) ? YES : NO;
}

// ----------------------------------------------------------------------------

@end

// ----------------------------------------------------------------------------

// FIXME: delete!
//    // FIXME: uncomment!
//    //    FINAL float _readFloat(NUUnarchiver *self)
//    //    {
//    //        float value = 0.0f;
//    //        NSUInteger position = self.cursor;
//    //
//    //        [self deserialize:self.data dataAt:&value ofObjCType:@encode(float) atCursor:&position context:self];
//    //        self.cursor = position;
//    //
//    //        // Done
//    //        return value;
//    //    }
//
//        - (void)deserializeObjectAt:(id *)_object ofObjCType:(const char *)_type fromData:(NSData *)_data atCursor:(NSUInteger *)_cursor
//        {
//            NSTagType tag             = 0;
//            BOOL      isReference     = NO;
//
//            tag         = _readTag(self);
//            isReference = _tag_isReferenceTag(tag);
//            tag         = _tag_tagValue(tag);
//
//            NSCAssert(((*_type == _C_ID) || (*_type == _C_CLASS)), @"Unexpected type ..");
//          
//            switch (*_type) {
//                case _C_ID:
//                    NSAssert((*_type == _C_ID) || (*_type == _C_CLASS), @"invalid type ..");
//                    *_object = [self _decodeObject:isReference];
//                    break;
//                case _C_CLASS:
//                    NSAssert((*_type == _C_ID) || (*_type == _C_CLASS), @"invalid type ..");
//                    *_object = [self _decodeClass:isReference];
//                    break;
//              
//                default: {
//                    [NSException raise:LFInconsistentArchiveException format:@"Encountered type '%s' in object context.", _type];
//                }
//            }
//        }
//
//        - (void)deserialize:(id)object dataAt:(void *)buffer ofObjCType:(const char *)type atCursor:(NSUInteger *)position
//                    context:(id <NUObjCTypeSerializationCallBack>)callback
//        {
//            if ( ! (type && buffer)) {
//                return;
//            }
//
//            switch(*type)
//            {
//                case _C_ID: {
//                    [callback deserializeObjectAt:(__autoreleasing id *)buffer ofObjCType:type fromData:object atCursor:position];
//                    break;
//                }
//
//                case _C_CHARPTR: {
//                    volatile int len = [self deserialize:object integerAtCursor:position];
//
//                    /* This statement, by taking the address of `type', forces the
//                    compiler to not allocate `type' into a register */
//                    *(void**)buffer = &type;
//
//                    if (len == -1) {
//                        *(const char**)buffer = NULL;
//                        return;
//                    }
//
//                    (*(char **)buffer) = objc_atomic_malloc(len + 1);
//                    (*(char **)buffer)[len] = 0;
//                    NS_DURING {
//                        [self deserialize:object bytes:*(char**)buffer length:len atCursor:position];
//                    }
//                    NS_HANDLER {
//                        objc_free(*(char**)buffer); // release resources
//                        [localException raise];
//                    }
//                    NS_ENDHANDLER;
//
//                    break;
//                }
//
//            case _C_ARY_B: {
//                int i, count, offset, itemSize;
//                const char *itemType;
//                
//                count = _atoi(type + 1);
//                itemType = type;
//                while (isdigit(*++itemType))
//                ;
//                itemSize = objc_sizeof_type(itemType);
//
//                for (i = offset = 0; i < count; i++, offset += itemSize) {
//                    [self deserialize:object dataAt:(char*)buffer + offset ofObjCType:itemType atCursor:position context:callback];
//                }
//                break;
//            }
//            case _C_STRUCT_B: {
//                int offset = 0;
//                int align, rem;
//
//                while(*type != _C_STRUCT_E && *type++ != '='); /* skip "<name>=" */
//                while(1) {
//                [self deserialize:object dataAt:((char*)buffer) + offset
//                    ofObjCType:type
//                    atCursor:position
//                    context:callback];
//                offset += objc_sizeof_type(type);
//                type = objc_skip_typespec(type);
//                if(*type != _C_STRUCT_E) {
//                    align = objc_alignof_type(type);
//                    if((rem = offset % align))
//                    offset += align - rem;
//                }
//                else break;
//                }
//                break;
//                }
//                case _C_PTR: {
//                *(char**)buffer = objc_malloc(objc_sizeof_type(++type));
//                NS_DURING {
//                    [self deserialize:object dataAt:*(char**)buffer
//                        ofObjCType:type
//                        atCursor:position
//                        context:callback];
//                }
//                NS_HANDLER {
//                    objc_free(*(char**)buffer); // release resources
//                    [localException raise];
//                }
//                NS_ENDHANDLER;
//
//                break;
//                }
//            case _C_CHR:
//            case _C_UCHR: {
//                [self deserialize:object bytes:buffer
//                  length:sizeof(unsigned char)
//                  atCursor:position];
//                break;
//            }
//                case _C_SHT:
//            case _C_USHT: {
//                [self deserialize:object bytes:buffer
//                  length:sizeof(unsigned short)
//                  atCursor:position];
//                break;
//            }
//                case _C_INT:
//            case _C_UINT: {
//                [self deserialize:object bytes:buffer
//                  length:sizeof(unsigned int)
//                  atCursor:position];
//                break;
//            }
//                case _C_LNG:
//            case _C_ULNG: {
//                [self deserialize:object bytes:buffer
//                  length:sizeof(unsigned long)
//                  atCursor:position];
//                break;
//            }
//                case _C_FLT: {
//                [self deserialize:object bytes:buffer
//                  length:sizeof(float)
//                  atCursor:position];
//                break;
//            }
//                case _C_DBL: {
//                [self deserialize:object bytes:buffer
//                  length:sizeof(double)
//                  atCursor:position];
//                break;
//            }
//                default:
//                [[[LFUnknownTypeException alloc] initForType:type] raise];
//            }
//        }
//
//        - (int)deserialize:(id)object integerAtCursor:(NSUInteger *)position
//        {
//            unsigned int ni, result;
//
//            [self deserialize:object bytes:&ni length:sizeof(unsigned int) atCursor:position];
//            result = ntohl(ni);
//            return result;
//        }
//
//        - (int)deserialize:(id)object integerAtIndex:(NSUInteger)index
//        {
//            unsigned int ni, result;
//
//            [self deserialize:object bytes:&ni length:sizeof(unsigned int) atCursor:&index];
//            result = ntohl(ni);
//            return result;
//        }
