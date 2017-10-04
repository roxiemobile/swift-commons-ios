// ----------------------------------------------------------------------------
//
//  Assets.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

@available(*, deprecated)
public class Assets: NonCreatable
{
// MARK: - Properties

    @available(*, deprecated)
    public class var schemaAsset: String {
        return Schema.Asset
    }

    @available(*, deprecated)
    public class var schemaFile: String {
        return Schema.File
    }

// MARK: - Methods

    @available(*, deprecated)
    public class func isLocalAsset(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.Asset) || path!.hasPrefix(Schema.File) || path!.hasPrefix("/"))
    }

    @available(*, deprecated)
    public class func isLocalAssetExists(path assetPath: String, bundle assetBundleOrNil: Bundle? = nil) -> Bool
    {
        let assetBundle = (assetBundleOrNil ?? Bundle.main)
        var string = assetPath
        var result = false

        // Check if string is URL
        if string.hasPrefix(Schema.Asset)
        {
            if let resourcePath = assetBundle.resourcePath
            {
                string = (resourcePath as NSString).appendingPathComponent(string.substring(from: Schema.Asset.length))
                result = FileManager.default.fileExists(atPath: string)
            }
        }
        // Check if string is PATH
        else
        {
            if string.hasPrefix(Schema.File) {
                string = string.substring(from: Schema.File.length)
            }

            if let resourcePath = assetBundle.resourcePath, string.hasPrefix(resourcePath) {
                result = FileManager.default.fileExists(atPath: string)
            }
        }

        // Done
        return result
    }

    @available(*, deprecated)
    public class func isRemoteAsset(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.HTTP) || path!.hasPrefix(Schema.HTTPs) || path!.hasPrefix(Schema.FTP))
    }

    @available(*, deprecated)
    public class func isHttpLink(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.HTTP) || path!.hasPrefix(Schema.HTTPs))
    }

    @available(*, deprecated)
    public class func URL(path assetPath: String, bundle assetBundleOrNil: Bundle? = nil) -> URL?
    {
        let assetBundle = (assetBundleOrNil ?? Bundle.main)
        var string = assetPath
        var result: URL?

        // Handle assets
        if  string.hasPrefix(Schema.Asset)
        {
            if let resourcePath = assetBundle.resourcePath
            {
                string = (resourcePath as NSString).appendingPathComponent(string.substring(from: Schema.Asset.length))
                result = Foundation.URL(fileURLWithPath: string)
            }
        }
        else
        // Handle schemas / network protocols
        if  string.hasPrefix(Schema.File ) ||
            string.hasPrefix(Schema.HTTP ) ||
            string.hasPrefix(Schema.HTTPs) ||
            string.hasPrefix(Schema.FTP  )
        {
            result = Foundation.URL(string: string)
        }
        else
        // Handle local files
        if  string.hasPrefix("/")
        {
            // NOTE: The method examines the file system to determine if path is a file or a directory
            result = Foundation.URL(fileURLWithPath: string)
        }

        // Done
        return result
    }

// MARK: - Constants

    @available(*, deprecated)
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
