// ----------------------------------------------------------------------------
//
//  NSData+OSData.m
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

#import "NSData+OSData.h"
#include <objc-runtime.h>
#include <common.h>
#include <OSUtilities.h>

// ----------------------------------------------------------------------------

@implementation NSData (OSData)

// ----------------------------------------------------------------------------
#pragma mark - Properties
// ----------------------------------------------------------------------------

LF_DECLARE NSString *NSInconsistentNSData = @"NSData is inconsist";

static inline unsigned int
network_int_to_host (unsigned int x)
{
    return ntohl (x);
}

// ----------------------------------------------------------------------------
#pragma mark - Protected Methods
// ----------------------------------------------------------------------------

// ...

// ----------------------------------------------------------------------------
#pragma mark - Methods
// ----------------------------------------------------------------------------

- (void)deserializeDataAt:(void*)data
               ofObjCType:(const char*)type
                 atCursor:(unsigned int*)cursor
                  context:(id <OSObjCTypeSerializationCallBack>)callback
{
    if(!type || !data)
        return;

    switch(*type) {
        case _C_ID: {
            [callback deserializeObjectAt:data ofObjCType:type
                                 fromData:self atCursor:cursor];
            break;
        }
        case _C_CHARPTR: {
            volatile int len = [self deserializeIntAtCursor:cursor];

            /* This statement, by taking the address of `type', forces the
             compiler to not allocate `type' into a register */
            *(void**)data = &type;

            if(len == -1) {
                *(const char**)data = NULL;
                return;
            }

            *(char**)data = MallocAtomic(len + 1);
            (*(char **)data)[len] = 0;
//            TRY {
                [self deserializeBytes:*(char**)data
                                length:len
                              atCursor:cursor];
//            } END_TRY
//            OTHERWISE {
//                lfFree (*(char**)data);
//                RERAISE;
//            } END_CATCH

            break;
                    }
        case _C_ARY_B: {
            int i, count, offset, itemSize;
            const char *itemType;

            count = Atoi(type + 1);
            itemType = type;
            while (isdigit(*++itemType))
                ;
            itemSize = objc_sizeof_type(itemType);

            for(i = offset = 0; i < count; i++, offset += itemSize) {
                [self deserializeDataAt:(char*)data + offset
                             ofObjCType:itemType
                               atCursor:cursor
                                context:callback];
            }
            break;
        }
        case _C_STRUCT_B: {
            int offset = 0;
            int align, rem;

            while(*type != _C_STRUCT_E && *type++ != '='); /* skip "<name>=" */
            while(1) {
                [self deserializeDataAt:((char*)data) + offset
                             ofObjCType:type
                               atCursor:cursor
                                context:callback];
                offset += objc_sizeof_type(type);
                type = objc_skip_typespec(type);
                if(*type != _C_STRUCT_E) {
                    align = objc_alignof_type(type);
                    if((rem = offset % align))
                        offset += align - rem;
                }
                else break;
            }
            break;
        }
        case _C_PTR: {
            *(char**)data = Malloc(objc_sizeof_type(++type));
//            TRY {
//                [self deserializeDataAt:*(char**)data
//                             ofObjCType:type
//                               atCursor:cursor
//                                context:callback];
//            } END_TRY
//            OTHERWISE {
//                lfFree (*(char**)data);
//                RERAISE;
//            } END_CATCH

            break;
        }
        case _C_CHR:
        case _C_UCHR: {
            [self deserializeBytes:data
                            length:sizeof(unsigned char)
                          atCursor:cursor];
            break;
        }
        case _C_SHT:
        case _C_USHT: {
            [self deserializeBytes:data
                            length:sizeof(unsigned short)
                          atCursor:cursor];
            break;
        }
        case _C_INT:
        case _C_UINT: {
            [self deserializeBytes:data
                            length:sizeof(unsigned int)
                          atCursor:cursor];
            break;
        }
        case _C_LNG:
        case _C_ULNG: {
            [self deserializeBytes:data
                            length:sizeof(unsigned long)
                          atCursor:cursor];
            break;
        }
        case _C_FLT: {
            [self deserializeBytes:data
                            length:sizeof(float)
                          atCursor:cursor];
            break;
        }
        case _C_DBL: {
            [self deserializeBytes:data
                            length:sizeof(double)
                          atCursor:cursor];
            break;
        }
        default:
            [NSException raise:NSInconsistentNSData
                        format:@"could not deserialize data."];
    }
}


- (int)deserializeIntAtCursor:(unsigned int*)cursor
{
    unsigned int ni, result;

    [self deserializeBytes:&ni length:sizeof(unsigned int) atCursor:cursor];
    result = network_int_to_host (ni);
    return result;
}

- (void)deserializeBytes:(void*)buffer
                  length:(unsigned int)bytes
                atCursor:(unsigned int*)cursor
{
    NSRange range = { *cursor, bytes };
    [self getBytes:buffer range:range];
    *cursor += bytes;
}

// ----------------------------------------------------------------------------
#pragma mark - Actions
// ----------------------------------------------------------------------------

// ...

// ----------------------------------------------------------------------------

@end

// ----------------------------------------------------------------------------
