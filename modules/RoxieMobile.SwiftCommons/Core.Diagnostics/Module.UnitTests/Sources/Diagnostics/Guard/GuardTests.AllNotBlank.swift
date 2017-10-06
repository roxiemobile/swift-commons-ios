// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotBlank.swift
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
        [InlineData("Guard.AllNotBlank")]
        public void AllNotBlank(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";
            const string whitespaceString = " \t\r\n";

            const string otherString = "otherValue";
            string[] array = ToArray(value, otherString);
            string[] nilArray = null;
            string[] emptyArray = {};


            GuardThrowsError(method,
                () => Guard.AllNotBlank(ToArray(nilString)));
            GuardThrowsError(method,
                () => Guard.AllNotBlank(ToArray(emptyString)));
            GuardThrowsError(method,
                () => Guard.AllNotBlank(ToArray(whitespaceString)));
            GuardThrowsError(method,
                () => Guard.AllNotBlank(ToArray(value, whitespaceString)));

            GuardNotThrowsError(method,
                () => Guard.AllNotBlank(array));
            GuardNotThrowsError(method,
                () => Guard.AllNotBlank(nilArray));
            GuardNotThrowsError(method,
                () => Guard.AllNotBlank(emptyArray));
        }
    }
}
*/

extension GuardTests
{
// MARK: - Tests

    func testAllNotBlank_Array()
    {
//        let string = "value"
//        let emptyString = ""
//        let whitespaceString = " \t\r\n"
//
//        let otherString = "otherValue"
//        let array: [String]? = [string, otherString]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//
//        guardThrowsException("isAllNotBlank_Array") {
//            Guard.allNotBlank([emptyString])
//        }
//        guardThrowsException("isAllNotBlank_Array") {
//            Guard.allNotBlank([whitespaceString])
//        }
//        guardThrowsException("isAllNotBlank_Array") {
//            Guard.allNotBlank([string, whitespaceString])
//        }
//
//        guardNotThrowsException("isAllNotBlank_Array") {
//            Guard.allNotBlank(array)
//        }
//        guardNotThrowsException("isAllNotBlank_Array") {
//            Guard.allNotBlank(nilArray)
//        }
//        guardNotThrowsException("isAllNotBlank_Array") {
//            Guard.allNotBlank(emptyArray)
//        }
    }

    func testAllNotBlank_ArrayOfOptionals()
    {
//        let string: String? = "value"
//        let nilString: String? = nil
//        let emptyString: String? = ""
//        let whitespaceString: String? = " \t\r\n"
//
//        let otherString: String? = "otherValue"
//        let array: [String?]? = [string, otherString]
//        let nilArray: [String?]? = nil
//        let emptyArray = [String?]()
//
//
//        guardThrowsException("isAllNotBlank_ArrayOfOptionals") {
//            Guard.allNotBlank([nilString])
//        }
//        guardThrowsException("isAllNotBlank_ArrayOfOptionals") {
//            Guard.allNotBlank([emptyString])
//        }
//        guardThrowsException("isAllNotBlank_ArrayOfOptionals") {
//            Guard.allNotBlank([whitespaceString])
//        }
//        guardThrowsException("isAllNotBlank_ArrayOfOptionals") {
//            Guard.allNotBlank([string, whitespaceString])
//        }
//
//        guardNotThrowsException("isAllNotBlank_ArrayOfOptionals") {
//            Guard.allNotBlank(array)
//        }
//        guardNotThrowsException("isAllNotBlank_ArrayOfOptionals") {
//            Guard.allNotBlank(nilArray)
//        }
//        guardNotThrowsException("isAllNotBlank_ArrayOfOptionals") {
//            Guard.allNotBlank(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
