// ----------------------------------------------------------------------------
//
//  CheckTests.AllEmpty.swift
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
    [SuppressMessage("ReSharper", "SuggestVarOrType_Elsewhere")]
    [SuppressMessage("ReSharper", "ExpressionIsAlwaysNull")]
    public partial class CheckTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Check.AllEmpty")]
        public void AllEmpty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";

            string[] array = ToArray(nilString, emptyString);
            string[] nilArray = null;
            string[] emptyArray = {};


            CheckThrowsException(method,
                () => Check.AllEmpty(ToArray(value)));
            CheckThrowsException(method,
                () => Check.AllEmpty(ToArray(nilString, value)));
            CheckThrowsException(method,
                () => Check.AllEmpty(ToArray(emptyString, value)));

            CheckNotThrowsException(method,
                () => Check.AllEmpty(array));
            CheckNotThrowsException(method,
                () => Check.AllEmpty(nilArray));
            CheckNotThrowsException(method,
                () => Check.AllEmpty(emptyArray));
        }
    }
}
*/

extension CheckTests
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
//        checkThrowsError("allEmpty_Array") {
//            try Check.allEmpty([string])
//        }
//        checkThrowsError("allEmpty_Array") {
//            try Check.allEmpty([emptyString, string])
//        }
//
//        checkNotThrowsError("allEmpty_Array") {
//            try Check.allEmpty(array)
//        }
//        checkNotThrowsError("allEmpty_Array") {
//            try Check.allEmpty(nilArray)
//        }
//        checkNotThrowsError("allEmpty_Array") {
//            try Check.allEmpty(emptyArray)
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
//        checkThrowsError("allEmpty_ArrayOfOptionals") {
//            try Check.allEmpty([string])
//        }
//        checkThrowsError("allEmpty_ArrayOfOptionals") {
//            try Check.allEmpty([nilString, string])
//        }
//        checkThrowsError("allEmpty_ArrayOfOptionals") {
//            try Check.allEmpty([emptyString, string])
//        }
//
//        checkNotThrowsError("allEmpty_ArrayOfOptionals") {
//            try Check.allEmpty(array)
//        }
//        checkNotThrowsError("allEmpty_ArrayOfOptionals") {
//            try Check.allEmpty(nilArray)
//        }
//        checkNotThrowsError("allEmpty_ArrayOfOptionals") {
//            try Check.allEmpty(emptyArray)
//        }
    }
}

// ----------------------------------------------------------------------------
