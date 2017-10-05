// ----------------------------------------------------------------------------
//
//  CheckTests.AllNilOrNotValid.swift
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
    public partial class CheckTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Check.AllNullOrNotValid")]
        public void AllNullOrNotValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();

            IValidatable[] array = ToArray(nilObject, notValidObject);
            IValidatable[] nilArray = null;
            IValidatable[] emptyArray = {};


            CheckThrowsException(method,
                () => Check.AllNullOrNotValid(ToArray(validObject)));
            CheckThrowsException(method,
                () => Check.AllNullOrNotValid(ToArray(nilObject, validObject)));
            CheckThrowsException(method,
                () => Check.AllNullOrNotValid(ToArray(notValidObject, validObject)));

            CheckNotThrowsException(method,
                () => Check.AllNullOrNotValid(array));
            CheckNotThrowsException(method,
                () => Check.AllNullOrNotValid(nilArray));
            CheckNotThrowsException(method,
                () => Check.AllNullOrNotValid(emptyArray));
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
