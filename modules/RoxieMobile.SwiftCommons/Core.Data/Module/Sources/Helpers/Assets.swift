// ----------------------------------------------------------------------------
//
//  Assets.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

public final class Assets: NonCreatable
{
// MARK: - Properties

    public static var schemaAsset: String {
        return Schema.Asset
    }

    public static var schemaFile: String {
        return Schema.File
    }

// MARK: - Methods

    public static func isLocalAsset(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.Asset) || path!.hasPrefix(Schema.File) || path!.hasPrefix("/"))
    }

    public static func isLocalAssetExists(path assetPath: String, bundle assetBundleOrNil: Bundle? = nil) -> Bool
    {
        let assetBundle = (assetBundleOrNil ?? Bundle.main)
        var string = assetPath
        var result = false

        // Check if string is URL
        if string.hasPrefix(Schema.Asset)
        {
            if let resourcePath = assetBundle.resourcePath
            {
                string = (resourcePath as NSString).appendingPathComponent(string.substring(from: Schema.Asset.count))
                result = FileManager.default.fileExists(atPath: string)
            }
        }
        // Check if string is PATH
        else
        {
            if string.hasPrefix(Schema.File) {
                string = string.substring(from: Schema.File.count)
            }

            if let resourcePath = assetBundle.resourcePath, string.hasPrefix(resourcePath) {
                result = FileManager.default.fileExists(atPath: string)
            }
        }

        // Done
        return result
    }

    public static func isRemoteAsset(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.HTTP) || path!.hasPrefix(Schema.HTTPs) || path!.hasPrefix(Schema.FTP))
    }

    public static func isHttpLink(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.HTTP) || path!.hasPrefix(Schema.HTTPs))
    }

    public static func URLAddress(path assetPath: String, bundle assetBundleOrNil: Bundle? = nil) -> URL?
    {
        let assetBundle = (assetBundleOrNil ?? Bundle.main)
        var string = assetPath
        var result: URL?

        // Handle assets
        if  string.hasPrefix(Schema.Asset)
        {
            if let resourcePath = assetBundle.resourcePath
            {
                string = (resourcePath as NSString).appendingPathComponent(string.substring(from: Schema.Asset.count))
                result = URL(fileURLWithPath: string)
            }
        }
        else
        // Handle schemas / network protocols
        if  string.hasPrefix(Schema.File ) ||
            string.hasPrefix(Schema.HTTP ) ||
            string.hasPrefix(Schema.HTTPs) ||
            string.hasPrefix(Schema.FTP  )
        {
            result = URL(string: string)
        }
        else
        // Handle local files
        if  string.hasPrefix("/")
        {
            // NOTE: The method examines the file system to determine if path is a file or a directory
            result = URL(fileURLWithPath: string)
        }

        // Done
        return result
    }

// MARK: - Constants

    private struct Schema
    {
        static let Asset = "asset://"
        static let File  = "file://"
        static let HTTP  = "http://"
        static let HTTPs = "https://"
        static let FTP   = "ftp://"
    }
}

// ----------------------------------------------------------------------------
