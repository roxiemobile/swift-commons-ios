// ----------------------------------------------------------------------------
//
//  GuardTests.NilOrNotValid.swift
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
using System.Diagnostics.CodeAnalysis;
using RoxieMobile.CSharpCommons.Abstractions.Models;
using RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Models;
using Xunit;

namespace RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Diagnostics
{
    [SuppressMessage("ReSharper", "ExpressionIsAlwaysNull")]
    public partial class GuardTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Guard.NullOrNotValid")]
        public void NullOrNotValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();


            GuardThrowsError(method,
                () => Guard.NullOrNotValid(validObject));

            GuardNotThrowsError(method,
                () => Guard.NullOrNotValid(nilObject));
            GuardNotThrowsError(method,
                () => Guard.NullOrNotValid(notValidObject));
        }
    }
}
*/

extension GuardTests
{
// MARK: - Tests

    func testNilOrNotValid()
    {
//        let validObject: Validatable = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable = NotValidModel()
//
//
//        guardThrowsException("isNilOrNotValid") {
//            Guard.nilOrNotValid(validObject)
//        }
//
//        guardNotThrowsException("isNilOrNotValid") {
//            Guard.nilOrNotValid(nilObject)
//        }
//        guardNotThrowsException("isNilOrNotValid") {
//            Guard.nilOrNotValid(notValidObject)
//        }
    }
}

// ----------------------------------------------------------------------------
