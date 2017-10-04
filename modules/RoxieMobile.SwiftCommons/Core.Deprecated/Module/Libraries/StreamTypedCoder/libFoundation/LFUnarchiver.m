// ----------------------------------------------------------------------------
//
//  LFUnarchiver.m
//  Based on part of libFoundation.
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import "LFUnarchiver.h"
#import "LFUnarchiver+Decoding.h"

#import "LFArchiver.h"
#import "LFMemory.h"

// ----------------------------------------------------------------------------

NSString * const LFInconsistentArchiveException =
                @"Archive is inconsistent.";

// ----------------------------------------------------------------------------

// FIXME: duplicate code
#define REFERENCE  ((UInt8) 128)
#define VALUE      ((UInt8) 127)

// ----------------------------------------------------------------------------

@interface LFUnarchiver ()

// -- properties

@property(assign) unsigned int systemVersion;               // Archiver's version that wrote the data

// Caches
@property(nonatomic, strong) NSMapTable *mapObjects;        // Decoded objects: key -> object
@property(nonatomic, strong) NSMapTable *mapClasses;        // Decoded classes: key -> class info
@property(nonatomic, strong) NSMapTable *mapPointers;       // Decoded pointers: key -> pointer
@property(nonatomic, strong) NSMapTable *mapClassAlias;     // Archive name -> decoded name
@property(nonatomic, strong) NSMapTable *mapClassVersions;  // Archive name -> class info

// Source
@property(nonatomic, strong) NSData *buffer;
@property(nonatomic, assign) NSUInteger position;

// Flags
@property(nonatomic, assign) BOOL decodingRoot;
@property(nonatomic, assign) BOOL didReadHeader;

// --

@end

// ----------------------------------------------------------------------------
#pragma mark - Static Methods
// ----------------------------------------------------------------------------

// FIXME: duplicate code
static inline
BOOL _tag_isBaseType(const char *type)
{
    LFTagType tag = (*type);
    switch (tag)
    {
        case _C_CHR: case _C_UCHR:
        case _C_SHT: case _C_USHT:
        case _C_INT: case _C_UINT:
        case _C_LNG: case _C_ULNG:
        case _C_FLT: case _C_DBL: {
            return YES;
        }

        default: {
            return NO;
        }
    }
}

// FIXME: duplicate code
static inline
BOOL _tag_isReferenceTag(LFTagType tag) {
    return (BOOL) (tag & REFERENCE);
}

// FIXME: duplicate code
static inline
LFTagType _tag_tagValue(LFTagType tag) {
    return (LFTagType) (tag & VALUE);
}

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

@implementation LFUnarchiver

static NSMapTable *_classToAliasMappings = NULL; // Archive name => decoded name

// ----------------------------------------------------------------------------
#pragma mark - Properties
// ----------------------------------------------------------------------------

@dynamic atEnd;

// ----------------------------------------------------------------------------

- (BOOL)isAtEnd {
    return (self.position >= [self.buffer length]);
}

// ----------------------------------------------------------------------------
#pragma mark - Protected Methods
// ----------------------------------------------------------------------------

- (void)_beginDecoding
{
    //self->cursor = 0;
    [self _readArchiveHeader];
}

// ----------------------------------------------------------------------------

- (void)_endDecoding {
    self.decodingRoot = NO;
}

// ----------------------------------------------------------------------------

- (void)_readArchiveHeader
{
    if (self.didReadHeader == NO) {
        self.didReadHeader = YES;

        // Read archive header
        NSString *signature = [self readStringWithTag:YES];
        self.systemVersion = [self readUnsignedShort];

        if ( ! [signature isEqualToString:LFCoderSignature]) {
            NSLog(@"WARNING: Used a different archiver (signature %@:%i)", signature, [self systemVersion]);
        }
        else
        if ([self systemVersion] != LFCoderVersion) {
            NSLog(@"WARNING: Used a different archiver version (archiver=%i, unarchiver=%i)", [self systemVersion], LFCoderVersion);
        }
    }
}

