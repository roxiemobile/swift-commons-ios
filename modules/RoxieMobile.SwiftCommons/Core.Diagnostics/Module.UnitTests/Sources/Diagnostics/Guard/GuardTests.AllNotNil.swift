// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotNil.swift
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
        [InlineData("Guard.AllNotNull")]
        public void AllNotNull(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";

            string[] array = ToArray(value, emptyString);
            string[] nilArray = null;
            string[] emptyArray = {};


            GuardThrowsError($"{method}_Array",
                () => Guard.AllNotNull(ToArray(value, nilString)));
            GuardThrowsError($"{method}_Array",
                () => Guard.AllNotNull(ToArray(emptyString, nilString)));

            GuardNotThrowsError($"{method}_Array",
                () => Guard.AllNotNull(array));
            GuardNotThrowsError($"{method}_Array",
                () => Guard.AllNotNull(nilArray));
            GuardNotThrowsError($"{method}_Array",
                () => Guard.AllNotNull(emptyArray));

            // --

            List<string> list = ToArray(value, emptyString).ToList();
            List<string> nilList = null;
            List<string> emptyList = new List<string>();

            GuardThrowsError($"{method}_List",
                () => Guard.AllNotNull(ToArray(value, nilString).ToList()));
            GuardThrowsError($"{method}_List",
                () => Guard.AllNotNull(ToArray(emptyString, nilString).ToList()));

            GuardNotThrowsError($"{method}_List",
                () => Guard.AllNotNull(list));
            GuardNotThrowsError($"{method}_List",
                () => Guard.Empty(nilList));
            GuardNotThrowsError($"{method}_List",
                () => Guard.Empty(emptyList));
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
