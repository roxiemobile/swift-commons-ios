// ----------------------------------------------------------------------------
//
//  CheckTests.Empty.swift
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
        [InlineData("Check.Empty")]
        public void Empty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";


            CheckThrowsException(method,
                () => Check.Empty(value));

            CheckNotThrowsException(method,
                () => Check.Empty(nilString));
            CheckNotThrowsException(method,
                () => Check.Empty(emptyString));

            // --

            string[] array = ToArray("value", "otherValue");
            string[] nilArray = null;
            string[] emptyArray = {};

            CheckThrowsException($"{method}_Array",
                () => Check.Empty(array));

            CheckNotThrowsException($"{method}_Array",
                () => Check.Empty(nilArray));
            CheckNotThrowsException($"{method}_Array",
                () => Check.Empty(emptyArray));

            // --

            List<string> list = ToArray("value", "otherValue").ToList();
            List<string> nilList = null;
            List<string> emptyList = new List<string>();

            CheckThrowsException($"{method}_List",
                () => Check.Empty(list));

            CheckNotThrowsException($"{method}_List",
                () => Check.Empty(nilList));
            CheckNotThrowsException($"{method}_List",
                () => Check.Empty(emptyList));

            // --

            Dictionary<string, string> map = list.ToDictionary(item => item, item => item);
            Dictionary<string, string> nilMap = null;
            Dictionary<string, string> emptyMap = new Dictionary<string, string>();

            CheckThrowsException($"{method}_Dictionary",
                () => Check.Empty(map));

            CheckNotThrowsException($"{method}_Dictionary",
                () => Check.Empty(nilMap));
            CheckNotThrowsException($"{method}_Dictionary",
                () => Check.Empty(emptyMap));
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
