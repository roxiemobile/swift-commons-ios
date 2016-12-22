// ----------------------------------------------------------------------------
//
//  NSError.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSError
{
// MARK: - Construction

    public convenience init(code: NSError.DatabaseError.Code, description: String? = nil) {
        self.init(domain: DatabaseError.Domain, code: code.rawValue, userInfo: (description != nil) ? [NSLocalizedDescriptionKey: description!] : nil)
    }

    public convenience init(code: NSError.FileError.Code, description: String? = nil) {
        self.init(domain: FileError.Domain, code: code.rawValue, userInfo: (description != nil) ? [NSLocalizedDescriptionKey: description!] : nil)
    }

    public convenience init(code: NSError.SerializationError.Code, description: String? = nil) {
        self.init(domain: SerializationError.Domain, code: code.rawValue, userInfo: (description != nil) ? [NSLocalizedDescriptionKey: description!] : nil)
    }

// MARK: - Properties

    public class var databaseIsInvalid: NSError
    {
        struct Singleton {
            static let error = NSError(code: DatabaseError.Code.DatabaseIsInvalid,
                    description: "Database is not valid.")
        }
        return Singleton.error
    }

    public class var inputIsInvalid: NSError
    {
        struct Singleton {
            static let error = NSError(code: DatabaseError.Code.InputIsInvalid,
                    description: "Input parameter(s) is not valid.")
        }
        return Singleton.error
    }

    public class var modelIsInvalid: NSError
    {
        struct Singleton {
            static let error = NSError(code: DatabaseError.Code.ModelIsInvalid,
                    description: "Model is not valid. The custom validation for the input data failed.")
        }
        return Singleton.error
    }

// MARK: - Constants

    public struct DatabaseError
    {
        // Error domain
        public static let Domain = "DatabaseErrorDomain"

        // Error code
        public enum Code: Int {
            case DatabaseIsInvalid = 1
            case InputIsInvalid = 2
            case ModelIsInvalid = 3
        }
    }

    public struct FileError
    {
        // Error domain
        static let Domain = "FileErrorDomain"

        // Error code
        public enum Code: Int {
            case FileNotFound = 1
        }
    }

    public struct SerializationError
    {
        // Error domain
        static let Domain = "SerializationErrorDomain"

        // Error code
        public enum Code: Int {
            case CouldNotDecodeRawData = 1
            case ObjectIsInvalid = 2
        }
    }

}

// ----------------------------------------------------------------------------
