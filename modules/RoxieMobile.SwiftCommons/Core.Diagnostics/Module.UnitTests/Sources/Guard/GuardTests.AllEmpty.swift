// ----------------------------------------------------------------------------
//
//  GuardTests.AllEmpty.swift
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
        [InlineData("Guard.AllEmpty")]
        public void AllEmpty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";

            string[] array = ToArray(nilString, emptyString);
            string[] nilArray = null;
            string[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllEmpty(ToArray(value)));
            GuardThrowsError(method,
                () => Guard.AllEmpty(ToArray(nilString, value)));
            GuardThrowsError(method,
                () => Guard.AllEmpty(ToArray(emptyString, value)));

            GuardNotThrowsError(method,
                () => Guard.AllEmpty(array));
            GuardNotThrowsError(method,
                () => Guard.AllEmpty(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllEmpty(emptyArray));
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
