// ----------------------------------------------------------------------------
//
//  DatabaseHelper.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// DEPRECATED: Code refactoring is needed
public typealias Database = Connection

// A helper class to manage database creation and version management.
// @link https://github.com/android/platform_frameworks_base/blob/master/core/java/android/database/sqlite/SQLiteOpenHelper.java

public class DatabaseHelper
{
// MARK: - Construction

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

    public final private(set) var database: Database?
    
    public var userVersion: Int {
        get {
            let version = database?.scalar("PRAGMA user_version") ?? Int64(0)
            return Int(version as! Int64)
        }
        set {
            do {
                try _ = database?.run("PRAGMA user_version = \(transcode(Int64(newValue)))")
            }
            catch {
                Logger.e(typeName(self), "Can't set db userVersion", error)
            }
        }
    }

// MARK: - Methods

    /// Checks if database file exists and integrity check of the entire database was successful.
    public static func isValidDatabase(databaseName: String?, delegate: DatabaseOpenDelegate? = nil) -> Bool {
        return DatabaseHelper.sharedInstance.validateDatabase(databaseName: databaseName, delegate: delegate)
    }

// MARK: - Internal Methods
    
    func unpackDatabaseTemplate(databaseName: String, assetPath: URL) -> URL?
    {
        var pathUrl: URL?

        // Copy template file from application assets to the temporary directory
        if let tmpPathUrl = makeTemplatePath(databaseName: databaseName)
        {
            // Remove previous template file
            rxm_removeItemAtURL(url: tmpPathUrl)

            // Copy new template file
            if rxm_copyItemAtURL(srcURL: assetPath, toURL: tmpPathUrl) {
                pathUrl = tmpPathUrl
            }
        }
        else {
            rxm_fatalError(message: "Could not make temporary path for database ‘\(databaseName)’.")
        }

        return pathUrl
    }

    func makeDatabasePath(databaseName: String?) -> URL?
    {
        let name = sanitizeName(name: databaseName)
        var path: URL?

        // Build path to the database file
        if !name.isEmpty && (name != Inner.InMemoryDatabase) {
            path = FileManager.databasesDirectory?.appendingPathComponent((name.rxm_md5String as NSString).appendingPathExtension(FileExtension.SQLite)!)
        }

        // Done
        return path
    }

    func makeTemplatePath(databaseName: String?) -> URL?
    {
        let name = sanitizeName(name: databaseName)
        var path: URL?

        // Build path to the template file
        if !name.isEmpty && (name != Inner.InMemoryDatabase) {
            path = FileManager.temporaryDirectory?.appendingPathComponent((name.rxm_md5String as NSString).appendingPathExtension(FileExtension.SQLite)!)
        }

        // Done
        return path
    }

// MARK: - Private Methods

    private func validateDatabase(databaseName: String?, delegate: DatabaseOpenDelegate? = nil) -> Bool
    {
        var result = false

        // Check if database file exists
        if let path = makeDatabasePath(databaseName: databaseName), path.rxm_isFileExists
        {
            // Check integrity of database
            let database = openDatabase(databaseName: databaseName, version: nil, readonly: true, delegate: delegate)
            result = checkDatabaseIntegrity(database: database)
        }

        // Done
        return result
    }

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

