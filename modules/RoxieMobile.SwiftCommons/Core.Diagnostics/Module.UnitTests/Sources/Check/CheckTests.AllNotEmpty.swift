// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotEmpty.swift
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
    [SuppressMessage("ReSharper", "SuggestVarOrType_Elsewhere")]
    [SuppressMessage("ReSharper", "ExpressionIsAlwaysNull")]
    public partial class CheckTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Check.AllNotEmpty")]
        public void AllNotEmpty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";

            const string otherString = "otherValue";
            string[] array = ToArray(value, otherString);
            string[] nilArray = null;
            string[] emptyArray = {};


            CheckThrowsException(method,
                () => Check.AllNotEmpty(ToArray(value, nilString)));
            CheckThrowsException(method,
                () => Check.AllNotEmpty(ToArray(value, emptyString)));

            CheckNotThrowsException(method,
                () => Check.AllNotEmpty(array));
            CheckNotThrowsException(method,
                () => Check.AllNotEmpty(nilArray));
            CheckNotThrowsException(method,
                () => Check.AllNotEmpty(emptyArray));
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