// ----------------------------------------------------------------------------

- (Class)_decodeClass:(BOOL)_isReference
{
    NSUInteger objectIndex = [self readUnsignedInteger];
    Class object = Nil;

    // Nil class or unused conditional class
    if (objectIndex == 0) {
        return nil;
    }

    if (_isReference) {
        NSAssert(objectIndex, @"Archive ID is 0!");

        object = [self.mapClasses objectForKey:@(objectIndex)];
        if (object == nil) {
            object = [self.mapObjects objectForKey:@(objectIndex)];
        }

        if (object == nil) {
            [NSException raise:LFInconsistentArchiveException format:@"Did not find referenced class %lu.", (unsigned long)objectIndex];
        }
    }
    else
    {
//        NSString  *name   = NULL;
//        NSInteger version = NSNotFound;
//        char      *cname  = _readCString(self);
//
//        if (cname == NULL) {
//            [NSException raise:LFInconsistentArchiveException format:@"Could not decode class name."];
//        }
//
//        name    = [NSString stringWithCString:cname];
//        version = _readInt(self);
//        objc_free(cname); cname = NULL;
//
//        [self.mapClassVersions setObject:@(version) forKey:name];
//
//        if ([name cStringLength] == 0) {
//            [NSException raise:LFInconsistentArchiveException format:@"could not allocate memory for class name."];
//        }

        NSString *name = [self readStringWithTag:NO];
        if (name == nil) {
            [NSException raise:LFInconsistentArchiveException format:@"Could not decode class name."];
        }

        NSInteger version = [self readInteger];
        [self.mapClassVersions setObject:@(version) forKey:name];

        { // check whether the class is to be replaced
            NSString *newName = [self.mapClassAlias objectForKey:name];

            if (newName) {
                name = newName;
            }
            else
            {
                newName = [_classToAliasMappings objectForKey:name];
                if (newName) {
                    name = newName;
                }
            }
        }
    
        object = NSClassFromString(name);

        if (object == Nil) {
            [NSException raise:LFInconsistentArchiveException format:@"Class doesn't exist in this runtime."];
        }

        if ([object version] != version) {
            [NSException raise:LFInconsistentArchiveException format:@"Class versions do not match."];
        }

        [self.mapClasses setObject:object forKey:@(objectIndex)];
    }
  
    NSAssert(object, @"Invalid state, class is Nil.");

    // Done
    return object;
}

// ----------------------------------------------------------------------------

- (id)_decodeObject:(BOOL)_isReference
{
    NSUInteger objectIndex = [self readUnsignedInteger];
    id  result    = nil;

    if (objectIndex == 0) { // nil object or unused conditional object
        return nil;
    }

    if (_isReference) {
        NSAssert(objectIndex, @"Archive ID is 0!");
        
        result = [self.mapObjects objectForKey:@(objectIndex)];
        if (result == nil) {
            result = [self.mapClasses objectForKey:@(objectIndex)];
        }

        if (result == nil) {
            [NSException raise:LFInconsistentArchiveException format:@"Did not find referenced object %lu.", (unsigned long)objectIndex];
        }
    }
    else
    {
        Class class       = Nil;
        id    replacement = nil;

        // decode class info
        [self decodeValueOfObjCType:"#" at:&class];
        NSAssert(class, @"Could not decode class for object.");

        result = [class allocWithZone:NSDefaultMallocZone()];
        [self.mapObjects setObject:result forKey:@(objectIndex)];
        
        replacement = [result initWithCoder:self];
        if (replacement != result)
        {
            result = replacement;
            [self.mapObjects setObject:result forKey:@(objectIndex)];
        }

        replacement = [result awakeAfterUsingCoder:self];
        if (replacement != result)
        {
            result = replacement;
            [self.mapObjects setObject:result forKey:@(objectIndex)];
        }
    }

    // Done
    return result;
}

