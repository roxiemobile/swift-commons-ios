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
//        guardThrowsException("isAllNilOrValid_Array") {
//            Guard.allNilOrValid([notValidObject])
//        }
//        guardThrowsException("isAllNilOrValid_Array") {
//            Guard.allNilOrValid([validObject, notValidObject])
//        }
//
//        guardNotThrowsException("isAllNilOrValid_Array") {
//            Guard.allNilOrValid(array)
//        }
//        guardNotThrowsException("isAllNilOrValid_Array") {
//            Guard.allNilOrValid(nilArray)
//        }
//        guardNotThrowsException("isAllNilOrValid_Array") {
//            Guard.allNilOrValid(emptyArray)
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
//        guardThrowsException("isAllNilOrValid_ArrayOfOptionals") {
//            Guard.allNilOrValid([notValidObject])
//        }
//        guardThrowsException("isAllNilOrValid_ArrayOfOptionals") {
//            Guard.allNilOrValid([validObject, notValidObject])
//        }
//        guardThrowsException("isAllNilOrValid_ArrayOfOptionals") {
//            Guard.allNilOrValid([nilObject, notValidObject])
//        }
//
//        guardNotThrowsException("isAllNilOrValid_ArrayOfOptionals") {
//            Guard.allNilOrValid(array)
//        }
//        guardNotThrowsException("isAllNilOrValid_ArrayOfOptionals") {
//            Guard.allNilOrValid(nilArray)
//        }
//        guardNotThrowsException("isAllNilOrValid_ArrayOfOptionals") {
//            Guard.allNilOrValid(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
