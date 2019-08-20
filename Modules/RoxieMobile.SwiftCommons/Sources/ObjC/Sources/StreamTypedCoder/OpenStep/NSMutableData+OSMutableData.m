// ----------------------------------------------------------------------------
//
//  NSMutableData+OSMutableData.m
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

#import "NSMutableData+OSMutableData.h"
#include <objc-runtime.h>
#include <common.h>
//#include <Foundation/NSException.h>
#include <OSUtilities.h>

// ----------------------------------------------------------------------------

LF_DECLARE NSString *NSInconsistentNSMutableData = @"NSMutableData is inconsist";

@implementation NSMutableData (OSMutableData)

// ----------------------------------------------------------------------------
#pragma mark - Properties
// ----------------------------------------------------------------------------

static inline unsigned int
host_int_to_network (unsigned int x)
{
    return htonl (x);
}

// ----------------------------------------------------------------------------
#pragma mark - Protected Methods
// ----------------------------------------------------------------------------

// ...

// ----------------------------------------------------------------------------
#pragma mark - Methods
// ----------------------------------------------------------------------------

- (void)serializeDataAt:(const void*)data
             ofObjCType:(const char*)type
                context:(id <OSObjCTypeSerializationCallBack>)callback
{
    if(!data || !type)
        return;

    switch(*type) {
        case _C_ID: {
            [callback serializeObjectAt:(id*)data
                             ofObjCType:type
                               intoData:self];
            break;
        }
        case _C_CHARPTR: {
            int len;

            if(!*(void**)data) {
                [self serializeInt:-1];
                return;
            }

            len = Strlen(*(void**)data);
            [self serializeInt:len];
            [self appendBytes:*(void**)data length:len];

            break;
        }
        case _C_ARY_B: {
            int i, offset, itemSize, count = Atoi(type + 1);
            const char *itemType = type;

            while (isdigit(*++itemType))
                ;
            itemSize = objc_sizeof_type(itemType);

            for (i = offset = 0; i < count; i++, offset += itemSize) {
                [self serializeDataAt:(char*)data + offset
                           ofObjCType:itemType
                              context:callback];
            }
            break;
        }
        case _C_STRUCT_B: {
            int offset = 0;
            int align, rem;

            while(*type != _C_STRUCT_E && *type++ != '='); /* skip "<name>=" */
            while(1) {
                [self serializeDataAt:((char*)data) + offset
                           ofObjCType:type
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
        case _C_PTR:
            [self serializeDataAt:*(char**)data
                       ofObjCType:++type context:callback];
            break;
        case _C_CHR:
        case _C_UCHR:
            [self appendBytes:data length:sizeof(unsigned char)];
            break;
        case _C_SHT:
        case _C_USHT: {
            [self appendBytes:data length:sizeof(unsigned short)];
            break;
        }
        case _C_INT:
        case _C_UINT: {
            [self appendBytes:data length:sizeof(unsigned int)];
            break;
        }
        case _C_LNG:
        case _C_ULNG: {
            [self appendBytes:data length:sizeof(unsigned long)];
            break;
        }
        case _C_FLT: {
            [self appendBytes:data length:sizeof(float)];
            break;
        }
        case _C_DBL: {
            [self appendBytes:data length:sizeof(double)];
            break;
        }
        default:
            [NSException raise:NSInconsistentNSMutableData
                        format:@"could not serialize data."];
    }
}

- (void)serializeInt:(int)value
{
    unsigned int ni = host_int_to_network (value);
    [self appendBytes:&ni length:sizeof(unsigned int)];
}

// ----------------------------------------------------------------------------
#pragma mark - Actions
// ----------------------------------------------------------------------------

// ...

// ----------------------------------------------------------------------------

@end

// ----------------------------------------------------------------------------


