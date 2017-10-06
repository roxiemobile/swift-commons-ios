// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotValid.swift
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
        [InlineData("Check.AllNotValid")]
        public void AllNotValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();

            IValidatable[] array = ToArray(notValidObject);
            IValidatable[] nilArray = null;
            IValidatable[] emptyArray = {};


            CheckThrowsException(method,
                () => Check.AllNotValid(ToArray(validObject)));
            CheckThrowsException(method,
                () => Check.AllNotValid(ToArray(nilObject)));
            CheckThrowsException(method,
                () => Check.AllNotValid(ToArray(notValidObject, validObject)));

            CheckNotThrowsException(method,
                () => Check.AllNotValid(array));
            CheckNotThrowsException(method,
                () => Check.AllNotValid(nilArray));
            CheckNotThrowsException(method,
                () => Check.AllNotValid(emptyArray));
        }
    }
}
*/

extension CheckTests
{
// MARK: - Tests

    func testAllNotValid_Array()
    {
//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable] = [notValidObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        checkThrowsError("allNotValid_Array") {
//            try Check.allNotValid([validObject])
//        }
//        checkThrowsError("allNotValid_Array") {
//            try Check.allNotValid([notValidObject, validObject])
//        }
//
//        checkNotThrowsError("allNotValid_Array") {
//            try Check.allNotValid(array)
//        }
//        checkNotThrowsError("allNotValid_Array") {
//            try Check.allNotValid(nilArray)
//        }
//        checkNotThrowsError("allNotValid_Array") {
//            try Check.allNotValid(emptyArray)
//        }
    }

    func testAllNotValid_ArrayOfOptionals()
    {
//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [notValidObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//        checkThrowsError("allNotValid_ArrayOfOptionals") {
//            try Check.allNotValid([validObject])
//        }
//        checkThrowsError("allNotValid_ArrayOfOptionals") {
//            try Check.allNotValid([nilObject])
//        }
//        checkThrowsError("allNotValid_ArrayOfOptionals") {
//            try Check.allNotValid([notValidObject, validObject])
//        }
//
//        checkNotThrowsError("allNotValid_ArrayOfOptionals") {
//            try Check.allNotValid(array)
//        }
//        checkNotThrowsError("allNotValid_ArrayOfOptionals") {
//            try Check.allNotValid(nilArray)
//        }
//        checkNotThrowsError("allNotValid_ArrayOfOptionals") {
//            try Check.allNotValid(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
