// ----------------------------------------------------------------------------
//
//  LFMemory.h
//  Based on part of GNU CC.
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

/**
 * Error handling
 *
 * Call objc_error() or objc_verror() to record an error; this error
 * routine will generally exit the program but not necessarily if the
 * user has installed his own error handler.
 *
 * Call objc_set_error_handler to assign your own function for
 * handling errors.  The function should return YES if it is ok
 * to continue execution, or return NO or just abort if the
 * program should be stopped.  The default error handler is just to
 * print a message on stderr.
 *
 * The error handler function should be of type objc_error_handler
 * The first parameter is an object instance of relevance.
 * The second parameter is an error code.
 * The third parameter is a format string in the printf style.
 * The fourth parameter is a variable list of arguments.
 */
extern void objc_error(id object, int code, const char* fmt, ...);
extern void objc_verror(id object, int code, const char* fmt, va_list ap);
typedef BOOL (*objc_error_handler)(id, int code, const char *fmt, va_list ap);
extern objc_error_handler objc_set_error_handler(objc_error_handler func);

// ----------------------------------------------------------------------------

/**
 * Standard functions for memory allocation and disposal.
 * Users should use these functions in their ObjC programs so
 * that they work properly with garbage collectors as well as
 * can take advantage of the exception/error handling available.
 */
void *
objc_malloc(size_t size);

void *
objc_atomic_malloc(size_t size);

void *
objc_valloc(size_t size);

void *
objc_realloc(void *mem, size_t size);

void *
objc_calloc(size_t nelem, size_t size);

void
objc_free(void *mem);

// ----------------------------------------------------------------------------

/**
 * Hook functions for memory allocation and disposal.
 * This makes it easy to substitute garbage collection systems
 * such as Boehm's GC by assigning these function pointers
 * to the GC's allocation routines.  By default these point
 * to the ANSI standard malloc, realloc, free, etc.
 *
 * Users should call the normal objc routines above for
 * memory allocation and disposal within their programs.
 */
extern void *(*_objc_malloc)(size_t);
extern void *(*_objc_atomic_malloc)(size_t);
extern void *(*_objc_valloc)(size_t);
extern void *(*_objc_realloc)(void *, size_t);
extern void *(*_objc_calloc)(size_t, size_t);
extern void  (*_objc_free)(void *);

// ----------------------------------------------------------------------------
