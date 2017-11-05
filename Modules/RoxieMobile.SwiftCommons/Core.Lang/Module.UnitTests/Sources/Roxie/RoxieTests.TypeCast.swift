// ----------------------------------------------------------------------------
//
//  RoxieTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreLang
import XCTest

// ----------------------------------------------------------------------------

extension RoxieTests
{
// MARK: - Tests

    func testForceCast() {
        let method = "Roxie.forceCast"

        let optionalResponder = UIView() as UIResponder?
        XCTAssert(Roxie.type(of: optionalResponder, is: UIResponder?.self), method)

        let optionalView = Roxie.forceCast(optionalResponder, to: UIView?.self)
        XCTAssert(Roxie.type(of: optionalView, is: UIView?.self), method)

        let responder = Roxie.forceCast(optionalResponder, to: UIResponder.self)
        XCTAssert(Roxie.type(of: responder, is: UIResponder.self), method)

        let view: UIView = Roxie.forceCast(responder, to: UIView.self)
        XCTAssert(Roxie.type(of: view, is: UIView.self), method)
    }

    func testConditionalCast() {
        let method = "Roxie.conditionalCast"

        let optionalResponder = UIView() as UIResponder?
        XCTAssert(Roxie.type(of: optionalResponder, is: UIResponder?.self), method)

        let optionalView = Roxie.conditionalCast(optionalResponder, to: UIView.self)
        XCTAssert(Roxie.type(of: optionalView, is: UIView?.self), method)

        let view = Roxie.conditionalCast(optionalView, to: UIView.self)!
        XCTAssert(Roxie.type(of: view, is: UIView.self), method)

        let viewController = Roxie.conditionalCast(optionalView, to: UIViewController.self)
        XCTAssert(viewController == nil, method)
    }
}

// ----------------------------------------------------------------------------
