// ----------------------------------------------------------------------------
//
//  MessagePackDecoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsConcurrent
import SwiftCommonsLang
import SwiftCommonsObjC

// ----------------------------------------------------------------------------

public final class MessagePackDecoder: AbstractDecoder, MessagePackCoder {

// MARK: - Construction

    /// TODO
    public override init(
        forReadingFrom data: Data,
        failurePolicy policy: CodingFailurePolicy = .setErrorAndReturn
    ) {
        // Parent processing
        super.init(forReadingFrom: data, failurePolicy: policy)
    }

// MARK: - Properties

    /// Returns the system version number in effect when the archive was created
    /// or `0` if version was not read.
    public override var systemVersion: UInt32 {

        var version = self.encoderVersion
        if (version == Inner.UnknownEncoderVersion) {

            try? _decodeWithErrorHandling { [weak self] in
                version = self?.encoderVersion ?? Inner.UnknownEncoderVersion
            }
        }
        return version
    }

// MARK: - Methods

    /// Decodes an `object` that was previously encoded.
    ///
    /// - Returns:
    ///   The decoded object.
    ///
    public override func decodeObject() -> Any? {
        var object: Any?

        try? _decodeWithErrorHandling { [weak self] in
            object = self?._decodeObject()
        }
        return object
    }

    /// Returns version in effect for the class named `className` or `NSNotFound`
    /// if no class named `className` exists.
    ///
    /// - Parameter:
    ///   - className: The class name.
    ///
    /// - Returns:
    ///   The version number of the class being decoded.
    ///
    public override func version(forClassName className: String) -> Int {
        var version: Int?

        try? _decodeWithErrorHandling { [weak self] in
            version = self?._version(forClassName: className)
        }
        return version ?? NSNotFound
    }

// MARK: - Constants

    private struct Inner {
        static let UnknownEncoderVersion: UInt32 = 0
    }

// MARK: - Variables

    private var didReadHeader = false

    private var encoderVersion = Inner.UnknownEncoderVersion
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension MessagePackDecoder {

// MARK: - Private Methods

    private func _decodeValue(ofObjCType typep: UnsafePointer<Int8>, at addr: UnsafeMutableRawPointer) {

        var isReference = false
        let decodedType = _readType(isReference: &isReference)

        let type = ObjCType(typep.pointee)
        switch (type) {

            case .ID:
                _checkType(type: decodedType, reqType: .ID)
                let ptr = addr.initializeMemory(as: AnyObject?.self, repeating: nil, count: 1)

                if let object = _decodeObject(isReference) as AnyObject? {
                    ptr.pointee = object
                }

            default:
                UnsupportedTypeException.raise(withType: type)
        }
    }

    private func _decodeObject() -> Any? {
        var object: AnyObject?

        withUnsafeMutablePointer(to: &object) { (ptr: UnsafeMutablePointer<AnyObject?>) -> Void in
            var type = ObjCType.ID.rawValue
            _decodeValue(ofObjCType: &type, at: UnsafeMutableRawPointer(ptr))
        }
        return object
    }

    private func _decodeObject(_ isReference: Bool) -> Any? {

        let archiveIndex = _readUnsignedInteger()
        var object: Any?

        // Nil object or unused conditional object
        guard (archiveIndex > 0) else {
            return nil
        }

        if (isReference) {
            object = self.collectedObjects[archiveIndex]
            if (object == nil) {
                let message = "Did not find referenced object `\(archiveIndex)`."
                InconsistentArchiveException.raise(reason: message)
            }
        }
        else {

            // Decode an object
            if let data = _decodeData() {
                do {
                    object = try MPMessagePackReader.read(data)
                }
                catch let error as NSError {
                    let message = error.localizedDescription
                    InconsistentArchiveException.raise(reason: message, userInfo: [UserInfoKeys.NSErrorKey: error])
                }
            }

            if let nsObject = (object as? NSObject),
               let replacement = (nsObject.awakeAfter(using: self) as? NSObject), (nsObject != replacement) {

                object = replacement
            }
        }

        // Done
        return object
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension MessagePackDecoder {

// MARK: - Private Methods

    private func _decodeWithErrorHandling(action: @escaping () -> Void) throws {
        try _executeWithErrorHandling {
            self._readArchiveHeader()
            action()
        }
    }

    private func _readArchiveHeader() {

        if !self.didReadHeader {
            self.didReadHeader = true

            // Read archive header
            let signature = _readString(withType: true)
            let version = _readUnsignedShort()

            // Validate values, which was read
            if (signature != _coderSignature()) {
                let message = "Used a different coder (signature `\(signature)`, version `\(version)`)."
                InconsistentArchiveException.raise(reason: message)
            }
            else if (version != _coderVersion()) {
                let message = "Used a different coder version (encoder `\(version)`, decoder `\(_coderVersion())`)."
                InconsistentArchiveException.raise(reason: message)
            }

            // Store version of encoder
            self.encoderVersion = UInt32(version)
        }
    }
}
