// ----------------------------------------------------------------------------
//
//  LFArchiver.m
//  Based on part of libFoundation.
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import "LFArchiver.h"
#import "LFArchiver+Encoding.h"

#import "LFEncoding.h"
#import "LFMemory.h"
#import "LFUnknownTypeException.h"

// ----------------------------------------------------------------------------

// Shortening from "Stream Typed Coder"
NSString * const LFCoderSignature = @"stdc";

// Version of the coder
UInt16 LFCoderVersion = 1505; // 2015-05

// ----------------------------------------------------------------------------

#define REFERENCE  ((UInt8) 128)
#define VALUE      ((UInt8) 127)

// ----------------------------------------------------------------------------

@interface LFArchiver ()

// -- properties

// Caches
@property(nonatomic, strong) NSHashTable *outObjects;       // Objects written so far
@property(nonatomic, strong) NSHashTable *outConditionals;  // Conditional objects
@property(nonatomic, strong) NSHashTable *outPointers;      // Set of pointers
@property(nonatomic, strong) NSMapTable  *outClassAlias;    // Class name -> archive name
@property(nonatomic, strong) NSMapTable  *replacements;     // Src-object to replacement
@property(nonatomic, strong) NSMapTable  *outKeys;          // Src-address -> archive-address

// Destination
@property(nonatomic, strong) NSMutableData *buffer;
@property(nonatomic, assign) NSUInteger archiveIndex;

// Flags
@property(nonatomic, assign) BOOL traceMode;                // YES if finding conditionals
@property(nonatomic, assign) BOOL didWriteHeader;
@property(nonatomic, assign) BOOL encodingRoot;

// --

@end

// ----------------------------------------------------------------------------
#pragma mark - Static Methods
// ----------------------------------------------------------------------------

// In objective-c, how can I tell the difference between a Class and an instance of a class?
// @link http://stackoverflow.com/a/6796941

static inline
BOOL _object_isInstance(id object) {
    return (object == nil) || !class_isMetaClass(object_getClass(object));
}

static inline
BOOL _object_isClass(id object) {
    return (object != nil) && class_isMetaClass(object_getClass(object));
}

// ----------------------------------------------------------------------------

BOOL _object_isCollectable(id object)
{
    return (_object_isClass(object) ||
            [object isKindOfClass:NSString.class] ||
            [object isKindOfClass:NSNumber.class] ||
            [object isKindOfClass:NSData.class  ] ||
            [object isKindOfClass:NSNull.class  ] ||
            [object isKindOfClass:NSValue.class ] );
}

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

//static inline
//BOOL _tag_isReferenceTag(LFTagType tag) {
//    return (BOOL) (tag & REFERENCE);
//}

//static inline
//LFTagType _tag_tagValue(LFTagType tag) {
//    return (LFTagType) (tag & VALUE);
//}

// ----------------------------------------------------------------------------

static inline
size_t rxm_strlen(const char *str) {
    return (str ? strlen(str) : 0);
}

//static inline
//int rxm_atoi(const char* str) {
//    return (str ? atoi(str) : 0);
//}

// ----------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------

@implementation LFArchiver

// ----------------------------------------------------------------------------
#pragma mark - Properties
// ----------------------------------------------------------------------------

@dynamic archiverData;

// ----------------------------------------------------------------------------

- (NSMutableData *)archiverData {
    return self.buffer;
}

// ----------------------------------------------------------------------------
#pragma mark - Protected Methods
// ----------------------------------------------------------------------------

- (void)_beginEncoding
{
    self.traceMode = NO;
    self.encodingRoot = YES;
}

// ----------------------------------------------------------------------------

- (void)_endEncoding
{
    self.traceMode = NO;
    self.encodingRoot = NO;
}

// ----------------------------------------------------------------------------

- (void)_writeArchiveHeader
{
    if (self.didWriteHeader == NO) {
        self.didWriteHeader = YES;

        // Wrire archive header
        [self writeString:LFCoderSignature withTag:YES];
        [self writeUnsignedShort:LFCoderVersion];
    }
}

// ----------------------------------------------------------------------------

- (void)_traceObjectsWithRoot:(id)rootObject
{
    // Pass1: Start tracing for conditionals
    NS_DURING {
        self.traceMode = YES;
        [self encodeObject:rootObject];
    }
    NS_HANDLER {
        self.traceMode = NO;
        [self.outObjects removeAllObjects];
        [localException raise];
    }
    NS_ENDHANDLER;

    self.traceMode = NO;
    [self.outObjects removeAllObjects];
}

