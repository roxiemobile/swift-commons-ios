// ----------------------------------------------------------------------------
//
//  CheckTests.AllBlank.swift
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
        [InlineData("Check.AllBlank")]
        public void AllBlank(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";
            const string whitespaceString = " \t\r\n";

            string[] array = ToArray(nilString, emptyString, whitespaceString);
            string[] nilArray = null;
            string[] emptyArray = {};


            CheckThrowsException(method,
                () => Check.AllBlank(ToArray(value)));
            CheckThrowsException(method,
                () => Check.AllBlank(ToArray(nilString, value)));
            CheckThrowsException(method,
                () => Check.AllBlank(ToArray(emptyString, value)));
            CheckThrowsException(method,
                () => Check.AllBlank(ToArray(whitespaceString, value)));

            CheckNotThrowsException(method,
                () => Check.AllBlank(array));
            CheckNotThrowsException(method,
                () => Check.AllBlank(nilArray));
            CheckNotThrowsException(method,
                () => Check.AllBlank(emptyArray));
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
