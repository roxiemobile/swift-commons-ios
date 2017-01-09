// ----------------------------------------------------------------------------
//
//  DatabaseHelperZip.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class DatabaseHelperZip: DatabaseHelper
{
// MARK: - Construction

    public override init(databaseName: String?, version: Int, readonly: Bool = false, delegate: DatabaseOpenDelegate? = nil) {
        super.init(databaseName: databaseName, version: version, readonly: readonly, delegate: delegate)
    }

// MARK: - Methods

    override func unpackDatabaseTemplate(databaseName: String, assetPath: NSURL) -> NSURL?
    {
        var path: NSURL?

        // Copy template file from application assets to the temporary directory
        if let tmpPath = makeTemplatePath(databaseName)
        {
            // Remove previous template file
            mdc_removeItemAtURL(tmpPath)

            // Unzip database template file from the assets
            if SSZipArchive.unzipEntityName(databaseName, fromFilePath: assetPath.path!, toDestination: tmpPath.path!) {
                path = tmpPath
            }
        }
        else {
            mdc_fatalError("Could not make temporary path for database ‘\(databaseName)’.")
        }

        return path
    }

}

// ----------------------------------------------------------------------------
