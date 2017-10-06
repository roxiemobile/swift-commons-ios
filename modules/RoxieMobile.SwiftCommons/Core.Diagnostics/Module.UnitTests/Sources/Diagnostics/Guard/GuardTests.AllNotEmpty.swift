// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotEmpty.swift
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
        [InlineData("Guard.AllNotEmpty")]
        public void AllNotEmpty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";

            const string otherString = "otherValue";
            string[] array = ToArray(value, otherString);
            string[] nilArray = null;
            string[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllNotEmpty(ToArray(value, nilString)));
            GuardThrowsError(method,
                () => Guard.AllNotEmpty(ToArray(value, emptyString)));

            GuardNotThrowsError(method,
                () => Guard.AllNotEmpty(array));
            GuardNotThrowsError(method,
                () => Guard.AllNotEmpty(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllNotEmpty(emptyArray));
        }
    }
}
*/

extension GuardTests
{
// MARK: - Tests

    func testAllNotEmpty_Array()
    {
//        let string = "value"
//        let emptyString = ""
//
//        let otherString = "otherValue"
//        let array: [String]? = [string, otherString]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//
//        guardThrowsException("isAllNotEmpty_Array") {
//            Guard.allNotEmpty([string, emptyString])
//        }
//
//        guardNotThrowsException("isAllNotEmpty_Array") {
//            Guard.allNotEmpty(array)
//        }
//        guardNotThrowsException("isAllNotEmpty_Array") {
//            Guard.allNotEmpty(nilArray)
//        }
//        guardNotThrowsException("isAllNotEmpty_Array") {
//            Guard.allNotEmpty(emptyArray)
//        }
    }

    func testAllNotEmpty_ArrayOfOptionals()
    {
//        let string: String? = "value"
//        let nilString: String? = nil
//        let emptyString: String? = ""
//
//        let otherString: String? = "otherValue"
//        let array: [String?]? = [string, otherString]
//        let nilArray: [String?]? = nil
//        let emptyArray = [String?]()
//
//
//        guardThrowsException("isAllNotEmpty_ArrayOfOptionals") {
//            Guard.allNotEmpty([string, nilString])
//        }
//        guardThrowsException("isAllNotEmpty_ArrayOfOptionals") {
//            Guard.allNotEmpty([string, emptyString])
//        }
//
//        guardNotThrowsException("isAllNotEmpty_ArrayOfOptionals") {
//            Guard.allNotEmpty(array)
//        }
//        guardNotThrowsException("isAllNotEmpty_ArrayOfOptionals") {
//            Guard.allNotEmpty(nilArray)
//        }
//        guardNotThrowsException("isAllNotEmpty_ArrayOfOptionals") {
//            Guard.allNotEmpty(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
