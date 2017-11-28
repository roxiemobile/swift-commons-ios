// ----------------------------------------------------------------------------
//
//  DatabaseHelper.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import CryptoSwift
import Foundation
import SQLite
import SwiftCommonsCoreConcurrent
import SwiftCommonsCoreLogging
import SwiftCommonsCoreLang

// ----------------------------------------------------------------------------

// DEPRECATED: Code refactoring is needed
public typealias Database = Connection

// A helper class to manage database creation and version management.
// @link https://github.com/android/platform_frameworks_base/blob/master/core/java/android/database/sqlite/SQLiteOpenHelper.java

@available(*, deprecated, message: "\n• Write a description.")
public class DatabaseHelper
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public init(databaseName: String?, version: Int, readonly: Bool = false, delegate: DatabaseOpenDelegate? = nil)
    {
        // Init instance variables
        self.database = openOrCreateDatabase(databaseName: databaseName, version: version, readonly: readonly, delegate: delegate)
    }

    private init() {
        // Do nothing
    }

    deinit {
        // Release resources
        self.database = nil
    }

// MARK: - Properties

    @available(*, deprecated, message: "\n• Write a description.")
    public final private(set) var database: Database?

    @available(*, deprecated, message: "\n• Write a description.")
    public var userVersion: Int {
        get {
            let version = (try! database?.scalar("PRAGMA user_version")) ?? Int64(0)
            return Int(version as! Int64)
        }
        set {
            do {
                try database?.run("PRAGMA user_version = \(Int64(newValue))")
            }
            catch {
                Logger.e(Roxie.typeName(of: self), "Can't set db userVersion", error)
            }
        }
    }

// MARK: - Methods

    /// Checks if database file exists and integrity check of the entire database was successful.
    public static func isValidDatabase(databaseName: String?, delegate: DatabaseOpenDelegate? = nil) -> Bool {
        return DatabaseHelper.sharedInstance.validateDatabase(databaseName: databaseName, delegate: delegate)
    }

// MARK: - Internal Methods

    @available(*, deprecated, message: "\n• Write a description.")
    internal func unpackDatabaseTemplate(databaseName: String, assetPath: URL) -> URL?
    {
        var path: URL?

        // Copy template file from application assets to the temporary directory
        if let tmpPath = makeTemplatePath(databaseName: databaseName)
        {
            // Remove previous template file
            FileManager.roxie_removeItem(at: tmpPath)

            // Copy new template file
            if FileManager.roxie_copyItem(at: assetPath, to: tmpPath) {
                path = tmpPath
            }
        }
        else {
            Roxie.fatalError("Could not make temporary path for database ‘\(databaseName)’.")
        }

        // Done
        return path
    }

    @available(*, deprecated, message: "\n• Write a description.")
    internal func makeDatabasePath(databaseName: String?) -> URL?
    {
        let name = sanitizeName(name: databaseName)
        var path: URL?

        // Build path to the database file
        if !name.isEmpty && (name != Inner.InMemoryDatabase) {
            path = Roxie.databasesDirectory?.appendingPathComponent((name.md5() as NSString).appendingPathExtension(FileExtension.SQLite)!)
        }

        // Done
        return path
    }

    @available(*, deprecated, message: "\n• Write a description.")
    internal func makeTemplatePath(databaseName: String?) -> URL?
    {
        let name = sanitizeName(name: databaseName)
        var path: URL?

        // Build path to the template file
        if !name.isEmpty && (name != Inner.InMemoryDatabase) {
            path = Roxie.temporaryDirectory?.appendingPathComponent((name.md5() as NSString).appendingPathExtension(FileExtension.SQLite)!)
        }

        // Done
        return path
    }