// ----------------------------------------------------------------------------

- (void)_encodeObjectsWithRoot:(id)rootObject
{
    // Pass2: Start writing
    [self encodeObject:rootObject];
}

// ----------------------------------------------------------------------------

- (void)_traceValueOfObjCType:(const char *)type at:(const void *)addr
{
    LFTagType tag = (*type);
    switch (tag)
    {
        case _C_ID:
        case _C_CLASS:
        {
            [self _traceObject:*(__strong id *)addr];
            break;
        }

// FIXME: uncomment!
//        case _C_ARY_B: {
//            int count = atoi(type + 1); // eg '[15I' => (count = 15)
//            const char *itemType = type;
//            while(isdigit((int)*(++itemType))) ; // skip dimension
//            [self encodeArrayOfObjCType:itemType count:count at:addr];
//            break;
//        }

// FIXME: uncomment!
//        case _C_STRUCT_B: { // C-structure begin '{'
//            int offset = 0;
//
//            while ((*type != _C_STRUCT_E) && (*type++ != '=')); // skip "<name>="
//
//            while (YES) {
//                [self encodeValueOfObjCType:type at:((char *)addr) + offset];
//            
//                offset += objc_sizeof_type(type);
//                type  =  objc_skip_typespec(type);
//            
//                if (*type != _C_STRUCT_E) { // C-structure end '}'
//                    int align, remainder;
//                    
//                    align = objc_alignof_type(type);
//
//                    if ((remainder = offset % align)) {
//                        offset += (align - remainder);
//                    }
//                }
//                else {
//                    break;
//                }
//            }
//            break;
//        }

        default: {
            [LFUnknownTypeException raiseForType:type];
        }
    }
}

// ----------------------------------------------------------------------------

- (void)_traceObject:(id)object
{
    // Don't trace nil objects ..
    if (object == nil) {
        return;
    }

    if ([self.outObjects containsObject:object])
    {
        // Object wasn't traced yet.

        // Look-up the object in the `conditionals' set. If the object is
        // there, then remove it because it is no longer a conditional one.
        if ([self.outConditionals containsObject:object])
        {
            // Object was marked conditional ..
            [self.outConditionals removeObject:object];
        }

        // Mark object as traced
        [self.outObjects addObject:object];

        if (_object_isInstance(object))
        {
            id replacement = [object replacementObjectForCoder:self];
            if (replacement != object)
            {
                [self.replacements setObject:replacement forKey:object];
                object = replacement;
            }

            Class archiveClass = Nil;
            if (_object_isInstance(object)) {
                archiveClass = [object classForCoder];
            }

            [self encodeObject:archiveClass];
            [object encodeWithCoder:self];
        }
        else {
            // There are no class-variables ..
        }
    }
}

// ----------------------------------------------------------------------------

