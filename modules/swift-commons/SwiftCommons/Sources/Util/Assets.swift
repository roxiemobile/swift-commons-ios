// ----------------------------------------------------------------------------
//
//  Assets.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public class Assets: NonCreatable
{
// MARK: - Properties

    public class var schemaAsset: String {
        return Schema.Asset
    }

    public class var schemaFile: String {
        return Schema.File
    }

// MARK: - Methods

    public class func isLocalAsset(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.Asset) || path!.hasPrefix(Schema.File) || path!.hasPrefix("/"))
    }

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
                string = (resourcePath as NSString).appendingPathComponent(string.substringFrom(index: Schema.Asset.length))
                result = FileManager.default.fileExists(atPath: string)
            }
        }
        // Check if string is PATH
        else
        {
            if string.hasPrefix(Schema.File) {
                string = string.substringFrom(index: Schema.File.length)
            }

            if let resourcePath = assetBundle.resourcePath, string.hasPrefix(resourcePath) {
                result = FileManager.default.fileExists(atPath: string)
            }
        }

        // Done
        return result
    }

    public class func isRemoteAsset(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.HTTP) || path!.hasPrefix(Schema.HTTPs) || path!.hasPrefix(Schema.FTP))
    }

    public class func isHttpLink(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.HTTP) || path!.hasPrefix(Schema.HTTPs))
    }

    public class func URLAddress(path assetPath: String, bundle assetBundleOrNil: Bundle? = nil) -> URL?
    {
        let assetBundle = (assetBundleOrNil ?? Bundle.main)
        var string = assetPath
        var result: URL?

        // Handle assets
        if  string.hasPrefix(Schema.Asset)
        {
            if let resourcePath = assetBundle.resourcePath
            {
                string = (resourcePath as NSString).appendingPathComponent(string.substringFrom(index: Schema.Asset.length))
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
