// ----------------------------------------------------------------------------
//
//  NSData+Crypto.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSData
{
// MARK: - Properties

    /**
     * Converts data to hex string.
     *
     * How to convert an NSData into an NSString Hex string?
     * @link http://stackoverflow.com/a/7520655
     */
    var rxm_hexString: String
    {
        let charA = UInt8(UnicodeScalar("a").value)
        let char0 = UInt8(UnicodeScalar("0").value)

        @inline(__always) func itoh(byte: UInt8) -> UInt8 {
            return (byte > 9) ? (charA + byte - 10) : (char0 + byte)
        }

        let bytesPtr = UnsafePointer<UInt8>(self.bytes)

        // Allocate buffer for string
        let numberOfBytes = (self.length * 2)
        let buffer = UnsafeMutablePointer<UInt8>.alloc(numberOfBytes)

        // Convert BIN to HEX
        for idx in 0 ..< self.length {
            let offset = (idx * 2)
            let byte: UInt8 = bytesPtr[idx]

            buffer[offset + 0] = itoh((byte & 0xf0) >> 4)
            buffer[offset + 1] = itoh((byte & 0x0f) >> 0)
        }

        // Create sting from buffer
        let string = String(bytesNoCopy: buffer, length: numberOfBytes, encoding: NSASCIIStringEncoding, freeWhenDone: true)!

        // Done
        return string
    }

    /**
     * Calculates MD5 hash string.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_md5String: String {
        return self.rxm_md5Digest.rxm_hexString
    }

    /**
     * Calculates MD5 digest.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_md5Digest: NSData {
        return Hash(self).md5()
    }

    /**
     * Calculates SHA1 hash string.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_sha1String: String {
        return self.rxm_sha1Digest.rxm_hexString
    }

    /**
     * Calculates SHA1 digest.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_sha1Digest: NSData {
        return Hash(self).sha1()
    }

// MARK: - Methods

    static func withBytes(bytes: [UInt8]) -> NSData {
        return NSData(bytes: bytes, length: bytes.count)
    }

    func arrayOfBytes() -> [UInt8]
    {
        let count = self.length / sizeof(UInt8)
        var bytesArray = [UInt8](count: count, repeatedValue: 0)
        self.getBytes(&bytesArray, length: count * sizeof(UInt8))
        return bytesArray
    }

}

// ----------------------------------------------------------------------------

private extension NSMutableData
{
// MARK: - Methods

    func appendBytes(arrayOfBytes: [UInt8]) {
        self.appendBytes(arrayOfBytes, length: arrayOfBytes.count)
    }

}

// ----------------------------------------------------------------------------

private class Hash
{
// MARK: - Construction

    init(_ message: NSData)
    {
        // Init instance variables
        self.message = message
    }

// MARK: - Methods

    func md5() -> NSData
    {
        let tmpMessage = prepare()

        // Hash values
        var hh = MD5.h
        
        // Step 2. Append Length a 64-bit representation of lengthInBits
        let lengthInBits = (message.length * 8)
        let lengthBytes = lengthInBits.bytes(64 / 8)
        tmpMessage.appendBytes(Array(lengthBytes.reverse()))

        // Process the message in successive 512-bit chunks:
        let chunkSizeBytes = 512 / 8 // 64
        var leftMessageBytes = tmpMessage.length
        var i = 0
        while i < tmpMessage.length {
            let chunk = tmpMessage.subdataWithRange(NSRange(location: i, length: min(chunkSizeBytes,leftMessageBytes)))
            
            // Break chunk into sixteen 32-bit words M[j], 0 ≤ j ≤ 15
            var M:[UInt32] = [UInt32](count: 16, repeatedValue: 0)
            let range = NSRange(location:0, length: M.count * sizeof(UInt32))
            chunk.getBytes(UnsafeMutablePointer<Void>(M), range: range)
            
            // Initialize hash value for this chunk:
            var A:UInt32 = hh[0]
            var B:UInt32 = hh[1]
            var C:UInt32 = hh[2]
            var D:UInt32 = hh[3]
            
            var dTemp:UInt32 = 0
            
            // Main loop
            for j in 0..<MD5.k.count {
                var g = 0
                var F:UInt32 = 0
                
                switch (j) {
                case 0...15:
                    F = (B & C) | ((~B) & D)
                    g = j
                    break
                case 16...31:
                    F = (D & B) | (~D & C)
                    g = (5 * j + 1) % 16
                    break
                case 32...47:
                    F = B ^ C ^ D
                    g = (3 * j + 5) % 16
                    break
                case 48...63:
                    F = C ^ (B | (~D))
                    g = (7 * j) % 16
                    break
                default:
                    break
                }
                dTemp = D
                D = C
                C = B
                B = B &+ rotateLeft((A &+ F &+ MD5.k[j] &+ M[g]), n: MD5.s[j])
                A = dTemp    
            }
            
            hh[0] = hh[0] &+ A
            hh[1] = hh[1] &+ B
            hh[2] = hh[2] &+ C
            hh[3] = hh[3] &+ D

            i += chunkSizeBytes
            leftMessageBytes -= chunkSizeBytes
        }

        let buf: NSMutableData = NSMutableData()
        for item in hh {
            var i:UInt32 = item.littleEndian
            buf.appendBytes(&i, length: sizeofValue(i))
        }
        
        return buf.copy() as! NSData
    }

    func sha1() -> NSData
    {
        let tmpMessage = self.prepare()
        
        // Hash values
        var hh = SHA1.h
        
        // Append message length, in a 64-bit big-endian integer. So now the message length is a multiple of 512 bits.
        tmpMessage.appendBytes((message.length * 8).bytes(64 / 8));
        
        // Process the message in successive 512-bit chunks:
        let chunkSizeBytes = 512 / 8 // 64
        var leftMessageBytes = tmpMessage.length
        var i = 0
        while i < tmpMessage.length {
            let chunk = tmpMessage.subdataWithRange(NSRange(location: i, length: min(chunkSizeBytes,leftMessageBytes)))
            // Break chunk into sixteen 32-bit words M[j], 0 ≤ j ≤ 15, big-endian
            // Extend the sixteen 32-bit words into eighty 32-bit words:
            var M:[UInt32] = [UInt32](count: 80, repeatedValue: 0)
            for x in 0..<M.count {
                switch (x) {
                case 0...15:
                    var le:UInt32 = 0
                    chunk.getBytes(&le, range:NSRange(location:x * sizeofValue(M[x]), length: sizeofValue(M[x])));
                    M[x] = le.bigEndian
                    break
                default:
                    M[x] = rotateLeft(M[x-3] ^ M[x-8] ^ M[x-14] ^ M[x-16], n: 1)
                    break
                }
            }
            
            var A = hh[0]
            var B = hh[1]
            var C = hh[2]
            var D = hh[3]
            var E = hh[4]
            
            // Main loop
            for j in 0...79 {
                var f: UInt32 = 0;
                var k: UInt32 = 0
                
                switch (j) {
                case 0...19:
                    f = (B & C) | ((~B) & D)
                    k = 0x5A827999
                    break
                case 20...39:
                    f = B ^ C ^ D
                    k = 0x6ED9EBA1
                    break
                case 40...59:
                    f = (B & C) | (B & D) | (C & D)
                    k = 0x8F1BBCDC
                    break
                case 60...79:
                    f = B ^ C ^ D
                    k = 0xCA62C1D6
                    break
                default:
                    break
                }
                
                let temp = (rotateLeft(A,n: 5) &+ f &+ E &+ M[j] &+ k) & 0xffffffff
                E = D
                D = C
                C = rotateLeft(B, n: 30)
                B = A
                A = temp
            }
            
            hh[0] = (hh[0] &+ A) & 0xffffffff
            hh[1] = (hh[1] &+ B) & 0xffffffff
            hh[2] = (hh[2] &+ C) & 0xffffffff
            hh[3] = (hh[3] &+ D) & 0xffffffff
            hh[4] = (hh[4] &+ E) & 0xffffffff

            i += chunkSizeBytes
            leftMessageBytes -= chunkSizeBytes
        }
        
        // Produce the final hash value (big-endian) as a 160 bit number:
        let buf: NSMutableData = NSMutableData();
        for item in hh {
            var i:UInt32 = item.bigEndian
            buf.appendBytes(&i, length: sizeofValue(i))
        }
        
        return buf.copy() as! NSData;
    }    

// MARK: - Private Methods

    /**
     * Common part for hash calculation. Prepare header data.
     */
    private func prepare(len: Int = 64) -> NSMutableData
    {
        let tmpMessage: NSMutableData = NSMutableData(data: self.message)
        
        // Step 1. Append Padding Bits
        tmpMessage.appendBytes([0x80]) // append one bit (UInt8 with one bit) to message
        
        // Append "0" bit until message length in bits ≡ 448 (mod 512)
        var msgLength = tmpMessage.length
        var counter = 0
      
        while msgLength % len != (len - 8) {
            counter += 1
            msgLength += 1
        }
      
        let bufZeros = UnsafeMutablePointer<UInt8>(calloc(counter, sizeof(UInt8)))
      
        tmpMessage.appendBytes(bufZeros, length: counter)
      
        bufZeros.destroy()
        bufZeros.dealloc(1)
      
        return tmpMessage
    }

// MARK: - Constants

    private struct MD5
    {
        static let h: [UInt32] =
            [0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476]

        // Specifies the per-round shift amounts
        static let s: [UInt32] =
            [7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,
             5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,
             4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,
             6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21]

        // Binary integer part of the sines of integers (Radians)
        static let k: [UInt32] =
            [0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
             0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
             0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
             0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
             0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
             0xd62f105d, 0x2441453,  0xd8a1e681, 0xe7d3fbc8,
             0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
             0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
             0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
             0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
             0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x4881d05,
             0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
             0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
             0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
             0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
             0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391]
    }

    private struct SHA1
    {
        static let h: [UInt32] =
            [0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0]
    }

// MARK: - Variables

    private var message: NSData

}

// ----------------------------------------------------------------------------
// MARK: - Private Global Functions
// ----------------------------------------------------------------------------

private func rotateLeft(v:UInt8, n:UInt8) -> UInt8 {
    return ((v << n) & 0xFF) | (v >> (8 - n))
}

private func rotateLeft(v:UInt16, n:UInt16) -> UInt16 {
    return ((v << n) & 0xFFFF) | (v >> (16 - n))
}

private func rotateLeft(v:UInt32, n:UInt32) -> UInt32 {
    return ((v << n) & 0xFFFFFFFF) | (v >> (32 - n))
}

private func rotateLeft(x:UInt64, n:UInt64) -> UInt64 {
    return (x << n) | (x >> (64 - n))
}

// ----------------------------------------------------------------------------