- (void)_encodeValueOfObjCType:(const char *)type at:(const void *)addr
{
    LFTagType tag = (*type);
    switch (tag)
    {
        case _C_ID:
        case _C_CLASS:
        {
            // ?? Write another tag just to be possible to read using the
            // ?? decodeObject method. (Otherwise a lookahead would be required)
            // ?? _writeTag(self, *_type);

            id object = *((__strong id *) addr);
            [self _encodeObject:object];
            break;
        }

        case _C_ATOM:
        case _C_CHARPTR: {
            [self encodeBytes:(*(void **) addr) length:rxm_strlen(*(void **) addr)];
            break;
        }

        case _C_CHR: {
            [self writeChar:*((char *) addr)];
            break;
        }

        case _C_UCHR: {
            [self writeUnsignedChar:*((unsigned char *) addr)];
            break;
        }

        case _C_SHT: {
            [self writeShort:*((short *) addr)];
            break;
        }

        case _C_USHT: {
            [self writeUnsignedShort:*((unsigned short *) addr)];
            break;
        }

        case _C_INT: {
            [self writeInt:*((int *) addr)];
            break;
        }

        case _C_UINT: {
            [self writeUnsignedInt:*((unsigned int *) addr)];
            break;
        }

        case _C_LNG: {
            [self writeLong:*((long *) addr)];
            break;
        }

        case _C_ULNG: {
            [self writeUnsignedLong:*((unsigned long *) addr)];
            break;
        }

        case _C_LNG_LNG: {
            [self writeLongLong:*((long long *) addr)];
            break;
        }

        case _C_ULNG_LNG: {
            [self writeUnsignedLongLong:*((unsigned long long *) addr)];
            break;
        }

        case _C_FLT: {
            [self writeFloat:*((float *) addr)];
            break;
        }

        case _C_DBL: {
            [self writeDouble:*((double *) addr)];
            break;
        }

        case _C_BOOL: {
            [self writeBool:*((BOOL *) addr)];
            break;
        }

// FIXME: uncomment!
//        case _C_ARY_B: {
//            int count = atoi(type + 1); // eg '[15I' => count = 15
//            const char *itemType = type;
//
//            while(isdigit((int)*(++itemType))); // skip dimension
//
//            // Write another tag just to be possible to read using the
//            // decodeArrayOfObjCType:count:at: method.
//            [self writeTag:tag];
//            [self encodeArrayOfObjCType:itemType count:count at:addr];
//            break;
//        }

// FIXME: uncomment!
//        case _C_STRUCT_B: {
//            [self writeTag:tag];
//
//            int offset = 0; // C-structure begin '{'
//            while ((*type != _C_STRUCT_E) && (*type++ != '=')); // skip "<name>="
//        
//            while (YES) {
//                [self encodeValueOfObjCType:type at:((char *)addr) + offset];
//            
//                offset += objc_sizeof_type(type);
//                type = objc_skip_typespec(type);
//
//                if (*type != _C_STRUCT_E) { // C-structure end '}'
//                    int align, remainder;
//                    
//                    align = objc_alignof_type(type);
//
//                    if ((remainder = offset % align)) {
//                        offset += (align - remainder);
//                    }
//                }
//                else {
//                    break;
//                }
//            }
//            break;
//        }

// FIXME: uncomment!
//        case _C_SEL: {
//            [self writeTag:tag];
//            _writeCString(self, (*(SEL *)addr) ? sel_getName(*(SEL *)addr) : NULL);
//            break;
//        }

// FIXME: uncomment!
//        case _C_PTR: {
//            [self writeTag:tag];
//            _writeObjC(self, *(char **)addr, type + 1);
//            break;
//        }

        default: {
            [LFUnknownTypeException raiseForType:type];
        }
    }
}

// ----------------------------------------------------------------------------

- (void)_encodeObject:(id)object
{
    // Nil object or class
    NSUInteger objectIndex = [self _archiveIndexOfObject:object];
    if (object == nil)
    {
        LFTagType tag = _C_ID;
        [self writeTag:tag | REFERENCE];
        [self writeUnsignedInteger:objectIndex];
        return;
    }

    BOOL isCollectable = _object_isCollectable(object);
    @autoreleasepool
    {
        LFTagType tag = (_object_isInstance(object) ? _C_ID : _C_CLASS);

        // Object was already written
        if (isCollectable && [self.outObjects containsObject:object])
        {
            [self writeTag:tag | REFERENCE];
            [self writeUnsignedInteger:objectIndex];
        }
        else
        {
            // Mark object as written
            if (isCollectable) {
                [self.outObjects addObject:object];
            }

            [self writeTag:tag];
            [self writeUnsignedInteger:objectIndex];

            // A class object
            if (tag == _C_CLASS)
            {
                NSString *className = NSStringFromClass(object);
                className = [self classNameEncodedForTrueClassName:className];

                [self writeString:className withTag:NO];
                [self writeInteger:[object version]];
            }
            else
            {
                object = ([self.replacements objectForKey:object] ?: object);
                object = ([object replacementObjectForCoder:self] ?: object);

                Class archiveClass = [object classForCoder];
                NSAssert(archiveClass, @"No archive class found.");

                [self encodeObject:archiveClass];
                [object encodeWithCoder:self];
            }
        }
    }
}

// ----------------------------------------------------------------------------

- (NSUInteger)_archiveIndexOfObject:(id)object
{
    if (object == nil) {
        return 0;
    }

    NSUInteger objectIndex = 0;

    // Look-up for an index of equivalent object
    if (_object_isCollectable(object))
    {
        objectIndex = [[self.outKeys objectForKey:object] unsignedIntegerValue];
        if (objectIndex == 0)
        {
            objectIndex = (self.archiveIndex++);
            [self.outKeys setObject:@(objectIndex) forKey:object];
        }
    }
    else {
        objectIndex = (self.archiveIndex++);
    }

    // Done
    return objectIndex;
}