    private func openDatabase(databaseName: String?, version: Int?, readonly: Bool, delegate: DatabaseOpenDelegate?) -> Database?
    {
        var name: String! = sanitizeName(name: databaseName)
        var database: Database!

        // Validate database name
        if let path = makeDatabasePath(databaseName: databaseName), path.rxm_isFileExists {
            name = path.path
        }
        else if (name != Inner.InMemoryDatabase) {
            name = nil
        }

        // Open on-disk OR in-memory database
        if StringUtils.isNotBlank(name) {
            database = createDatabaseObject(uriPath: name, readonly: readonly)

            // Send events to the delegate
            if let delegate = delegate
            {
                Try {
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
                            self.runTransaction(database: database, mode: .exclusive, block: { statement in
                                var result: TransactionResult!
                                var exception: NSException?
                                
                                Try {
                                    
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
                                    
                                    }.Catch { e in
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

                }.Catch { e in

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
    
    private func createDatabase(databaseName: String?, version: Int, readonly: Bool, delegate: DatabaseOpenDelegate?) -> Database?
    {
        let name = sanitizeName(name: databaseName)
        var database: Database?

        // Create on-disk database
        if let dstPath = makeDatabasePath(databaseName: databaseName)
        {
            // Remove previous database file
            rxm_removeItemAtURL(url: dstPath)

            // Get path of the database template file from delegate
            if let (path, encryptionKey) = delegate?.databaseWillCreate(name: databaseName), (path != nil) && path!.rxm_isFileExists
            {
                // Unpack database template from the assets
                if let tmpPath = unpackDatabaseTemplate(databaseName: databaseName!, assetPath: path!), tmpPath.rxm_isFileExists
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

                            execute(database: db, query: "ATTACH DATABASE '\(dstPath.path)' AS `encrypted` KEY '\(key.rxm_hexString)';")
                            execute(database: db, query: "SELECT sqlcipher_export('encrypted');")
                            execute(database: db, query: "DETACH DATABASE `encrypted`;")
                        }
                        else {
                            rxm_copyItemAtURL(srcURL: tmpPath, toURL: dstPath)
                        }

                        // Exclude file from back-up to iCloud
                        FileManager.excludedPathFromBackup(url: dstPath)
                    }

                    // Release resources
                    db = nil

                    // Remove database template file
                    rxm_removeItemAtURL(url: tmpPath)
                }
            }

            // Try to open created database
            database = openDatabase(databaseName: databaseName, version: version, readonly: readonly, delegate: delegate)

            // Remove corrupted database file
            if (database == nil) {
                rxm_removeItemAtURL(url: dstPath)
            }
        }
        // Create in-memory database
        else if (name == Inner.InMemoryDatabase) {
            database = openDatabase(databaseName: databaseName, version: version, readonly: readonly, delegate: delegate)
        }

        // Done
        return database
    }

    private func checkDatabaseIntegrity(database: Database?) -> Bool
    {
        var result = false

        // Check integrity of database
        if (database?.handle != nil) {
            if let value = database?.scalar("PRAGMA quick_check;") as? String {
                result = value.caseInsensitiveCompare("ok") == .orderedSame
            }
        }

        // Done
        return result
    }

    private func sanitizeName(name: String?) -> String {
        return StringUtils.isNotBlank(name) ? name! : Inner.InMemoryDatabase
    }

    // DEPRECATED: Code refactoring is needed
    private func execute(database: Database?, query: String?)
    {
        guard let database = database, let query = query else { return }

        do {
            try database.execute(query)
        }
        catch {
            rxm_fatalError(message: "Database query \(query) failed with error \(error)")
        }
    }

    // DEPRECATED: Code refactoring is needed
    private func createDatabaseObject(uriPath: String?, readonly: Bool) -> Database?
    {
        if uriPath == nil {
            rxm_fatalError(message: "Can't create database object with nil uri path")
        }

        do {
            return try Database(uriPath!, readonly: false)
        }
        catch {
            rxm_fatalError(message: "Can't open db at \(uriPath!) with readonly \(readonly): \(error)")
        }
    }

    // DEPRECATED: Code refactoring is needed
    private func runTransaction(database: Database?, mode: Database.TransactionMode, block: @escaping () throws -> Void)
    {
        if database == nil {
            rxm_fatalError(message: "Can't run transaction on nil database")
        }

        do {
            try database!.transaction(mode, block: block)
        }
        catch {
            rxm_fatalError(message: "Transaction failed with error \(error)")
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
// MARK: - @interface URL
// ----------------------------------------------------------------------------

private extension URL
{
// MARK: - Methods

    var rxm_isFileExists: Bool
    {
        let isReachable = (try? self.checkResourceIsReachable()) ?? false
        return self.isFileURL && isReachable
    }
}

// ----------------------------------------------------------------------------
