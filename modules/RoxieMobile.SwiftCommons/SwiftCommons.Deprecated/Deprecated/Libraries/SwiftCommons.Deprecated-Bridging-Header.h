// ----------------------------------------------------------------------------
//
//  SwiftCommons.Deprecated-Bridging-Header.h
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// Use of unresolved identifier ‘sqlite3_key’
// @link https://discuss.zetetic.net/t/use-of-unresolved-identifier-sqlite3-key/1305/10

#define SQLITE_HAS_CODEC 1

// ----------------------------------------------------------------------------
//
//  Use this file to import your target's public headers that you would like
//  to expose to Swift.
//
// ----------------------------------------------------------------------------

#import <SQLCipher/sqlite3.h>

#import "StreamTypedCoder.h"
#import "TryCatchFinally.h"
#import "SSZipArchive.h"
#import "SQLite-Bridging.h"

// ----------------------------------------------------------------------------