// ----------------------------------------------------------------------------

- (NSUInteger)_archiveIndexOfClass:(Class)clazz {
    return [self _archiveIndexOfObject:clazz];
}

// ----------------------------------------------------------------------------
#pragma mark - Methods
// ----------------------------------------------------------------------------

- (instancetype)initForWritingWithMutableData:(NSMutableData *)data
{
    // Validate incoming params
    if (data == nil) {
        return nil;
    }

    // Init instance
    if ((self = [super init]))
    {
        // Init instance variables
        self.outObjects      = [NSHashTable hashTableWithOptions:NSHashTableStrongMemory];
        self.outConditionals = [NSHashTable hashTableWithOptions:NSHashTableStrongMemory];
        self.outPointers     = [NSHashTable hashTableWithOptions:NSHashTableStrongMemory];
        self.outClassAlias   = [NSMapTable strongToStrongObjectsMapTable];
        self.replacements    = [NSMapTable strongToStrongObjectsMapTable];
        self.outKeys         = [NSMapTable strongToStrongObjectsMapTable];

        // Destination
        self.buffer = data;
        self.archiveIndex = 1;
    }

    // Done
    return self;
}

// ----------------------------------------------------------------------------

- (instancetype)init {
    return [self initForWritingWithMutableData:[NSMutableData data]];
}

// ----------------------------------------------------------------------------

+ (NSData *)archivedDataWithRootObject:(id)rootObject
{
    LFArchiver *encoder = [self new];
    NSData *data = nil;

    [encoder encodeRootObject:rootObject];
    data = [encoder.archiverData copy];

    // Done
    return data;
}

// ----------------------------------------------------------------------------

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path
{
    NSData *data = [self archivedDataWithRootObject:rootObject];
    return [data writeToFile:path atomically:YES];
}

// ----------------------------------------------------------------------------

- (void)encodeRootObject:(id)rootObject
{
    [self _beginEncoding];

    NS_DURING {
        /*
         * Prepare for writing the graph objects for which `rootObject' is the root
         * node. The algorithm consists from two passes. In the first pass it
         * determines the nodes so-called 'conditionals' - the nodes encoded *only*
         * with -encodeConditionalObject:. They represent nodes that are not
         * related directly to the graph. In the second pass objects are encoded
         * normally, except for the conditional objects which are encoded as Nil.
         */

        // Pass1: Start tracing for conditionals
        [self _traceObjectsWithRoot:rootObject];

        // Pass2: Start writing
        [self _writeArchiveHeader];
        [self _encodeObjectsWithRoot:rootObject];
    }
    NS_HANDLER {
        // Release resources
        [self _endEncoding];
        [localException raise];
    }
    NS_ENDHANDLER;

    [self _endEncoding];
}

// ----------------------------------------------------------------------------

- (void)encodeConditionalObject:(id)object
{
    // Pass1: Start tracing for conditionals
    if (self.traceMode)
    {
        /*
         * This is the first pass of the determining the conditionals
         * algorithm. We traverse the graph and insert into the `conditionals'
         * set. In the second pass all objects that are still in this set will
         * be encoded as nil when they receive -encodeConditionalObject:. An
         * object is removed from this set when it receives -encodeObject:.
         */

        if (object)
        {
            if ([self.outObjects containsObject:object]) {
                // Object isn't conditional any more (was stored using encodeObject:)
            }
            else
            if ([self.outConditionals containsObject:object]) {
                // Object is already stored as conditional
            }
            else {
                // Insert object in conditionals set
                [self.outConditionals addObject:object];
            }
        }
    }
    // Pass2: Start writing
    else
    {
        BOOL isConditional = [self.outConditionals containsObject:object];

        // If anObject is still in the ‘conditionals’ set, it is encoded as Nil.
        [self encodeObject:(isConditional ? nil : object)];
    }
}

// ----------------------------------------------------------------------------

- (NSString *)classNameEncodedForTrueClassName:(NSString *)trueName
{
    id className = [self.outClassAlias objectForKey:trueName];
    return (className ? className : trueName);
}

// ----------------------------------------------------------------------------

