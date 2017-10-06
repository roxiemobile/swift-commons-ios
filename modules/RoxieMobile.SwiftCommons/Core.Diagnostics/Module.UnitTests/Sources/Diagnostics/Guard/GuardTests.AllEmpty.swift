// ----------------------------------------------------------------------------
//
//  GuardTests.AllEmpty.swift
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
        [InlineData("Guard.AllEmpty")]
        public void AllEmpty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";

            string[] array = ToArray(nilString, emptyString);
            string[] nilArray = null;
            string[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllEmpty(ToArray(value)));
            GuardThrowsError(method,
                () => Guard.AllEmpty(ToArray(nilString, value)));
            GuardThrowsError(method,
                () => Guard.AllEmpty(ToArray(emptyString, value)));

            GuardNotThrowsError(method,
                () => Guard.AllEmpty(array));
            GuardNotThrowsError(method,
                () => Guard.AllEmpty(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllEmpty(emptyArray));
        }
    }
}
*/

extension GuardTests
{
// MARK: - Tests

    func testAllEmpty_Array()
    {
//        let string = "value"
//        let emptyString = ""
//
//        let array: [String]? = [emptyString]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//
//        guardThrowsException("isAllEmpty_Array") {
//            Guard.allEmpty([string])
//        }
//        guardThrowsException("isAllEmpty_Array") {
//            Guard.allEmpty([emptyString, string])
//        }
//
//        guardNotThrowsException("isAllEmpty_Array") {
//            Guard.allEmpty(array)
//        }
//        guardNotThrowsException("isAllEmpty_Array") {
//            Guard.allEmpty(nilArray)
//        }
//        guardNotThrowsException("isAllEmpty_Array") {
//            Guard.allEmpty(emptyArray)
//        }
    }

    func testAllEmpty_ArrayOfOptionals()
    {
//        let string: String? = "value"
//        let nilString: String? = nil
//        let emptyString: String? = ""
//
//        let array: [String?]? = [nilString, emptyString]
//        let nilArray: [String?]? = nil
//        let emptyArray = [String?]()
//
//
//        guardThrowsException("isAllEmpty_ArrayOfOptionals") {
//            Guard.allEmpty([string])
//        }
//        guardThrowsException("isAllEmpty_ArrayOfOptionals") {
//            Guard.allEmpty([nilString, string])
//        }
//        guardThrowsException("isAllEmpty_ArrayOfOptionals") {
//            Guard.allEmpty([emptyString, string])
//        }
//
//        guardNotThrowsException("isAllEmpty_ArrayOfOptionals") {
//            Guard.allEmpty(array)
//        }
//        guardNotThrowsException("isAllEmpty_ArrayOfOptionals") {
//            Guard.allEmpty(nilArray)
//        }
//        guardNotThrowsException("isAllEmpty_ArrayOfOptionals") {
//            Guard.allEmpty(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
