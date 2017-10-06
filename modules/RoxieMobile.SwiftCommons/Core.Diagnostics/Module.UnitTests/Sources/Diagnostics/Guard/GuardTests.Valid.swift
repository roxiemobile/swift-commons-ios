// ----------------------------------------------------------------------------
//
//  GuardTests.Valid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

/*
using RoxieMobile.CSharpCommons.Abstractions.Models;
using RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Models;
using Xunit;

namespace RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Diagnostics
{
    public partial class GuardTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Guard.Valid")]
        public void Valid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable notValidObject = new NotValidModel();


            GuardThrowsError(method,
                () => Guard.Valid(notValidObject));

            GuardNotThrowsError(method,
                () => Guard.Valid(validObject));
        }
    }
}
*/

extension GuardTests
{
// MARK: - Tests

    func testValid()
    {
//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        guardThrowsException("isValid") {
//            Guard.valid(notValidObject)
//        }
//
//        guardNotThrowsException("isValid") {
//            Guard.valid(validObject)
//        }
    }
}

// ----------------------------------------------------------------------------
