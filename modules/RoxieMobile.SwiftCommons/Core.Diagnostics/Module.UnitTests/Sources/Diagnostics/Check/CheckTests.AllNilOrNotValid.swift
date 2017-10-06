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

    func testAllNilOrNotValid_Array()
    {
//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable] = [notValidObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        checkThrowsError("allNilOrNotValid_Array") {
//            try Check.allNilOrNotValid([validObject])
//        }
//        checkThrowsError("allNilOrNotValid_Array") {
//            try Check.allNilOrNotValid([notValidObject, validObject])
//        }
//
//        checkNotThrowsError("allNilOrNotValid_Array") {
//            try Check.allNilOrNotValid(array)
//        }
//        checkNotThrowsError("allNilOrNotValid_Array") {
//            try Check.allNilOrNotValid(nilArray)
//        }
//        checkNotThrowsError("allNilOrNotValid_Array") {
//            try Check.allNilOrNotValid(emptyArray)
//        }
    }

    func testAllNilOrNotValid_ArrayOfOptionals()
    {
//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [notValidObject, nilObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//
//        checkThrowsError("allNilOrNotValid_ArrayOfOptionals") {
//            try Check.allNilOrNotValid([validObject])
//        }
//        checkThrowsError("allNilOrNotValid_ArrayOfOptionals") {
//            try Check.allNilOrNotValid([nilObject, validObject])
//        }
//        checkThrowsError("allNilOrNotValid_ArrayOfOptionals") {
//            try Check.allNilOrNotValid([notValidObject, validObject])
//        }
//
//        checkNotThrowsError("allNilOrNotValid_ArrayOfOptionals") {
//            try Check.allNilOrNotValid(array)
//        }
//        checkNotThrowsError("allNilOrNotValid_ArrayOfOptionals") {
//            try Check.allNilOrNotValid(nilArray)
//        }
//        checkNotThrowsError("allNilOrNotValid_ArrayOfOptionals") {
//            try Check.allNilOrNotValid(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
