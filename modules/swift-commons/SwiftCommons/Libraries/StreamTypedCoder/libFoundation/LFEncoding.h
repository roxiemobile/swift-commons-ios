// ----------------------------------------------------------------------------
//
//  LFEncoding.h
//  Based on part of GNU CC.
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

// ----------------------------------------------------------------------------

typedef SInt8 LFTagType;

// ----------------------------------------------------------------------------

#define _C_CONST    'r'
#define _C_IN       'n'
#define _C_INOUT    'N'
#define _C_OUT      'o'
#define _C_BYCOPY   'O'
#define _C_ONEWAY   'V'

// ----------------------------------------------------------------------------

int objc_aligned_size(const char *type);
int objc_sizeof_type(const char *type);
int objc_alignof_type(const char *type);
int objc_aligned_size(const char *type);

const char *objc_skip_type_qualifiers(const char *type);
const char *objc_skip_typespec(const char *type);

// ----------------------------------------------------------------------------

float  objc_ntohf(float  value);
float  objc_htonf(float  value);

double objc_ntohd(double value);
double objc_htond(double value);

// ----------------------------------------------------------------------------
