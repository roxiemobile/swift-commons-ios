// ----------------------------------------------------------------------------
//
//  GuardTests.AllBlank.swift
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
        [InlineData("Guard.AllBlank")]
        public void AllBlank(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";
            const string whitespaceString = " \t\r\n";

            string[] array = ToArray(nilString, emptyString, whitespaceString);
            string[] nilArray = null;
            string[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllBlank(ToArray(value)));
            GuardThrowsError(method,
                () => Guard.AllBlank(ToArray(nilString, value)));
            GuardThrowsError(method,
                () => Guard.AllBlank(ToArray(emptyString, value)));
            GuardThrowsError(method,
                () => Guard.AllBlank(ToArray(whitespaceString, value)));

            GuardNotThrowsError(method,
                () => Guard.AllBlank(array));
            GuardNotThrowsError(method,
                () => Guard.AllBlank(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllBlank(emptyArray));
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
