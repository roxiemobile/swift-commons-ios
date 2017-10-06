// ----------------------------------------------------------------------------
//
//  GuardTests.AllValid.swift
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
        [InlineData("Guard.AllValid")]
        public void AllValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable nilObject = null;
            IValidatable notValidObject = new NotValidModel();

            IValidatable[] array = ToArray(validObject);
            IValidatable[] nilArray = null;
            IValidatable[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllValid(ToArray(notValidObject)));
            GuardThrowsError(method,
                () => Guard.AllValid(ToArray(validObject, nilObject)));
            GuardThrowsError(method,
                () => Guard.AllValid(ToArray(validObject, notValidObject)));

            GuardNotThrowsError(method,
                () => Guard.AllValid(array));
            GuardNotThrowsError(method,
                () => Guard.AllValid(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllValid(emptyArray));
        }
    }
}
*/

extension GuardTests
{
// MARK: - Tests

    func testAllValid_Array()
    {
//        let validObject: Validatable = ValidModel()
//        let notValidObject: Validatable = NotValidModel()
//
//        let array: [Validatable]? = [validObject]
//        let nilArray: [Validatable]? = nil
//        let emptyArray = [Validatable]()
//
//
//        guardThrowsException("isAllValid_Array") {
//            Guard.allValid([notValidObject])
//        }
//        guardThrowsException("isAllValid_Array") {
//            Guard.allValid([validObject, notValidObject])
//        }
//
//        guardNotThrowsException("isAllValid_Array") {
//            Guard.allValid(array)
//        }
//        guardNotThrowsException("isAllValid_Array") {
//            Guard.allValid(nilArray)
//        }
//        guardNotThrowsException("isAllValid_Array") {
//            Guard.allValid(emptyArray)
//        }
    }

    func testAllValid_ArrayOfOptionals()
    {
//        let validObject: Validatable? = ValidModel()
//        let nilObject: Validatable? = nil
//        let notValidObject: Validatable? = NotValidModel()
//
//        let array: [Validatable?]? = [validObject]
//        let nilArray: [Validatable?]? = nil
//        let emptyArray = [Validatable?]()
//
//
//        guardThrowsException("isAllValid_ArrayOfOptionals") {
//            Guard.allValid([notValidObject])
//        }
//        guardThrowsException("isAllValid_ArrayOfOptionals") {
//            Guard.allValid([validObject, nilObject])
//        }
//        guardThrowsException("isAllValid_ArrayOfOptionals") {
//            Guard.allValid([validObject, notValidObject])
//        }
//
//        guardNotThrowsException("isAllValid_ArrayOfOptionals") {
//            Guard.allValid(array)
//        }
//        guardNotThrowsException("isAllValid_ArrayOfOptionals") {
//            Guard.allValid(nilArray)
//        }
//        guardNotThrowsException("isAllValid_ArrayOfOptionals") {
//            Guard.allValid(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
