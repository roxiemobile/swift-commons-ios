// ----------------------------------------------------------------------------
//
//  AbstractCoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsConcurrent
import SwiftCommonsLang

// ----------------------------------------------------------------------------

open class AbstractCoder: NSCoder, AbstractClass
{
// MARK: - Construction

    /// TODO
    public init(
            failurePolicy: CodingFailurePolicy = .setErrorAndReturn
    ) {
        // Init instance
        self.codingFailurePolicy = failurePolicy
    }

// MARK: - Properties

    /// An error in the encode or decode operation.
    open override var error: Error? {
        return self.innerError
    }

// MARK: - Methods

    /// Signals to coder that the encode or decode operation has failed.
    open override func failWithError(_ error: Error) {

        // Store passed error
        self.innerError = error

        // Raise an exception, if required
        if (self.codingFailurePolicy == .raiseException) {

            let nsError = error as NSError
            let nsException = (nsError.userInfo[UserInfoKeys.NSExceptionKey] as? NSException) ??
                    NSException(name: NSExceptionName(nsError.domain), reason: nsError.localizedDescription, userInfo: [UserInfoKeys.NSErrorKey: error])

            nsException.raise()
        }
    }

// MARK: - Constants

    public struct UserInfoKeys
    {
        static let NSErrorKey = "NSError"
        static let NSExceptionKey = "NSException"
    }

    internal struct ObjCType: OptionSet {
        let rawValue: Int8

        // @formatter:off
        static let ID          = ObjCType(.ID)
        static let Class       = ObjCType(.Class)
        static let Sel         = ObjCType(.Sel)
        static let Char        = ObjCType(.Char)
        static let UChar       = ObjCType(.UChar)
        static let Short       = ObjCType(.Short)
        static let UShort      = ObjCType(.UShort)
        static let Int         = ObjCType(.Int)
        static let UInt        = ObjCType(.UInt)
        static let Long        = ObjCType(.Long)
        static let ULong       = ObjCType(.ULong)
        static let LongLong    = ObjCType(.LongLong)
        static let ULongLong   = ObjCType(.ULongLong)
        static let Float       = ObjCType(.Float)
        static let Double      = ObjCType(.Double)
        static let Bitfield    = ObjCType(.Bitfield)
        static let Bool        = ObjCType(.Bool)
        static let Void        = ObjCType(.Void)
        static let Undef       = ObjCType(.Undef)
        static let Ptr         = ObjCType(.Ptr)
        static let CharPtr     = ObjCType(.CharPtr)
        static let Atom        = ObjCType(.Atom)
        static let ArrayBegin  = ObjCType(.ArrayBegin)
        static let ArrayEnd    = ObjCType(.ArrayEnd)
        static let UnionBegin  = ObjCType(.UnionBegin)
        static let UnionEnd    = ObjCType(.UnionEnd)
        static let StructBegin = ObjCType(.StructBegin)
        static let StructEnd   = ObjCType(.StructEnd)
        static let Vector      = ObjCType(.Vector)
        static let Const       = ObjCType(.Const)
        // @formatter:on
    }

    private enum NSSimpleObjCType : Unicode.Scalar {
        // @formatter:off
        case ID          = "@"
        case Class       = "#"
        case Sel         = ":"
        case Char        = "c"
        case UChar       = "C"
        case Short       = "s"
        case UShort      = "S"
        case Int         = "i"
        case UInt        = "I"
        case Long        = "l"
        case ULong       = "L"
        case LongLong    = "q"
        case ULongLong   = "Q"
        case Float       = "f"
        case Double      = "d"
        case Bitfield    = "b"
        case Bool        = "B"
        case Void        = "v"
        case Undef       = "?"
        case Ptr         = "^"
        case CharPtr     = "*"
        case Atom        = "%"
        case ArrayBegin  = "["
        case ArrayEnd    = "]"
        case UnionBegin  = "("
        case UnionEnd    = ")"
        case StructBegin = "{"
        case StructEnd   = "}"
        case Vector      = "!"
        case Const       = "r"
        // @formatter:on
    }

// MARK: - Variables

    private let codingFailurePolicy: CodingFailurePolicy

    private var innerError: Error? = nil
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractCoder
{
// MARK: - Private Methods

    internal func _executeWithErrorHandling(action: @escaping () -> Void) throws -> Void {

        var nsException: NSException? = nil
        objcTry {

            if (self.error == nil) {
                action()
            }
        }.objcCatch { e in
            nsException = e
        }

        // Handle a raised exception
        if let nsException = nsException {

            if let _ = self.error {
                if (self.codingFailurePolicy == .raiseException) {
                    nsException.raise()
                }
            }
            else {
                let errorDomain = Reflection(of: Swift.type(of: self)).type.name
                let error = NSError(domain: errorDomain, code: 13, userInfo: [UserInfoKeys.NSExceptionKey: nsException])
                failWithError(error)
            }
        }
    }

    internal func _isInstance(_ object: Any?) -> Bool {
        return (object == nil) || !class_isMetaClass(object_getClass(object))
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractCoder.ObjCType
{
// MARK: - Construction

    internal init(_ v: CChar) {
        self.init(rawValue: v)
    }

    internal init(_ v: CUnsignedChar) {
        self.init(rawValue: CChar(bitPattern: v))
    }

    internal init(_ v: Unicode.Scalar) {
        self.init(CUnsignedChar(ascii: v))
    }

    internal init(_ v: String) {
        guard let itemType = v.unicodeScalars.first else {
            UnsupportedTypeException.raise(reason: "Unsupported Objective-C type encoding ‘\(v)’.")
        }
        self.init(itemType)
    }

    private init(_ v: AbstractCoder.NSSimpleObjCType) {
        self.init(CUnsignedChar(ascii: v.rawValue))
    }

// MARK: - Properties

    internal var asValue: AbstractCoder.ObjCType {
        return AbstractCoder.ObjCType(self.toUnsignedChar & Inner.Value)
    }

    internal var asReference: AbstractCoder.ObjCType {
        return AbstractCoder.ObjCType(self.toUnsignedChar | Inner.Reference)
    }

    internal var isReference: Bool {
        return ((self.toUnsignedChar & Inner.Reference) != 0)
    }

    internal var isValidType: Bool {
        return (AbstractCoder.NSSimpleObjCType(rawValue: self.asValue.toUnicodeScalar) != nil)
    }

    internal var toUnicodeScalar: Unicode.Scalar {
        return UnicodeScalar(self.toUnsignedChar)
    }

    internal var toUnsignedChar: CUnsignedChar {
        return CUnsignedChar(bitPattern: self.rawValue)
    }

// MARK: - Constants

    private struct Inner
    {
        // @formatter:off
        static let Reference = CUnsignedChar(128)
        static let Value     = CUnsignedChar(127)
        // @formatter:on
    }
}

// ----------------------------------------------------------------------------