// ----------------------------------------------------------------------------
#pragma mark - Methods
// ----------------------------------------------------------------------------

+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _classToAliasMappings = [NSMapTable strongToStrongObjectsMapTable];
    });
}

// ----------------------------------------------------------------------------

- (instancetype)initForReadingWithData:(NSData *)data
{
    int minLength = (int)(LFCoderSignature.length + sizeof(LFCoderVersion) + 1);

    // Validate incoming params
    if ([data length] < minLength) {
        return nil;
    }

    // Init instance
    if ((self = [super init]))
    {
        // Init instance variables
        self.mapObjects       = [NSMapTable strongToStrongObjectsMapTable];
        self.mapClasses       = [NSMapTable strongToStrongObjectsMapTable];
        self.mapPointers      = [NSMapTable strongToStrongObjectsMapTable];
        self.mapClassAlias    = [NSMapTable strongToStrongObjectsMapTable];
        self.mapClassVersions = [NSMapTable strongToStrongObjectsMapTable];

        // Source
        self.buffer = data;
        self.position = 0;
    }

    // Done
    return self;
}

// ----------------------------------------------------------------------------

- (instancetype)init {
    return [self initForReadingWithData:[NSData data]];
}

// ----------------------------------------------------------------------------

+ (id)unarchiveObjectWithData:(NSData *)data
{
    LFUnarchiver *decoder = [[self alloc] initForReadingWithData:data];
    id object = [decoder decodeObject];
    return object;
}

// ----------------------------------------------------------------------------

+ (id)unarchiveObjectWithFile:(NSString *)path
{
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data == nil) { return nil; }
    return [self unarchiveObjectWithData:data];
}

// ----------------------------------------------------------------------------

+ (NSString *)classNameDecodedForArchiveClassName:(NSString *)nameInArchive
{
    id className = [_classToAliasMappings objectForKey:nameInArchive];
    return (className ? className : nameInArchive);
}

// ----------------------------------------------------------------------------

+ (void)decodeClassName:(NSString *)nameInArchive asClassName:(NSString *)trueName {
    [_classToAliasMappings setObject:trueName forKey:nameInArchive];
}

// ----------------------------------------------------------------------------

- (NSString *)classNameDecodedForArchiveClassName:(NSString *)nameInArchive
{
    id className = [self.mapClassAlias objectForKey:nameInArchive];
    return (className ? className : nameInArchive);
}

// ----------------------------------------------------------------------------

- (void)decodeClassName:(NSString *)nameInArchive asClassName:(NSString *)trueName  {
    [self.mapClassAlias setObject:trueName forKey:nameInArchive];
}

// ----------------------------------------------------------------------------

- (void)replaceObject:(id)object withObject:(id)newObject {
    NSLog(@"-[%@ %s] unimplemented in %s at %d", [self class], sel_getName(_cmd), __FILE__, __LINE__);
}

// ----------------------------------------------------------------------------
#pragma mark - @interface NSCoder
// ----------------------------------------------------------------------------

