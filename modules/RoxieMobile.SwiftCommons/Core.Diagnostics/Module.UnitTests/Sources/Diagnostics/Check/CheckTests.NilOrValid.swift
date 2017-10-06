// ----------------------------------------------------------------------------
//
//  CheckTests.NilOrValid.swift
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
        [InlineData("Check.NullOrValid")]
        public void NullOrValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();


            CheckThrowsException(method,
                () => Check.NullOrValid(notValidObject));

            CheckNotThrowsException(method,
                () => Check.NullOrValid(validObject));
            CheckNotThrowsException(method,
                () => Check.NullOrValid(nilObject));
        }
    }
}
*/

extension CheckTests
{
// MARK: - Tests

    func testNilOrValid()
    {
//        let validObject: Validatable = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable = NotValidModel()
//
//
//        checkThrowsError("nilorValid") {
//            try Check.nilOrValid(notValidObject)
//        }
//
//        checkNotThrowsError("nilorValid") {
//            try Check.nilOrValid(validObject)
//        }
//        checkNotThrowsError("nilorValid") {
//            try Check.nilOrValid(nilObject)
//        }
    }
}

// ----------------------------------------------------------------------------