// MARK: - Private Methods

    @available(*, deprecated, message: "\n• Write a description.")
    private func validateDatabase(databaseName: String?, delegate: DatabaseOpenDelegate? = nil) -> Bool {
        var result = false

        // Check if database file exists
        if let path = makeDatabasePath(databaseName: databaseName), path.roxie_fileExists {

            // Check integrity of database
            let database = openDatabase(databaseName: databaseName, version: nil, readonly: true, delegate: delegate)
            result = checkDatabaseIntegrity(database: database)
        }

        // Done
        return result
    }

    @available(*, deprecated, message: "\n• Write a description.")
    private func openOrCreateDatabase(databaseName: String?, version: Int, readonly: Bool, delegate: DatabaseOpenDelegate?) -> Database?
    {
        // Try to open existing database
        var database = openDatabase(databaseName: databaseName, version: version, readonly: readonly, delegate: delegate)

        // Create and open new database
        if (database == nil) {
            database = createDatabase(databaseName: databaseName, version: version, readonly: readonly, delegate: delegate)
        }

        // Done
        return database
    }

    @available(*, deprecated, message: "\n• Write a description.")
    private func openDatabase(databaseName: String?, version: Int?, readonly: Bool, delegate: DatabaseOpenDelegate?) -> Database?
    {
        var name: String? = sanitizeName(name: databaseName)
        var database: Database!

        // Validate database name
        if let path = makeDatabasePath(databaseName: databaseName), path.roxie_fileExists {
            name = path.path
        }
        else if (name != Inner.InMemoryDatabase) {
            name = nil
        }

        // Open on-disk OR in-memory database
        if name.isNotBlank {
            database = createDatabaseObject(uriPath: name, readonly: readonly)

            // Send events to the delegate
            if let delegate = delegate
            {
                objcTry {
                    // Configure the open database
                    delegate.configureDatabase(name: databaseName, database: database)

                    // Check database connection
                    if !database.goodConnection {
                        NSException(name: NSExceptionName(rawValue: NSError.DatabaseError.Domain), reason: "Database connection is invalid.", userInfo: nil).raise()
                    }

                    // Migrate database
                    if  let newVersion = version {
                        let oldVersion = self.userVersion

                        // Init OR update database if needed
                        if (oldVersion != newVersion)
                        {
                            if database.readonly {
                                NSException(name: NSExceptionName(rawValue: NSError.DatabaseError.Domain), reason: "Can't migrate read-only database from version \(oldVersion) to \(newVersion).", userInfo: nil).raise()
                            }

                            var blockException: NSException?
                            self.runTransaction(database: database, mode: .exclusive, block: {
                                var result: TransactionResult!
                                var exception: NSException?
                                
                                objcTry {
                                    
                                    if (oldVersion == 0) {
                                        delegate.databaseDidCreate(name: databaseName, database: database)
                                    }
                                    else
                                    {
                                        if (oldVersion > newVersion) {
                                            delegate.downgradeDatabase(name: databaseName, database: database, oldVersion: oldVersion, newVersion: newVersion)
                                        }
                                        else {
                                            delegate.upgradeDatabase(name: databaseName, database: database, oldVersion: oldVersion, newVersion: newVersion)
                                        }
                                    }
                                    
                                    // Update schema version
                                    self.userVersion = newVersion
                                    
                                    // Commit transaction on success
                                    result = .Commit
                                    
                                    }.objcCatch { e in
                                        // Rollback transaction on error
                                        exception = e
                                        result = .Rollback
                                }
                                
                                // NOTE: Bug fix for block variable
                                blockException = exception
                                
                                if result == TransactionResult.Rollback {
                                    throw DatabaseError.FailedTransaction
                                }
                            })

                            // Re-throw exception if exists
                            blockException?.raise()
                        }
                    }

                    // Database did open sucessfully
                    delegate.databaseDidOpen(name: databaseName, database: database)

                }.objcCatch { e in

                    // Convert NSException to NSError
                    let error = NSError(code: NSError.DatabaseError.Code.DatabaseIsInvalid, description: e.reason)

                    // Could not open OR migrate database
                    delegate.databaseDidOpenWithError(name: databaseName, error: error)
                    database = nil
                }
            }
            // Check database connection
            else if !database.goodConnection {
                database = nil
            }

        }

        // Done
        return database
    }

    @available(*, deprecated, message: "\n• Write a description.")
    private func createDatabase(databaseName: String?, version: Int, readonly: Bool, delegate: DatabaseOpenDelegate?) -> Database?
    {
        let name = sanitizeName(name: databaseName)
        var database: Database?

        // Create on-disk database
        if let dstPath = makeDatabasePath(databaseName: databaseName)
        {
            // Remove previous database file
            FileManager.roxie_removeItem(at: dstPath)

            // Get path of the database template file from delegate
            if let (path, encryptionKey) = delegate?.databaseWillCreate(name: databaseName), (path != nil) && path!.roxie_fileExists
            {
                // Unpack database template from the assets
                if let tmpPath = unpackDatabaseTemplate(databaseName: databaseName!, assetPath: path!), tmpPath.roxie_fileExists
                {
                    let uriPath = tmpPath.path
                    
                    var db: Database? = createDatabaseObject(uriPath: uriPath, readonly: false)
                    
                    if checkDatabaseIntegrity(database: db)
                    {
                        // Export/copy database template to the "Databases" folder
                        if let key = encryptionKey, !key.isEmpty
                        {
                            // FMDB with SQLCipher Tutorial
                            // @link http://www.guilmo.com/fmdb-with-sqlcipher-tutorial/

                            execute(database: db, query: "ATTACH DATABASE '\(dstPath.path)' AS `encrypted` KEY '\(key.toHexString())';")
                            execute(database: db, query: "SELECT sqlcipher_export('encrypted');")
                            execute(database: db, query: "DETACH DATABASE `encrypted`;")
                        }
                        else {
                            FileManager.roxie_copyItem(at: tmpPath, to: dstPath)
                        }

                        // Exclude file from back-up to iCloud
                        FileManager.roxie_excludeFromBackup(at: dstPath)
                    }

                    // Release resources
                    db = nil

                    // Remove database template file
                    FileManager.roxie_removeItem(at: tmpPath)
                }
            }

            // Try to open created database
            database = openDatabase(databaseName: databaseName, version: version, readonly: readonly, delegate: delegate)

            // Remove corrupted database file
            if (database == nil) {
                FileManager.roxie_removeItem(at: dstPath)
            }
        }
        // Create in-memory database
        else if (name == Inner.InMemoryDatabase) {
            database = openDatabase(databaseName: databaseName, version: version, readonly: readonly, delegate: delegate)
        }

        // Done
        return database
    }

    @available(*, deprecated, message: "\n• Write a description.")
    private func checkDatabaseIntegrity(database: Database?) -> Bool
    {
        var result = false

        // Check integrity of database
        if (database?.handle != nil) {
            if let value = (try? database?.scalar("PRAGMA quick_check;")) as? String {
                result = value.caseInsensitiveCompare("ok") == .orderedSame
            }
        }

        // Done
        return result
    }

    @available(*, deprecated, message: "\n• Write a description.")
    private func sanitizeName(name: String?) -> String
    {
        guard let value = name, value.isNotBlank else { return Inner.InMemoryDatabase }
        return value
    }

    // DEPRECATED: Code refactoring is needed
    @available(*, deprecated, message: "\n• Code refactoring is required.\n• Write a description.")
    private func execute(database: Database?, query: String?)
    {
        guard let database = database, let query = query else { return }

        do {
            try database.execute(query)
        }
        catch {
            Roxie.fatalError("Database query \(query) failed", cause: error)
        }
    }

    // DEPRECATED: Code refactoring is needed
    @available(*, deprecated, message: "\n• Code refactoring is required.\n• Write a description.")
    private func createDatabaseObject(uriPath: String?, readonly: Bool) -> Database?
    {
        if uriPath == nil {
            Roxie.fatalError("Can't create database object with nil uri path")
        }

        do {
            return try Database(uriPath!, readonly: false)
        }
        catch {
            Roxie.fatalError("Can't open db at \(uriPath!) with readonly \(readonly)", cause: error)
        }
    }

    // DEPRECATED: Code refactoring is needed
    @available(*, deprecated, message: "\n• Code refactoring is required.\n• Write a description.")
    private func runTransaction(database: Database?, mode: Database.TransactionMode, block: @escaping () throws -> Void)
    {
        if database == nil {
            Roxie.fatalError("Can't run transaction on nil database")
        }

        do {
            try database!.transaction(mode, block: block)
        }
        catch {
            Roxie.fatalError("Transaction failed", cause: error)
        }
    }

// MARK: - Constants

    private struct Inner {
        static let InMemoryDatabase = Database.Location.inMemory.description
    }

    private struct FileExtension {
        static let SQLite = "sqlite"
    }

// MARK: - Enums

    enum TransactionResult {
        case Rollback
        case Commit
    }

    enum DatabaseError : Error {
        case FailedTransaction
    }

// MARK: - Variables

    private static let sharedInstance: DatabaseHelper = DatabaseHelper()
}

// ----------------------------------------------------------------------------
