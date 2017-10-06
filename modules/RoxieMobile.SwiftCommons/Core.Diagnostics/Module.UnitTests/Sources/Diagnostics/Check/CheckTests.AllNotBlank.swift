// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotBlank.swift
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
    public partial class CheckTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Check.AllNotBlank")]
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


            CheckThrowsException(method,
                () => Check.AllNotBlank(ToArray(nilString)));
            CheckThrowsException(method,
                () => Check.AllNotBlank(ToArray(emptyString)));
            CheckThrowsException(method,
                () => Check.AllNotBlank(ToArray(whitespaceString)));
            CheckThrowsException(method,
                () => Check.AllNotBlank(ToArray(value, whitespaceString)));

            CheckNotThrowsException(method,
                () => Check.AllNotBlank(array));
            CheckNotThrowsException(method,
                () => Check.AllNotBlank(nilArray));
            CheckNotThrowsException(method,
                () => Check.AllNotBlank(emptyArray));
        }
    }
}
*/

extension CheckTests
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
//        checkThrowsError("allNotBlank_Array") {
//            try Check.allNotBlank([emptyString])
//        }
//        checkThrowsError("allNotBlank_Array") {
//            try Check.allNotBlank([whitespaceString])
//        }
//        checkThrowsError("allNotBlank_Array") {
//            try Check.allNotBlank([string, whitespaceString])
//        }
//
//        checkNotThrowsError("allNotBlank_Array") {
//            try Check.allNotBlank(array)
//        }
//        checkNotThrowsError("allNotBlank_Array") {
//            try Check.allNotBlank(nilArray)
//        }
//        checkNotThrowsError("allNotBlank_Array") {
//            try Check.allNotBlank(emptyArray)
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
//        checkThrowsError("allNotBlank_ArrayOfOptionals") {
//            try Check.allNotBlank([nilString])
//        }
//        checkThrowsError("allNotBlank_ArrayOfOptionals") {
//            try Check.allNotBlank([emptyString])
//        }
//        checkThrowsError("allNotBlank_ArrayOfOptionals") {
//            try Check.allNotBlank([whitespaceString])
//        }
//        checkThrowsError("allNotBlank_ArrayOfOptionals") {
//            try Check.allNotBlank([string, whitespaceString])
//        }
//
//        checkNotThrowsError("allNotBlank_ArrayOfOptionals") {
//            try Check.allNotBlank(array)
//        }
//        checkNotThrowsError("allNotBlank_ArrayOfOptionals") {
//            try Check.allNotBlank(nilArray)
//        }
//        checkNotThrowsError("allNotBlank_ArrayOfOptionals") {
//            try Check.allNotBlank(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
