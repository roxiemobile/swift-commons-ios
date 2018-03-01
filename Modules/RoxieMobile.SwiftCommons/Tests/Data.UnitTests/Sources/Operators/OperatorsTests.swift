//
//  OperatorsTests.swift
//  SwiftCommons.Data.UnitTests
//
//  Created by Мамунина Наталья Вадимовна on 3/1/18.
//  Copyright © 2018 Alexander Bragin. All rights reserved.
//

@testable import SwiftCommonsData
import SwiftCommonsConcurrent
import XCTest


class OperatorsTests: XCTestCase {
    
    internal func guardNegativeException (
        action: @escaping () -> ()
        ) -> Void {
        var exception: NSException? = nil
        objcTry {
            action()
            }.objcCatch { e in
                exception = e
            }.objcFinally {
                XCTAssertNotNil(exception)
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
