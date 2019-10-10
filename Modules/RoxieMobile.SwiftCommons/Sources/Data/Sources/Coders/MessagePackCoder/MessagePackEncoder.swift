// ----------------------------------------------------------------------------
//
//  MessagePackEncoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import MPMessagePack
import SwiftCommonsLang

// ----------------------------------------------------------------------------

public final class MessagePackEncoder: AbstractEncoder, MessagePackCoder
{
// MARK: - Construction

    /// TODO
    public init(
            forWritingInto data: NSMutableData? = nil,
            failurePolicy policy: CodingFailurePolicy = .setErrorAndReturn,
            sortDictionaryKeys: Bool = false
    ) {
        // Init instance
        self.sortDictionaryKeys = sortDictionaryKeys

        // Parent processing
        super.init(forWritingInto: data, failurePolicy: policy)
    }

// MARK: - Properties

    /// The system version in effect for the archive.
    public override var systemVersion: UInt32 {
        return UInt32(_coderVersion())
    }

// MARK: - Methods

    /// Encodes `object`.
    ///
    /// - Parameters:
    ///   - object: The object to encode.
    ///
    public override func encode(_ object: Any?) {
        try? _encodeWithErrorHandling { [weak self] in
            self?._encode(object)
        }
    }

// MARK: - Variables

    private let sortDictionaryKeys: Bool

    private var didWriteHeader: Bool = false

    private var archiveIndex: UInt = 0
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension MessagePackEncoder
{
// MARK: - Private Methods

    private func _encodeValue(ofObjCType typep: UnsafePointer<Int8>, at addr: UnsafeRawPointer) {

        let type = ObjCType(typep.pointee)
        switch (type) {

            case .ID:
                let ptr = addr.assumingMemoryBound(to: Any.self)
                let object = ptr.pointee as AnyObject?
                _encodeObject(object)

            default:
                UnsupportedTypeException.raise(withType: type)
        }
    }

    private func _encode(_ object: Any?) {
        let itemType: ObjCType = _isInstance(object) ? .ID : .Class

        withUnsafePointer(to: object) { (ptr: UnsafePointer<Any?>) -> Void in
            var type = itemType.rawValue
            _encodeValue(ofObjCType: &type, at: UnsafeRawPointer(ptr))
        }
    }

    private func _encodeObject(_ object: AnyObject?) {
        let itemType: ObjCType = .ID

        let replacement = object?.replacementObject(for: self) as AnyObject?
        guard let object = (replacement ?? object) else {

            // Write a nil object
            _writeType(itemType, asReference: true)
            _writeUnsignedChar(0)

            return
        }

        do {
            // Encode serializable object
            let mdata = try MPMessagePackWriter.write(
                    object, options: self.sortDictionaryKeys ? .sortDictionaryKeys : [])

            // Increment archive index
            self.archiveIndex += 1

            // Write an object
            _writeType(itemType)
            _writeUnsignedInteger(self.archiveIndex)
            _encode(mdata as Data)
        }
        catch let error as NSError {
            InvalidArgumentException(reason: error.localizedDescription, userInfo: [UserInfoKeys.NSErrorKey: error]).raise()
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension MessagePackEncoder
{
// MARK: - Private Methods

    private func _encodeWithErrorHandling(action: @escaping () -> Void) throws -> Void {
        try _executeWithErrorHandling {
            self._writeArchiveHeader()
            action()
        }
    }

    private func _writeArchiveHeader() {

        if !self.didWriteHeader {
            self.didWriteHeader = true

            // Write archive header
            _writeString(_coderSignature(), withType: true)
            _writeUnsignedShort(_coderVersion())
        }
    }
}

// ----------------------------------------------------------------------------