- (void)decodeArrayOfObjCType:(const char *)itemType count:(NSUInteger)_count at:(void *)_array
{
    BOOL      startedDecoding = NO;
    LFTagType tag   = [self readTag];
    int __attribute__((unused)) count = [self readInt];

    if ( ! self.decodingRoot)
    {
        self.decodingRoot = YES;
        startedDecoding = YES;
        [self _beginDecoding];
    }
  
    //NGLogT(@"decoder", @"decoding array[%i/%i] of ObjC-type '%s' array-tag='%c'",
    //       _count, count, _type, tag);
  
    NSAssert(tag == _C_ARY_B, @"invalid type ..");
    NSAssert(count == _count, @"invalid array size ..");

    // Arrays of elementary types are written optimized: the type is written
    // then the elements of array follow.
    if ((*itemType == _C_ID) || (*itemType == _C_CLASS)) // object array
    {
        int i;

        //NGLogT(@"decoder", @"decoding object-array[%i] type='%s'", _count, _type);
    
        tag = [self readTag]; // object array
        NSAssert(tag == *itemType, @"invalid array element type ..");

        for (i = 0; i < _count; i++)
            ((__strong id *)_array)[i] = [self decodeObject];
    }
    else
    if ((*itemType == _C_CHR) || (*itemType == _C_UCHR)) // byte array
    {
        tag = [self readTag];
        NSAssert((tag == _C_CHR) || (tag == _C_UCHR), @"invalid byte array type ..");

        // Read buffer
        [self readBytes:_array length:_count];
    }
    else
    if (_tag_isBaseType(itemType))
    {
        unsigned offset, itemSize = objc_sizeof_type(itemType);
        int      i;
      
        tag = [self readTag];
        NSAssert(tag == *itemType, @"invalid array base type ..");

        for (i = offset = 0; i < _count; i++, offset += itemSize) {
            [self decodeValueOfObjCType:itemType at:((char *)_array + offset)];
        }
    }
    else
    {
        // Decode using normal method
        int itemSize = objc_sizeof_type(itemType);
        for (int idx = 0, offset = 0; idx < _count; ++idx, offset += itemSize) {
            [self decodeValueOfObjCType:itemType at:((char *)_array + offset)];
        }
    }

    if (startedDecoding)
    {
        [self _endDecoding];
        self.decodingRoot = NO;
    }
}

// ----------------------------------------------------------------------------

- (void *)decodeBytesWithReturnedLength:(NSUInteger *)lengthPtr
{
    NSUInteger length = [self readUnsignedInteger];
    void *bytes = nil;

    if (length > 0) {
        bytes = (void *)((Byte *)self.buffer.bytes + self.position);
        self.position += length;
    }

    if  (lengthPtr != nil) {
        *lengthPtr  = length;
    }

    // Done
    return bytes;
}

// ----------------------------------------------------------------------------

- (NSData *)decodeDataObject
{
    NSData *data = nil;

    // Decode bytes
    NSUInteger length = 0;
    void *bytes = [self decodeBytesWithReturnedLength:&length];

    if ((length > 0) && (bytes != nil)) {
        data = [NSData dataWithBytes:bytes length:length];
    } else {
        data = [NSData data];
    }

    // Done
    return data;
}

// ----------------------------------------------------------------------------

- (id)decodeObject
{
    id object = nil;

    // Decode object
    const char type[] = { _C_ID, 0 };
    [self decodeValueOfObjCType:type at:&object];

    // Done
    return object;
}

// ----------------------------------------------------------------------------

