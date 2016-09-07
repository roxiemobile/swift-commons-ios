// ----------------------------------------------------------------------------
//
//  AssetUtils.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class AssetUtils: NonCreatable
{
// MARK: - Properties

    public class var schemaAsset: String {
        return Schema.Asset
    }

    public class var schemaFile: String {
        return Schema.File
    }

// MARK: - Functions

    public class func isLocalAsset(path: String?) -> Bool {
        return (path != nil) && (path!.hasPrefix(Schema.Asset) || path!.hasPrefix(Schema.File) || path!.hasPrefix("/"))
    }

    public class func isLocalAssetExists(path assetPath: String, bundle assetBundleOrNil: NSBundle? = nil) -> Bool
    {
        let assetBundle = (assetBundleOrNil ?? NSBundle.mainBundle())
        var string = assetPath
        var result = false

        // Check if string is URL
        if string.hasPrefix(Schema.Asset)
        {
            if let resourcePath = assetBundle.resourcePath
            {
                string = (resourcePath as NSString).stringByAppendingPathComponent(string.substringFromIndex(Schema.Asset.length))
                result = NSFileManager.defaultManager().fileExistsAtPath(string)
            }
        }
        // Check if string is PATH
        else
        {
            if string.hasPrefix(Schema.File) {
                string = string.substringFromIndex(Schema.File.length)
            }

            if let resourcePath = assetBundle.resourcePath where string.hasPrefix(resourcePath) {
                result = NSFileManager.defaultManager().fileExistsAtPath(string)
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

    public class func URL(path assetPath: String, bundle assetBundleOrNil: NSBundle? = nil) -> NSURL?
    {
        let assetBundle = (assetBundleOrNil ?? NSBundle.mainBundle())
        var string = assetPath
        var result: NSURL?

        // Handle assets
        if  string.hasPrefix(Schema.Asset)
        {
            if let resourcePath = assetBundle.resourcePath
            {
                string = (resourcePath as NSString).stringByAppendingPathComponent(string.substringFromIndex(Schema.Asset.length))
                result = NSURL.fileURLWithPath(string)
            }
        }
        else
        // Handle schemas / network protocols
        if  string.hasPrefix(Schema.File ) ||
            string.hasPrefix(Schema.HTTP ) ||
            string.hasPrefix(Schema.HTTPs) ||
            string.hasPrefix(Schema.FTP  )
        {
            result = NSURL(string: string)
        }
        else
        // Handle local files
        if  string.hasPrefix("/")
        {
            // NOTE: The method examines the file system to determine if path is a file or a directory
            result = NSURL.fileURLWithPath(string)
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
