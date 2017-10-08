// ----------------------------------------------------------------------------
//
//  StreamTypedArchiver.m
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

#import "StreamTypedCoder.h"
#import "LFEncoding.h"

#import "LFArchiver.h"
#import "LFUnarchiver.h"

// ----------------------------------------------------------------------------

@interface StreamTypedEncoder ()

// -- properties

@property(nonatomic, strong) LFArchiver *archiver;

// --

@end

// ----------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------

@interface StreamTypedDecoder ()

// -- properties

@property(nonatomic, strong) LFUnarchiver *unarchiver;

// --

@end

// ----------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------

@implementation StreamTypedEncoder

// ----------------------------------------------------------------------------
#pragma mark - Properties
// ----------------------------------------------------------------------------

@dynamic archiverData;

// ----------------------------------------------------------------------------

- (NSMutableData *)archiverData {
    return [self.archiver archiverData];
}

// ----------------------------------------------------------------------------
#pragma mark - Methods
// ----------------------------------------------------------------------------

- (instancetype)initForWritingWithMutableData:(NSMutableData *)data
{
    // Init instance
    if (self = [self init])
    {
        // Init instance variables
        self.archiver = [[LFArchiver alloc] initForWritingWithMutableData:data];
    }

    // Done
    return self;
}

// ----------------------------------------------------------------------------

- (void)dealloc
{
    // Release resources
    self.archiver = nil;
}

// ----------------------------------------------------------------------------

+ (NSData *)archivedDataWithRootObject:(id)rootObject {
    return [LFArchiver archivedDataWithRootObject:rootObject];
}

// ----------------------------------------------------------------------------

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path {
    return [LFArchiver archiveRootObject:rootObject toFile:path];
}

// ----------------------------------------------------------------------------

- (void)encodeRootObject:(id)rootObject {
    [self.archiver encodeRootObject:rootObject];
}

// ----------------------------------------------------------------------------

- (void)encodeConditionalObject:(id)object {
    [self.archiver encodeConditionalObject:object];
}

// ----------------------------------------------------------------------------

- (NSString *)classNameEncodedForTrueClassName:(NSString *)trueName {
    return [self.archiver classNameEncodedForTrueClassName:trueName];
}

// ----------------------------------------------------------------------------

- (void)encodeClassName:(NSString *)trueName intoClassName:(NSString *)inArchiveName {
    [self.archiver encodeClassName:trueName intoClassName:inArchiveName];
}

// ----------------------------------------------------------------------------

- (void)replaceObject:(id)object withObject:(id)newObject {
    [self.archiver replaceObject:object withObject:newObject];
}

// ----------------------------------------------------------------------------
#pragma mark - @interface NSCoder
// ----------------------------------------------------------------------------

- (void)encodeArrayOfObjCType:(const char *)type count:(NSUInteger)count at:(const void *)array {
    [self.archiver encodeArrayOfObjCType:type count:count at:array];
}

// ----------------------------------------------------------------------------

- (void)encodeBycopyObject:(id)anObject {
    [self.archiver encodeBycopyObject:anObject];
}

// ----------------------------------------------------------------------------

- (void)encodeByrefObject:(id)anObject {
    [self.archiver encodeByrefObject:anObject];
}

// ----------------------------------------------------------------------------

- (void)encodeBytes:(const void *)byteaddr length:(NSUInteger)length {
    [self.archiver encodeBytes:byteaddr length:length];
}

// ----------------------------------------------------------------------------

- (void)encodeDataObject:(NSData *)data {
    [self.archiver encodeDataObject:data];
}

// ----------------------------------------------------------------------------

- (void)encodeObject:(id)object {
    [self.archiver encodeObject:object];
}

// ----------------------------------------------------------------------------

- (void)encodeValueOfObjCType:(const char *)type at:(const void *)addr {
    [self.archiver encodeValueOfObjCType:type at:addr];
}

// ----------------------------------------------------------------------------

- (void)encodeValuesOfObjCTypes:(const char *)types, ...
{
    va_list args;
    va_start(args, types);

    while (types && *types) {
        [self.archiver encodeValueOfObjCType:types at:va_arg(args, void *)];
        types = objc_skip_typespec(types);
    }

    va_end(args);
}