- (void)decodeValueOfObjCType:(const char *)type at:(void *)data
{
    BOOL startedDecoding = NO;

    if (self.decodingRoot == NO) {
        self.decodingRoot = YES;

        startedDecoding = YES;
        [self _beginDecoding];
    }

    LFTagType tag = _tag_tagValue(*type);
    switch (tag)
    {
        case _C_ID: {
            *(__strong id *)data = [self _decodeObject:_tag_isReferenceTag([self readTag])];
            break;
        }

        case _C_CLASS: {
            *(Class *)data = [self _decodeClass:_tag_isReferenceTag([self readTag])];
            break;
        }

        case _C_ATOM:
        case _C_CHARPTR: {
            char *string = nil;
            NSUInteger length = 0;

            Byte *bytes = [self decodeBytesWithReturnedLength:&length];
            if ((length > 0) && (bytes != nil))
            {
                string = objc_atomic_malloc(length +1);
                string[length] = 0;

                NSCopyMemoryPages(bytes, string, length);
            }

            (*(char **)data) = string;
            break;
        }

        case _C_CHR: {
            *(char *)data = [self readChar];
            break;
        }

        case _C_UCHR: {
            *(unsigned char *)data = [self readUnsignedChar];
            break;
        }

        case _C_SHT: {
            *(short *)data = [self readShort];
            break;
        }

        case _C_USHT: {
            *(unsigned short *)data = [self readUnsignedShort];
            break;
        }

        case _C_INT: {
            *(int *)data = [self readInt];
            break;
        }

        case _C_UINT: {
            *(unsigned int *)data = [self readUnsignedInt];
            break;
        }

        case _C_LNG: {
            *(long *)data = [self readLong];
            break;
        }

        case _C_ULNG: {
            *(unsigned long *)data = [self readUnsignedLong];
            break;
        }

        case _C_LNG_LNG: {
            *(long long *)data = [self readLongLong];
            break;
        }

        case _C_ULNG_LNG: {
            *(unsigned long long *)data = [self readUnsignedLongLong];
            break;
        }

        case _C_FLT: {
            *(float *)data = [self readFloat];
            break;
        }

        case _C_DBL: {
            *(double *)data = [self readDouble];
            break;
        }

        case _C_BOOL: {
            *(BOOL *)data = [self readBool];
            break;
        }

// FIXME: uncomment!
//        case _C_ARY_B: {
//            int        count     = atoi(type + 1); // eg '[15I' => count = 15
//            const char *itemType = type;
//
//            _checkType(*type, _C_ARY_B);
//
//            while(isdigit((int)*(++itemType))) ; // skip dimension
//
//            [self decodeArrayOfObjCType:itemType count:count at:data];
//            break;
//        }

// FIXME: uncomment!
//        case _C_STRUCT_B: {
//            int offset = 0;
//
//            _checkType(*type, _C_STRUCT_B);
//      
//            while ((*type != _C_STRUCT_E) && (*type++ != '=')); // skip "<name>="
//        
//            while (YES) {
//                [self decodeValueOfObjCType:type at:((char *)data) + offset];
//            
//                offset += objc_sizeof_type(type);
//                type = objc_skip_typespec(type);
//            
//                if(*type != _C_STRUCT_E) { // C-structure end '}'
//                    int align, remainder;
//                    
//                    align = objc_alignof_type(type);
//                    if((remainder = offset % align))
//                        offset += (align - remainder);
//                }
//                else
//                    break;
//            }
//            break;
//        }

// FIXME: uncomment!
//        case _C_SEL: {
//            char *name = NULL;
//      
//            _checkType(*type, tag);
//
//            [self readObjC:&name type:@encode(char *)];
//            *(SEL *)data = name ? sel_getUid(name) : NULL;
//            objc_free(name); name = NULL;
//        }

// FIXME: uncomment!
//        case _C_PTR: {
//            [self readObjC:*(char **)data type:(type + 1)]; // skip '^'
//            break;
//        }

        default: {
            [NSException raise:LFInconsistentArchiveException format:@"Unsupported typecode ‘%i’ found.", tag];
        }
    }

    if (startedDecoding)
    {
        [self _endDecoding];
        self.decodingRoot = NO;
    }
}

// ----------------------------------------------------------------------------

- (void)decodeValuesOfObjCTypes:(const char *)types, ...
{
    va_list args;
    va_start(args, types);

    while (types && *types) {
        [self decodeValueOfObjCType:types at:va_arg(args, void *)];
        types = objc_skip_typespec(types);
    }

    va_end(args);
}

// ----------------------------------------------------------------------------

- (NSInteger)versionForClassName:(NSString *)className
{
    id version = [self.mapClassVersions objectForKey:className];
    return (version ? [version  integerValue] : NSNotFound);
}

// ----------------------------------------------------------------------------

@end

// ----------------------------------------------------------------------------

// FIXME: delete!
//    // ----------------------------------------------------------------------------
//
//    FINAL size_t _strlen(const char *str) {
//        return (str ? strlen(str) : 0);
//    }
//
//    FINAL int _atoi(const char* str) {
//        return (str ? atoi(str) : 0);
//    }
//
//    // ----------------------------------------------------------------------------