- (void)encodeClassName:(NSString *)trueName intoClassName:(NSString *)inArchiveName {
    [self.outClassAlias setObject:inArchiveName forKey:trueName];
}

// ----------------------------------------------------------------------------

- (void)replaceObject:(id)object withObject:(id)newObject {
    NSLog(@"-[%@ %s] unimplemented in %s at %d", [self class], sel_getName(_cmd), __FILE__, __LINE__);
}

// ----------------------------------------------------------------------------
#pragma mark - @interface NSCoder
// ----------------------------------------------------------------------------

- (void)encodeArrayOfObjCType:(const char *)type count:(NSUInteger)count at:(const void *)array
{
    if ((self.didWriteHeader == NO) && (self.traceMode == NO)) {
        [self _writeArchiveHeader];
    }

    // Array header
    if ( ! self.traceMode) { // Nothing is written during trace-mode
        [self writeTag:_C_ARY_B];
        [self writeInt:(int)count];
    }

    // Optimize writing arrays of elementary types. If such an array has to
    // be written, write the type and then the elements of array.

    if ((*type == _C_ID) || (*type == _C_CLASS)) { // Object array
        int i;

        if (self.traceMode == NO) {
            [self writeTag:*type];
        }

        for (i = 0; i < count; i++) {
            [self encodeObject:((__strong id *)array)[i]];
        }
    }
    else
    // Byte array
    if ((*type == _C_CHR) || (*type == _C_UCHR))
    {
        if (self.traceMode == NO)
        {
            // write base type tag
            [self writeTag:*type];

            // write buffer
            [self writeBytes:array length:count];
        }
    }
    else
    if (_tag_isBaseType(type))
    {
        if (self.traceMode == NO)
        {
            unsigned offset, itemSize = objc_sizeof_type(type);
            int      i;

            // write base type tag
            [self writeTag:*type];

            // write contents
            for (i = offset = 0; i < count; i++, offset += itemSize) {
                [self encodeValueOfObjCType:type at:((char *)array + offset)];
            }
        }
    }
    else
    {
        // Encoded using normal method
        int itemSize = objc_sizeof_type(type);
        for (int idx = 0, offset = 0; idx < count; ++idx, offset += itemSize) {
            [self encodeValueOfObjCType:type at:((char *)array + offset)];
        }
    }
}

// ----------------------------------------------------------------------------

// FIXME: delete!
- (void)encodeBycopyObject:(id)anObject {
    [super encodeBycopyObject:anObject];
}

// ----------------------------------------------------------------------------

// FIXME: delete!
- (void)encodeByrefObject:(id)anObject {
    [super encodeByrefObject:anObject];
}

// ----------------------------------------------------------------------------

- (void)encodeBytes:(const void *)addr length:(NSUInteger)length
{
    // Encode bytes
    [self writeUnsignedInteger:length];
    [self writeBytes:addr length:length];
}

// ----------------------------------------------------------------------------

- (void)encodeDataObject:(NSData *)data
{
    if (self.traceMode == NO) {
        [self encodeBytes:data.bytes length:data.length];
    }
}

// ----------------------------------------------------------------------------

- (void)encodeObject:(id)object
{
    if (self.encodingRoot)
    {
        const char type[] = { (_object_isInstance(object) ? _C_ID : _C_CLASS), 0};
        [self encodeValueOfObjCType:type at:&object];
    }
    else {
        [self encodeRootObject:object];
    }
}

// ----------------------------------------------------------------------------

- (void)encodeValueOfObjCType:(const char *)type at:(const void *)addr
{
    if (self.traceMode) {
        [self _traceValueOfObjCType:type at:addr];
    }
    else {
        [self _writeArchiveHeader];
        [self _encodeValueOfObjCType:type at:addr];
    }
}

// ----------------------------------------------------------------------------

- (void)encodeValuesOfObjCTypes:(const char *)types, ...
{
    va_list args;
    va_start(args, types);

    while (types && *types) {
        [self encodeValueOfObjCType:types at:va_arg(args, void *)];
        types = objc_skip_typespec(types);
    }

    va_end(args);
}

// ----------------------------------------------------------------------------

- (NSInteger)versionForClassName:(NSString *)className {
    // TODO: ...
    [self doesNotRecognizeSelector:_cmd];
    return 0;
}

// ----------------------------------------------------------------------------

@end

// ----------------------------------------------------------------------------
