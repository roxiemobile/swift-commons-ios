// ----------------------------------------------------------------------------
//
//  GuardTests.AllNilOrNotValid.swift
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
        [InlineData("Guard.AllNullOrNotValid")]
        public void AllNullOrNotValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();

            IValidatable[] array = ToArray(nilObject, notValidObject);
            IValidatable[] nilArray = null;
            IValidatable[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllNullOrNotValid(ToArray(validObject)));
            GuardThrowsError(method,
                () => Guard.AllNullOrNotValid(ToArray(nilObject, validObject)));
            GuardThrowsError(method,
                () => Guard.AllNullOrNotValid(ToArray(notValidObject, validObject)));

            GuardNotThrowsError(method,
                () => Guard.AllNullOrNotValid(array));
            GuardNotThrowsError(method,
                () => Guard.AllNullOrNotValid(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllNullOrNotValid(emptyArray));
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
