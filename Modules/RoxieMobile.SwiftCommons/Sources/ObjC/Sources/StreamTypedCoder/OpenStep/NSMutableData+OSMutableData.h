// ----------------------------------------------------------------------------
//
//  NSMutableData+OSMutableData.h
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <OSSerialization.h>

// ----------------------------------------------------------------------------

@interface NSMutableData (OSMutableData)

// -- properties

// ...

// -- methods

- (void) serializeDataAt: (const void*)data
              ofObjCType: (const char*)type
                 context: (id <OSObjCTypeSerializationCallBack>)callback;

// --

@end

// ----------------------------------------------------------------------------
