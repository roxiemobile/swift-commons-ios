// ----------------------------------------------------------------------------
//
//  GuardTests.NilOrValid.swift
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
        [InlineData("Guard.NullOrValid")]
        public void NullOrValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();


            GuardThrowsError(method,
                () => Guard.NullOrValid(notValidObject));

            GuardNotThrowsError(method,
                () => Guard.NullOrValid(validObject));
            GuardNotThrowsError(method,
                () => Guard.NullOrValid(nilObject));
        }
    }
}
*/

extension GuardTests
{
// MARK: - Tests

    // TODO
}

// ----------------------------------------------------------------------------
