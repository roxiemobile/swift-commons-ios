// ----------------------------------------------------------------------------
//
//  FileLogger.swift
//
//  @author     Artem Burmistrov <burmistrov-aa@roxiemobile.com>
//  @copyright  Copyright (c) 2021, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsLang

// ----------------------------------------------------------------------------

/// A logger that directs log messages to a file.
public final class FileLogger: LoggerContract {

// MARK: - Construction

    /// Initializes and returns a newly created logger object.
    public init(fileLink: URL) throws {

        let filePath = fileLink.path
        let fm = FileManager.default

        if !fm.fileExists(atPath: filePath) {
            fm.createFile(atPath: filePath, contents: nil)
        }

        _fileHandle = try FileHandle(forWritingTo: fileLink)
        _fileHandle.seekToEndOfFile()
    }

    deinit {
        _fileHandle.closeFile()
    }

// MARK: - Methods

    internal func writeToFile(message: String) {

        _serialQueue.async { [weak self] in
            let data = Data("\(message)\n".utf8)
            self?._fileHandle.write(data)
        }
    }

// MARK: - Constants

    private enum Name {
        static let queue = "roxie.swiftcommons.logging.filelogger.serialqueue"
    }

// MARK: - Variables

    private let _serialQueue = DispatchQueue(label: Name.queue, qos: .utility)

    private let _fileHandle: FileHandle
}
