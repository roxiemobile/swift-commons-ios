// ----------------------------------------------------------------------------
//
//  LFObjCRuntime.h
//  Based on part of libFoundation.
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

/**
 * Error codes
 * These are used by the runtime library, and your
 * error handling may use them to determine if the error is
 * hard or soft thus whether execution can continue or abort.
 */
#define OBJC_ERR_UNKNOWN 0             // Generic error

#define OBJC_ERR_OBJC_VERSION 1        // Incorrect runtime version
#define OBJC_ERR_GCC_VERSION 2         // Incorrect compiler version
#define OBJC_ERR_MODULE_SIZE 3         // Bad module size
#define OBJC_ERR_PROTOCOL_VERSION 4    // Incorrect protocol version

#define OBJC_ERR_MEMORY 10             // Out of memory

#define OBJC_ERR_RECURSE_ROOT 20       // Attempt to archive the root object more than once.
#define OBJC_ERR_BAD_DATA 21           // Didn't read expected data
#define OBJC_ERR_BAD_KEY 22            // Bad key for object
#define OBJC_ERR_BAD_CLASS 23          // Unknown class
#define OBJC_ERR_BAD_TYPE 24           // Bad type specification
#define OBJC_ERR_NO_READ 25            // Cannot read stream
#define OBJC_ERR_NO_WRITE 26           // Cannot write stream
#define OBJC_ERR_STREAM_VERSION 27     // Incorrect stream version
#define OBJC_ERR_BAD_OPCODE 28         // Bad opcode

#define OBJC_ERR_UNIMPLEMENTED 30      // Method is not implemented

#define OBJC_ERR_BAD_STATE 40          // Bad thread state

// ----------------------------------------------------------------------------
