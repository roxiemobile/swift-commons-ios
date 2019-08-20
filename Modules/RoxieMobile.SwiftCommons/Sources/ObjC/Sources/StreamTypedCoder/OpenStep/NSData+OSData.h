// ----------------------------------------------------------------------------
//
//  NSData+OSData.h
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <OSSerialization.h>

// ----------------------------------------------------------------------------

@interface NSData (OSData)

// -- properties

// ...

// -- methods

- (void)deserializeDataAt:(void*)data
               ofObjCType:(const char*)type
                 atCursor:(unsigned int*)cursor
                  context:(id <OSObjCTypeSerializationCallBack>)callback;

- (int)deserializeIntAtCursor:(unsigned int*)cursor;

- (void)deserializeBytes:(void*)buffer
                  length:(unsigned int)bytes
                atCursor:(unsigned int*)cursor;

// --

@end

// ----------------------------------------------------------------------------
