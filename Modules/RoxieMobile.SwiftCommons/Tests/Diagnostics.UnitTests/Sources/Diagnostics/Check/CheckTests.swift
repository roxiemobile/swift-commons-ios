// ----------------------------------------------------------------------------
//
//  CheckTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

final class CheckTests: XCTestCase
{
// MARK: - Internal Methods

    internal func checkThrowsError(
            _ method: String,
            errorType: Error.Type = CheckError.self,
            file: StaticString = #file,
            line: UInt = #line,
            action: () throws -> ()
    ) -> Void {

        XCTAssert(!method.isEmpty, "‘method’ is empty");
        var cause: Error? = nil

        do {
            try action()
        }
        catch {
            cause = error
        }

        if let error = cause
        {
            if type(of: error) == errorType {
                // Do nothing
            }
            else {
                XCTFail("\(prefix(file, line)) - \(method): Unknown error is thrown")
            }
        }
        else {
            XCTFail("\(prefix(file, line)) - \(method): Method not thrown an error")
        }
    }

    internal func checkNotThrowsError(
            _ method: String,
            errorType: Error.Type = CheckError.self,
            file: StaticString = #file,
            line: UInt = #line,
            action: () throws -> ()
    ) -> Void {

        XCTAssert(!method.isEmpty, "‘method’ is empty");
        var cause: Error? = nil

        do {
            try action()
        }
        catch {
            cause = error
        }

        if let error = cause
        {
            if type(of: error) == errorType {
                XCTFail("\(prefix(file, line)) - \(method): Method thrown an error")
            }
            else {
                XCTFail("\(prefix(file, line)) - \(method): Unknown error is thrown")
            }
        }
        else {
            // Do nothing
        }
    }

    internal func loadJson(
            _ filename: String,
            file: StaticString = #file,
            line: UInt = #line
    ) -> [String: Any]? {

        XCTAssert(!filename.isEmpty, "‘filename’ is empty")
        var jsonObject: [String: Any]? = nil

        if let filepath = Bundle(for: type(of: self)).path(forResource: filename, ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: filepath), options: .alwaysMapped)
        {
            if let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments),
               let dict = json as? [String: Any]
            {
                jsonObject = dict
            }
            else {
                XCTFail("\(prefix(file, line)) - Could not parse JSON from file: \(filename).json")
            }
        }
        else {
            XCTFail("\(prefix(file, line)) - Could not load file: \(filename).json")
        }
        return jsonObject
    }

// MARK: - Private Methods

    private func prefix(_ file: StaticString, _ line: UInt) -> String {
        let fileURL = URL(fileURLWithPath: String(describing: file))
        return "\(fileURL.lastPathComponent):\(line)"
    }
}

// ----------------------------------------------------------------------------
