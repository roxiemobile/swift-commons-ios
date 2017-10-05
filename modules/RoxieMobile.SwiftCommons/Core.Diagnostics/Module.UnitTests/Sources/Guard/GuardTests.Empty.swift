// ----------------------------------------------------------------------------
//
//  GuardTests.Empty.swift
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
    public partial class GuardTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Guard.Empty")]
        public void Empty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";


            GuardThrowsError(method,
                () => Guard.Empty(value));

            GuardNotThrowsError(method,
                () => Guard.Empty(nilString));
            GuardNotThrowsError(method,
                () => Guard.Empty(emptyString));

            // --

            string[] array = ToArray("value", "otherValue");
            string[] nilArray = null;
            string[] emptyArray = {};

            GuardThrowsError($"{method}_Array",
                () => Guard.Empty(array));

            GuardNotThrowsError($"{method}_Array",
                () => Guard.Empty(nilArray));
            GuardNotThrowsError($"{method}_Array",
                () => Guard.Empty(emptyArray));

            // --

            List<string> list = ToArray("value", "otherValue").ToList();
            List<string> nilList = null;
            List<string> emptyList = new List<string>();

            GuardThrowsError($"{method}_List",
                () => Guard.Empty(list));

            GuardNotThrowsError($"{method}_List",
                () => Guard.Empty(nilList));
            GuardNotThrowsError($"{method}_List",
                () => Guard.Empty(emptyList));

            // --

            Dictionary<string, string> map = list.ToDictionary(item => item, item => item);
            Dictionary<string, string> nilMap = null;
            Dictionary<string, string> emptyMap = new Dictionary<string, string>();

            GuardThrowsError($"{method}_Dictionary",
                () => Guard.Empty(map));

            GuardNotThrowsError($"{method}_Dictionary",
                () => Guard.Empty(nilMap));
            GuardNotThrowsError($"{method}_Dictionary",
                () => Guard.Empty(emptyMap));
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
