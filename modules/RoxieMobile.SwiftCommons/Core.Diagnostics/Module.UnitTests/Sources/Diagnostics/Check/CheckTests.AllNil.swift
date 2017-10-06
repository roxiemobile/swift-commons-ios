// ----------------------------------------------------------------------------
//
//  CheckTests.AllNil.swift
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
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
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
        [InlineData("Check.AllNull")]
        public void AllNull(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";

            string[] nilArray = null;
            string[] emptyArray = {};


            CheckThrowsException($"{method}_Array",
                () => Check.AllNull(ToArray(nilString, value)));
            CheckThrowsException($"{method}_Array",
                () => Check.AllNull(ToArray(nilString, emptyString)));

            CheckNotThrowsException($"{method}_Array",
                () => Check.AllNull(ToArray(nilString, nilString)));
            CheckNotThrowsException($"{method}_Array",
                () => Check.AllNull(nilArray));
            CheckNotThrowsException($"{method}_Array",
                () => Check.AllNull(emptyArray));

            // --

            List<string> nilList = null;
            List<string> emptyList = new List<string>();

            CheckThrowsException($"{method}_List",
                () => Check.AllNotNull(ToArray(value, nilString).ToList()));
            CheckThrowsException($"{method}_List",
                () => Check.AllNotNull(ToArray(emptyString, nilString).ToList()));

            CheckNotThrowsException($"{method}_List",
                () => Check.AllNull(ToArray(nilString, nilString).ToList()));
            CheckNotThrowsException($"{method}_List",
                () => Check.Empty(nilList));
            CheckNotThrowsException($"{method}_List",
                () => Check.Empty(emptyList));
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
