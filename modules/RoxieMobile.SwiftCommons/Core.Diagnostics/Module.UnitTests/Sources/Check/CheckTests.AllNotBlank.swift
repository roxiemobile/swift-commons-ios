// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotBlank.swift
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
    public partial class CheckTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Check.AllNotBlank")]
        public void AllNotBlank(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";
            const string whitespaceString = " \t\r\n";

            const string otherString = "otherValue";
            string[] array = ToArray(value, otherString);
            string[] nilArray = null;
            string[] emptyArray = {};


            CheckThrowsException(method,
                () => Check.AllNotBlank(ToArray(nilString)));
            CheckThrowsException(method,
                () => Check.AllNotBlank(ToArray(emptyString)));
            CheckThrowsException(method,
                () => Check.AllNotBlank(ToArray(whitespaceString)));
            CheckThrowsException(method,
                () => Check.AllNotBlank(ToArray(value, whitespaceString)));

            CheckNotThrowsException(method,
                () => Check.AllNotBlank(array));
            CheckNotThrowsException(method,
                () => Check.AllNotBlank(nilArray));
            CheckNotThrowsException(method,
                () => Check.AllNotBlank(emptyArray));
        }
    }
}
*/

extension CheckTests
{
// MARK: - Tests

    // TODO
}

// ----------------------------------------------------------------------------
