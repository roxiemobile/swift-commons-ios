// ----------------------------------------------------------------------------
//
//  GuardTests.AllNilOrValid.swift
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
using RoxieMobile.CSharpCommons.Abstractions.Models;
using RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Models;
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
        [InlineData("Guard.AllNullOrValid")]
        public void AllNullOrValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();

            IValidatable[] array = ToArray(validObject, nilObject);
            IValidatable[] nilArray = null;
            IValidatable[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllNullOrValid(ToArray(notValidObject)));
            GuardThrowsError(method,
                () => Guard.AllNullOrValid(ToArray(validObject, notValidObject)));
            GuardThrowsError(method,
                () => Guard.AllNullOrValid(ToArray(nilObject, notValidObject)));

            GuardNotThrowsError(method,
                () => Guard.AllNullOrValid(ToArray(validObject, nilObject)));
            GuardNotThrowsError(method,
                () => Guard.AllNullOrValid(array));
            GuardNotThrowsError(method,
                () => Guard.AllNullOrValid(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllNullOrValid(emptyArray));
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
