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

    internal struct Types
    {
        // @formatter:off
        static let C_ID       = Int8("@".utf8.first!)
        static let C_CLASS    = Int8("#".utf8.first!)
        static let C_SEL      = Int8(":".utf8.first!)
        static let C_CHR      = Int8("c".utf8.first!)
        static let C_UCHR     = Int8("C".utf8.first!)
        static let C_SHT      = Int8("s".utf8.first!)
        static let C_USHT     = Int8("S".utf8.first!)
        static let C_INT      = Int8("i".utf8.first!)
        static let C_UINT     = Int8("I".utf8.first!)
        static let C_LNG      = Int8("l".utf8.first!)
        static let C_ULNG     = Int8("L".utf8.first!)
        static let C_LNG_LNG  = Int8("q".utf8.first!)
        static let C_ULNG_LNG = Int8("Q".utf8.first!)
        static let C_FLT      = Int8("f".utf8.first!)
        static let C_DBL      = Int8("d".utf8.first!)
        static let C_BFLD     = Int8("b".utf8.first!)
        static let C_BOOL     = Int8("B".utf8.first!)
        static let C_VOID     = Int8("v".utf8.first!)
        static let C_UNDEF    = Int8("?".utf8.first!)
        static let C_PTR      = Int8("^".utf8.first!)
        static let C_CHARPTR  = Int8("*".utf8.first!)
        static let C_ATOM     = Int8("%".utf8.first!)
        static let C_ARY_B    = Int8("[".utf8.first!)
        static let C_ARY_E    = Int8("]".utf8.first!)
        static let C_UNION_B  = Int8("(".utf8.first!)
        static let C_UNION_E  = Int8(")".utf8.first!)
        static let C_STRUCT_B = Int8("{".utf8.first!)
        static let C_STRUCT_E = Int8("}".utf8.first!)
        static let C_VECTOR   = Int8("!".utf8.first!)
        static let C_CONST    = Int8("r".utf8.first!)
        // @formatter:on
    }

    internal struct Flags
    {
        // @formatter:off
        static let Reference  = UInt8(128)
        static let Value      = UInt8(127)
        // @formatter:on
    }

    internal struct UserInfoKeys
    {
        static let NSErrorKey = "NSError"
        static let NSExceptionKey = "NSException"
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
