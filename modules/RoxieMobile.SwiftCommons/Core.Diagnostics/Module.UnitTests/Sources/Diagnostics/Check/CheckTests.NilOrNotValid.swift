// ----------------------------------------------------------------------------
//
//  CheckTests.NilOrNotValid.swift
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
    public partial class CheckTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Check.NullOrNotValid")]
        public void NullOrNotValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();


            CheckThrowsException(method,
                () => Check.NullOrNotValid(validObject));

            CheckNotThrowsException(method,
                () => Check.NullOrNotValid(nilObject));
            CheckNotThrowsException(method,
                () => Check.NullOrNotValid(notValidObject));
        }
    }
}
*/

extension CheckTests
{
// MARK: - Tests

    func testNilOrNotValid()
    {
//        let validObject: Validatable = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable = NotValidModel()
//
//
//        checkThrowsError("nilorNotValid") {
//            try Check.nilOrNotValid(validObject)
//        }
//
//        checkNotThrowsError("nilorNotValid") {
//            try Check.nilOrNotValid(nilObject)
//        }
//        checkNotThrowsError("nilorNotValid") {
//            try Check.nilOrNotValid(notValidObject)
//        }
    }
}

// ----------------------------------------------------------------------------
