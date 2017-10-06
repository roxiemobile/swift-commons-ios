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
//        guardThrowsException("isAllNilOrNotValid_Array") {
//            Guard.allNilOrNotValid([validObject])
//        }
//        guardThrowsException("isAllNilOrNotValid_Array") {
//            Guard.allNilOrNotValid([notValidObject, validObject])
//        }
//
//        guardNotThrowsException("isAllNilOrNotValid_Array") {
//            Guard.allNilOrNotValid(array)
//        }
//        guardNotThrowsException("isAllNilOrNotValid_Array") {
//            Guard.allNilOrNotValid(nilArray)
//        }
//        guardNotThrowsException("isAllNilOrNotValid_Array") {
//            Guard.allNilOrNotValid(emptyArray)
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
//        guardThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
//            Guard.allNilOrNotValid([validObject])
//        }
//        guardThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
//            Guard.allNilOrNotValid([nilObject, validObject])
//        }
//        guardThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
//            Guard.allNilOrNotValid([notValidObject, validObject])
//        }
//
//        guardNotThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
//            Guard.allNilOrNotValid(array)
//        }
//        guardNotThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
//            Guard.allNilOrNotValid(nilArray)
//        }
//        guardNotThrowsException("isAllNilOrNotValid_ArrayOfOptionals") {
//            Guard.allNilOrNotValid(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
