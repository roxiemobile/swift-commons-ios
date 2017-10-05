// ----------------------------------------------------------------------------
//
//  GuardTests.AllValid.swift
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
using static RoxieMobile.CSharpCommons.Extensions.ArrayUtils;

namespace RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Diagnostics
{
    [SuppressMessage("ReSharper", "ExpressionIsAlwaysNull")]
    [SuppressMessage("ReSharper", "SuggestVarOrType_Elsewhere")]
    public partial class GuardTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Guard.AllValid")]
        public void AllValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();

            IValidatable[] array = ToArray(validObject);
            IValidatable[] nilArray = null;
            IValidatable[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllValid(ToArray(notValidObject)));
            GuardThrowsError(method,
                () => Guard.AllValid(ToArray(validObject, nilObject)));
            GuardThrowsError(method,
                () => Guard.AllValid(ToArray(validObject, notValidObject)));

            GuardNotThrowsError(method,
                () => Guard.AllValid(array));
            GuardNotThrowsError(method,
                () => Guard.AllValid(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllValid(emptyArray));
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
