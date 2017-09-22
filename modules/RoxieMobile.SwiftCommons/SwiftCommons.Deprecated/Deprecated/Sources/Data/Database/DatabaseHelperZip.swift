// ----------------------------------------------------------------------------
//
//  DatabaseHelperZip.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsLang

// ----------------------------------------------------------------------------

@available(*, deprecated)
public class DatabaseHelperZip: DatabaseHelper
{
// MARK: - Construction

    @available(*, deprecated)
    public override init(databaseName: String?, version: Int, readonly: Bool = false, delegate: DatabaseOpenDelegate? = nil) {
        super.init(databaseName: databaseName, version: version, readonly: readonly, delegate: delegate)
    }

// MARK: - Methods

    @available(*, deprecated)
    override func unpackDatabaseTemplate(databaseName: String, assetPath: URL) -> URL? {
        var path: URL?

        // Copy template file from application assets to the temporary directory
        if let tmpPath = makeTemplatePath(databaseName: databaseName)
        {
            // Remove previous template file
            rxm_removeItemAtURL(url: tmpPath)

            // Unzip database template file from the assets
            if SSZipArchive.unzipEntityName(databaseName, fromFilePath: assetPath.path, toDestination: tmpPath.path) {
                path = tmpPath
            }
        }
        else {
            roxie_fatalError(message: "Could not make temporary path for database ‘\(databaseName)’.")
        }

        return path
    }
}

// ----------------------------------------------------------------------------
