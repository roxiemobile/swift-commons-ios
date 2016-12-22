// ----------------------------------------------------------------------------
//
//  ExpectableTests.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons
import UIKit
import XCTest

// ----------------------------------------------------------------------------

class ExpectableTests: XCTestCase, Expectable
{
// MARK: - Methods

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

// MARK: - Tests

    func testFail()
    {
        do {
            try fail("Text message")

            XCTFail("testFail: Method not thrown an exception")
        }
        catch _ as ExpectationError  {
            // Do nothing
        }
        catch {
            XCTFail("testFail: Unknown error is thrown")
        }
    }

// MARK: - Tests

    func testThrowIfFalse()
    {
        do {
            try throwIfFalse(2 > 1)
        }
        catch {
            XCTFail("testThrowIfFalse function fails")
        }
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}

// ----------------------------------------------------------------------------

private struct ValidModel : Validatable
{
    func isValid() -> Bool {
        return true
    }
}

// ----------------------------------------------------------------------------

private struct NotValidModel : Validatable
{
    func isValid() -> Bool {
        return false
    }
}

// ----------------------------------------------------------------------------
