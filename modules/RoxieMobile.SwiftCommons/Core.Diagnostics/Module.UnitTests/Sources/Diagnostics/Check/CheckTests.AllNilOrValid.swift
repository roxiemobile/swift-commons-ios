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

    func testAllNilOrValid_Array()
    {
//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable] = [validObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        checkThrowsError("allNilOrValid_Array") {
//            try Check.allNilOrValid([notValidObject])
//        }
//        checkThrowsError("allNilOrValid_Array") {
//            try Check.allNilOrValid([validObject, notValidObject])
//        }
//
//        checkNotThrowsError("allNilOrValid_Array") {
//            try Check.allNilOrValid(array)
//        }
//        checkNotThrowsError("allNilOrValid_Array") {
//            try Check.allNilOrValid(nilArray)
//        }
//        checkNotThrowsError("allNilOrValid_Array") {
//            try Check.allNilOrValid(emptyArray)
//        }
    }

    func testAllNilOrValid_ArrayOfOptionals()
    {
//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [validObject, nilObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//
//        checkThrowsError("allNilOrValid_ArrayOfOptionals") {
//            try Check.allNilOrValid([notValidObject])
//        }
//        checkThrowsError("allNilOrValid_ArrayOfOptionals") {
//            try Check.allNilOrValid([validObject, notValidObject])
//        }
//        checkThrowsError("allNilOrValid_ArrayOfOptionals") {
//            try Check.allNilOrValid([nilObject, notValidObject])
//        }
//
//        checkNotThrowsError("allNilOrValid_ArrayOfOptionals") {
//            try Check.allNilOrValid(array)
//        }
//        checkNotThrowsError("allNilOrValid_ArrayOfOptionals") {
//            try Check.allNilOrValid(nilArray)
//        }
//        checkNotThrowsError("allNilOrValid_ArrayOfOptionals") {
//            try Check.allNilOrValid(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
