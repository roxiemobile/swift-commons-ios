// ----------------------------------------------------------------------------
//
//  Roxie.ByteOrder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Roxie
{
// MARK: - Methods: UInt64

    /// TODO
    public static func htonll(_ value: UInt64) -> UInt64 {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return value
            case OSLittleEndian:
                return CFSwapInt64(value)
            default:
                Roxie.fatalError("ERROR, no HtoNLL conversion for this machine type.")
        }
    }

    /// TODO
    public static func htonll(_ value: Int64) -> Int64 {
        return Int64(bitPattern: Roxie.htonll(UInt64(bitPattern: value)))
    }

    /// TODO
    public static func ntohll(_ value: UInt64) -> UInt64 {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return value
            case OSLittleEndian:
                return CFSwapInt64(value)
            default:
                Roxie.fatalError("ERROR, no NtoHLL conversion for this machine type.")
        }
    }

    /// TODO
    public static func ntohll(_ value: Int64) -> Int64 {
        return Int64(bitPattern: Roxie.ntohll(UInt64(bitPattern: value)))
    }

// MARK: - Methods: UInt32

    /// TODO
    public static func htonl(_ value: UInt32) -> UInt32 {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return value
            case OSLittleEndian:
                return CFSwapInt32(value)
            default:
                Roxie.fatalError("ERROR, no HtoNL conversion for this machine type.")
        }
    }

    /// TODO
    public static func htonl(_ value: Int32) -> Int32 {
        return Int32(bitPattern: Roxie.htonl(UInt32(bitPattern: value)))
    }

    /// TODO
    public static func ntohl(_ value: UInt32) -> UInt32 {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return value
            case OSLittleEndian:
                return CFSwapInt32(value)
            default:
                Roxie.fatalError("ERROR, no NtoHS conversion for this machine type.")
        }
    }

    /// TODO
    public static func ntohl(_ value: Int32) -> Int32 {
        return Int32(bitPattern: Roxie.ntohl(UInt32(bitPattern: value)))
    }

// MARK: - Methods: UInt16

    /// TODO
    public static func htons(_ value: UInt16) -> UInt16 {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return value
            case OSLittleEndian:
                return CFSwapInt16(value)
            default:
                Roxie.fatalError("ERROR, no HtoNS conversion for this machine type.")
        }
    }

    /// TODO
    public static func htons(_ value: Int16) -> Int16 {
        return Int16(bitPattern: Roxie.htons(UInt16(bitPattern: value)))
    }

    /// TODO
    public static func ntohs(_ value: UInt16) -> UInt16 {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return value
            case OSLittleEndian:
                return CFSwapInt16(value)
            default:
                Roxie.fatalError("ERROR, no NtoHL conversion for this machine type.")
        }
    }

    /// TODO
    public static func ntohs(_ value: Int16) -> Int16 {
        return Int16(bitPattern: Roxie.ntohs(UInt16(bitPattern: value)))
    }

// MARK: - Methods: Float

    /// TODO
    public static func htonf(_ value: Float) -> CFSwappedFloat32 {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return CFSwappedFloat32(v: value.bitPattern)
            case OSLittleEndian:
                return CFConvertFloatHostToSwapped(value)
            default:
                Roxie.fatalError("ERROR, no HtoNF conversion for this machine type.")
        }
    }

    /// TODO
    public static func ntohf(_ value: CFSwappedFloat32) -> Float {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return Float(bitPattern: value.v)
            case OSLittleEndian:
                return CFConvertFloatSwappedToHost(value)
            default:
                Roxie.fatalError("ERROR, no NtoHF conversion for this machine type.")
        }
    }

// MARK: - Methods: Double

    /// TODO
    public static func htond(_ value: Double) -> CFSwappedFloat64 {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return CFSwappedFloat64(v: value.bitPattern)
            case OSLittleEndian:
                return CFConvertDoubleHostToSwapped(value)
            default:
                Roxie.fatalError("ERROR, no HtoND conversion for this machine type.")
        }
    }

    /// TODO
    public static func ntohd(_ value: CFSwappedFloat64) -> Double {
        let byteOrder = Int(OSHostByteOrder())
        switch (byteOrder) {
            case OSBigEndian:
                return Double(bitPattern: value.v)
            case OSLittleEndian:
                return CFConvertDoubleSwappedToHost(value)
            default:
                Roxie.fatalError("ERROR, no NtoHD conversion for this machine type.")
        }
    }
}

// ----------------------------------------------------------------------------
