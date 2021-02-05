// ----------------------------------------------------------------------------
//
//  FileLogger.swift
//
//  @author     Artem Burmistrov <burmistrov-aa@roxiemobile.com>
//  @copyright  Copyright (c) 2021, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

/// A logger which logs to the file system
public final class FileLogger: LoggerContract {

// MARK: - Construction

    /// Initializes and returns a newly created logger object.
    public init(fileLink: URL) throws {
        let logFilePath = fileLink.path
        let fm = FileManager.default

        if !fm.fileExists(atPath: logFilePath) {
            fm.createFile(atPath: logFilePath, contents: nil)
        }

        self.file = try FileHandle(forWritingTo: fileLink)
        self.queue = DispatchQueue(label: Inner.queueLabel)

        self.file.seekToEndOfFile()
    }

    deinit {
        self.file.closeFile()
    }

// MARK: - Methods

    internal func writeToFile(message: String) {
        guard let data = "\(message)\n".data(using: .utf8) else {
            return
        }

        queue.async { [weak self] in
            self?.file.write(data)
        }
    }

// MARK: - Constants

    private struct Inner {
        static let queueLabel = "LoggerQueue"
    }

// MARK: - Variables

    private let file: FileHandle
    private let queue: DispatchQueue
}
