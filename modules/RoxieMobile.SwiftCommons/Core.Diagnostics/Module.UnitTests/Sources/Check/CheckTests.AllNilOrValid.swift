// ----------------------------------------------------------------------------
//
//  CheckTests.AllNilOrValid.swift
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
        [InlineData("Check.AllNullOrValid")]
        public void AllNullOrValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();

            IValidatable[] array = ToArray(validObject, nilObject);
            IValidatable[] nilArray = null;
            IValidatable[] emptyArray = {};


            CheckThrowsException(method,
                () => Check.AllNullOrValid(ToArray(notValidObject)));
            CheckThrowsException(method,
                () => Check.AllNullOrValid(ToArray(validObject, notValidObject)));
            CheckThrowsException(method,
                () => Check.AllNullOrValid(ToArray(nilObject, notValidObject)));

            CheckNotThrowsException(method,
                () => Check.AllNullOrValid(array));
            CheckNotThrowsException(method,
                () => Check.AllNullOrValid(nilArray));
            CheckNotThrowsException(method,
                () => Check.AllNullOrValid(emptyArray));
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
