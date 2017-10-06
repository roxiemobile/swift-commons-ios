// ----------------------------------------------------------------------------
//
//  GuardTests.AllBlank.swift
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
        [InlineData("Guard.AllBlank")]
        public void AllBlank(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";
            const string whitespaceString = " \t\r\n";

            string[] array = ToArray(nilString, emptyString, whitespaceString);
            string[] nilArray = null;
            string[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllBlank(ToArray(value)));
            GuardThrowsError(method,
                () => Guard.AllBlank(ToArray(nilString, value)));
            GuardThrowsError(method,
                () => Guard.AllBlank(ToArray(emptyString, value)));
            GuardThrowsError(method,
                () => Guard.AllBlank(ToArray(whitespaceString, value)));

            GuardNotThrowsError(method,
                () => Guard.AllBlank(array));
            GuardNotThrowsError(method,
                () => Guard.AllBlank(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllBlank(emptyArray));
        }
    }
}
*/

extension GuardTests
{
// MARK: - Tests

    func testAllBlank_Array()
    {
//        let string = "value"
//        let emptyString = ""
//        let whitespaceString = " \t\r\n"
//
//        let array: [String] = [emptyString, whitespaceString]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//
//        guardThrowsException("isAllBlank_Array") {
//            Guard.allBlank([string])
//        }
//        guardThrowsException("isAllBlank_Array") {
//            Guard.allBlank([emptyString, string])
//        }
//        guardThrowsException("isAllBlank_Array") {
//            Guard.allBlank([whitespaceString, string])
//        }
//
//        guardNotThrowsException("isAllBlank_Array") {
//            Guard.allBlank(array)
//        }
//        guardNotThrowsException("isAllBlank_Array") {
//            Guard.allBlank(nilArray)
//        }
//        guardNotThrowsException("isAllBlank_Array") {
//            Guard.allBlank(emptyArray)
//        }
    }

    func testAllBlank_ArrayOfOptionals()
    {
//        let string: String? = "value"
//        let nilString: String? = nil
//        let emptyString: String? = ""
//        let whitespaceString: String? = " \t\r\n"
//
//        let array: [String?]? = [nilString, emptyString, whitespaceString]
//        let nilArray: [String?]? = nil
//        let emptyArray = [String?]()
//
//
//        guardThrowsException("isAllBlank_ArrayOfOptionals") {
//            Guard.allBlank([string])
//        }
//        guardThrowsException("isAllBlank_ArrayOfOptionals") {
//            Guard.allBlank([nilString, string])
//        }
//        guardThrowsException("isAllBlank_ArrayOfOptionals") {
//            Guard.allBlank([emptyString, string])
//        }
//        guardThrowsException("isAllBlank_ArrayOfOptionals") {
//            Guard.allBlank([whitespaceString, string])
//        }
//
//        guardNotThrowsException("isAllBlank_ArrayOfOptionals") {
//            Guard.allBlank(array)
//        }
//        guardNotThrowsException("isAllBlank_ArrayOfOptionals") {
//            Guard.allBlank(nilArray)
//        }
//        guardNotThrowsException("isAllBlank_ArrayOfOptionals") {
//            Guard.allBlank(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
