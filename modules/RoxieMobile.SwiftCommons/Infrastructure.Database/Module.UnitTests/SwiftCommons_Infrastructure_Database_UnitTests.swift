//
//  SwiftCommons_Infrastructure_Database_UnitTests.swift
//  SwiftCommons.Infrastructure.Database.UnitTests
//
//  Created by Alexander Bragin on 04.10.2017.
//  Copyright © 2017 Roxie Mobile Ltd. All rights reserved.
//

@testable import SwiftCommonsInfrastructureDatabase
import XCTest

class SwiftCommons_Infrastructure_Database_UnitTests: XCTestCase
{
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
        Dummy.sayHello()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