// ----------------------------------------------------------------------------

- (NSInteger)versionForClassName:(NSString *)className {
    return [self.archiver versionForClassName:className];
}

// ----------------------------------------------------------------------------

@end

// ----------------------------------------------------------------------------
#pragma mark -
// ----------------------------------------------------------------------------

@implementation StreamTypedDecoder

// ----------------------------------------------------------------------------
#pragma mark - Properties
// ----------------------------------------------------------------------------

@dynamic atEnd, systemVersion;

// ----------------------------------------------------------------------------

- (BOOL)isAtEnd  {
    return [self.unarchiver isAtEnd];
}

// ----------------------------------------------------------------------------

- (unsigned int)systemVersion {
    return [self.unarchiver systemVersion];
}

// ----------------------------------------------------------------------------
#pragma mark - Methods
// ----------------------------------------------------------------------------

- (instancetype)initForReadingWithData:(NSData *)data
{
    // Init instance
    if (self = [self init])
    {
        // Init instance variables
        self.unarchiver = [[LFUnarchiver alloc] initForReadingWithData:data];
    }

    // Done
    return self;
}

// ----------------------------------------------------------------------------

- (void)dealloc
{
    // Release resources
    self.unarchiver = nil;
}

// ----------------------------------------------------------------------------

+ (id)unarchiveObjectWithData:(NSData *)data {
    return [LFUnarchiver unarchiveObjectWithData:data];
}

// ----------------------------------------------------------------------------

+ (id)unarchiveObjectWithFile:(NSString *)path {
    return [LFUnarchiver unarchiveObjectWithFile:path];
}

// ----------------------------------------------------------------------------

+ (NSString *)classNameDecodedForArchiveClassName:(NSString *)nameInArchive {
    return [LFUnarchiver classNameDecodedForArchiveClassName:nameInArchive];
}

// ----------------------------------------------------------------------------

+ (void)decodeClassName:(NSString *)nameInArchive asClassName:(NSString *)trueName {
    [LFUnarchiver decodeClassName:nameInArchive asClassName:trueName];
}

// ----------------------------------------------------------------------------

- (NSString *)classNameDecodedForArchiveClassName:(NSString *)nameInArchive {
    return [self.unarchiver classNameDecodedForArchiveClassName:nameInArchive];
}

// ----------------------------------------------------------------------------

- (void)decodeClassName:(NSString *)nameInArchive asClassName:(NSString *)trueName  {
    [self.unarchiver decodeClassName:nameInArchive asClassName:trueName];
}

// ----------------------------------------------------------------------------

- (void)replaceObject:(id)object withObject:(id)newObject {
    [self.unarchiver replaceObject:object withObject:newObject];
}

// ----------------------------------------------------------------------------
#pragma mark - @interface NSCoder
// ----------------------------------------------------------------------------

- (void)decodeArrayOfObjCType:(const char *)itemType count:(NSUInteger)count at:(void *)array {
    [self.unarchiver decodeArrayOfObjCType:itemType count:count at:array];
}

// ----------------------------------------------------------------------------

- (void *)decodeBytesWithReturnedLength:(NSUInteger *)lengthp {
    return [self.unarchiver decodeBytesWithReturnedLength:lengthp];
}

// ----------------------------------------------------------------------------

- (NSData *)decodeDataObject {
    return [self.unarchiver decodeDataObject];
}

// ----------------------------------------------------------------------------

- (id)decodeObject {
    return [self.unarchiver decodeObject];
}

// ----------------------------------------------------------------------------

- (void)decodeValueOfObjCType:(const char *)type at:(void *)data {
    [self.unarchiver decodeValueOfObjCType:type at:data];
}

// ----------------------------------------------------------------------------

- (void)decodeValuesOfObjCTypes:(const char *)types, ...
{
    va_list args;
    va_start(args, types);

    while (types && *types) {
        [self.unarchiver decodeValueOfObjCType:types at:va_arg(args, void *)];
        types = objc_skip_typespec(types);
    }

    va_end(args);
}

// ----------------------------------------------------------------------------

- (NSInteger)versionForClassName:(NSString *)className {
    return [self.unarchiver versionForClassName:className];
}

// ----------------------------------------------------------------------------

@end

// ----------------------------------------------------------------------------
