// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotValid.swift
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
        [InlineData("Guard.AllNotValid")]
        public void AllNotValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();

            IValidatable[] array = ToArray(notValidObject);
            IValidatable[] nilArray = null;
            IValidatable[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllNotValid(ToArray(validObject)));
            GuardThrowsError(method,
                () => Guard.AllNotValid(ToArray(nilObject)));
            GuardThrowsError(method,
                () => Guard.AllNotValid(ToArray(notValidObject, validObject)));

            GuardNotThrowsError(method,
                () => Guard.AllNotValid(array));
            GuardNotThrowsError(method,
                () => Guard.AllNotValid(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllNotValid(emptyArray));
        }
    }
}
*/

extension GuardTests
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
//        guardThrowsException("isAllNotValid_Array") {
//            Guard.allNotValid([validObject])
//        }
//        guardThrowsException("isAllNotValid_Array") {
//            Guard.allNotValid([notValidObject, validObject])
//        }
//
//        guardNotThrowsException("isAllNotValid_Array") {
//            Guard.allNotValid(array)
//        }
//        guardNotThrowsException("isAllNotValid_Array") {
//            Guard.allNotValid(nilArray)
//        }
//        guardNotThrowsException("isAllNotValid_Array") {
//            Guard.allNotValid(emptyArray)
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
//        guardThrowsException("isAllNotValid_ArrayOfOptionals") {
//            Guard.allNotValid([validObject])
//        }
//        guardThrowsException("isAllNotValid_ArrayOfOptionals") {
//            Guard.allNotValid([nilObject])
//        }
//        guardThrowsException("isAllNotValid_ArrayOfOptionals") {
//            Guard.allNotValid([notValidObject, validObject])
//        }
//
//        guardNotThrowsException("isAllNotValid_ArrayOfOptionals") {
//            Guard.allNotValid(array)
//        }
//        guardNotThrowsException("isAllNotValid_ArrayOfOptionals") {
//            Guard.allNotValid(nilArray)
//        }
//        guardNotThrowsException("isAllNotValid_ArrayOfOptionals") {
//            Guard.allNotValid(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
