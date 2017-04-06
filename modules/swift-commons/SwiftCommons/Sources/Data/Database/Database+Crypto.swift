// ----------------------------------------------------------------------------
//
//  Database+Crypto.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension Connection
{
// MARK: - Properties

    /**
     * Test to see if we have a good connection to the database.
     *
     * This will confirm whether:
     * - is database open
     * - if open, it will try a simple SELECT statement and confirm that it succeeds.
     *
     * @return  TRUE if everything succeeds, FALSE on failure.
     */
    public final var goodConnection: Bool
    {
        // FMDb/FMDatabase.m
        // @link https://github.com/ccgus/fmdb/blob/master/src/fmdb/FMDatabase.m#L426

        if (self.handle == nil) {
            return false
        }

        var stmt: OpaquePointer? = nil
        var result: Int32?

        // Using SQLite in C programs
        // @link http://www.wassen.net/sqlite-c.html

        if sqlite3_prepare_v2(self.handle, SQL.CheckConnection, -1, &stmt, nil) == SQLITE_OK {
            result = sqlite3_step(stmt)
        }

        sqlite3_finalize(stmt)

        // Done
        return (result == SQLITE_OK || result == SQLITE_ROW || result == SQLITE_DONE)
    }

// MARK: - Constants

    private struct SQL {
        static let CheckConnection = "SELECT `name` FROM `sqlite_master` WHERE `type` = 'table';"
    }
}

// ----------------------------------------------------------------------------
