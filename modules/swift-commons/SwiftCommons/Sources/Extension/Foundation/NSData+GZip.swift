// ----------------------------------------------------------------------------
//
//  NSData+GZip.swift
//
//  Project: NSData-GZIP
//  @link https://github.com/1024jp/NSData-GZIP
//
//  Project: GZIP
//  @link https://github.com/nicklockwood/GZIP
//
// ----------------------------------------------------------------------------

/*
 The MIT License (MIT)
 
 © 2014-2015 1024jp <wolfrosch.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSData
{
// MARK: - Methods

    /// Return gzip-compressed data object or Nil.
    public func gzippedData(level compressionLevel: Float) -> NSData?
    {
        // The compression level is a floating point value between 0.0 and 1.0,
        // with 0.0 meaning no compression and 1.0 meaning maximum compression.
        // A value of 0.1 will provide the fastest possible compression. If you
        // supply a negative value, this will apply the default compression
        // level, which is equivalent to a value of around 0.7.

        if (compressionLevel <= 1.0) && (self.length > 0)
        {
            var stream = self.createZStream()
            let level = (compressionLevel < 0.0) ? Z_DEFAULT_COMPRESSION : Int32(roundf(compressionLevel * 9))

            if deflateInit2_(&stream, level, Z_DEFLATED, 31, 8, Z_DEFAULT_STRATEGY, ZLIB_VERSION, Size.Stream) != Z_OK {
                return nil
            }

            let data = NSMutableData(length: Size.Chunk)!
            while stream.avail_out == 0 {
                if Int(stream.total_out) >= data.length {
                    data.length += Size.Chunk
                }

                stream.next_out = UnsafeMutablePointer<Bytef>(data.mutableBytes).advancedBy(Int(stream.total_out))
                stream.avail_out = uInt(data.length) - uInt(stream.total_out)

                deflate(&stream, Z_FINISH)
            }

            deflateEnd(&stream)
            data.length = Int(stream.total_out)

            return data
        }

        return nil
    }
    
    /// Return gzip-compressed data object or Nil.
    public func gzippedData() -> NSData? {
        return gzippedData(level: -1.0)
    }

    /// Return gzip-decompressed data object or Nil.
    public func gunzippedData() -> NSData?
    {
        if (self.length > 0)
        {
            var stream = self.createZStream()

            if inflateInit2_(&stream, 47, ZLIB_VERSION, Size.Stream) != Z_OK {
                return nil
            }

            let data = NSMutableData(length: self.length * 2)!
            var status: Int32
            repeat {
                if Int(stream.total_out) >= data.length {
                    data.length += self.length / 2;
                }

                stream.next_out = UnsafeMutablePointer<Bytef>(data.mutableBytes).advancedBy(Int(stream.total_out))
                stream.avail_out = uInt(data.length) - uInt(stream.total_out)

                status = inflate(&stream, Z_SYNC_FLUSH)
            } while status == Z_OK

            if inflateEnd(&stream) == Z_OK {
                if status == Z_STREAM_END {
                    data.length = Int(stream.total_out)
                    return data
                }
            }
        }

        return nil
    }

// MARK: - Private Methods

    private func createZStream() -> z_stream
    {
        return z_stream(
            next_in: UnsafeMutablePointer<Bytef>(self.bytes),
            avail_in: uint(self.length),
            total_in: 0,
            next_out: nil,
            avail_out: 0,
            total_out: 0,
            msg: nil,
            state: nil,
            zalloc: nil,
            zfree: nil,
            opaque: nil,
            data_type: 0,
            adler: 0,
            reserved: 0
        )
    }

// MARK: - Constants

    private struct Size {
        static let Stream: Int32 = Int32(sizeof(z_stream))
        static let Chunk : Int = 2 ^ 14
    }

}

// ----------------------------------------------------------------------------
