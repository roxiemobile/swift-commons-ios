// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotEmpty.swift
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
        [InlineData("Guard.AllNotEmpty")]
        public void AllNotEmpty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";

            const string otherString = "otherValue";
            string[] array = ToArray(value, otherString);
            string[] nilArray = null;
            string[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllNotEmpty(ToArray(value, nilString)));
            GuardThrowsError(method,
                () => Guard.AllNotEmpty(ToArray(value, emptyString)));

            GuardNotThrowsError(method,
                () => Guard.AllNotEmpty(array));
            GuardNotThrowsError(method,
                () => Guard.AllNotEmpty(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllNotEmpty(emptyArray));
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
