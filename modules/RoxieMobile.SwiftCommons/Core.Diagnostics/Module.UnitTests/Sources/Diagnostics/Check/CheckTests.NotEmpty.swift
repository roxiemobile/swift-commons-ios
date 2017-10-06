// ----------------------------------------------------------------------------
//
//  CheckTests.NotEmpty.swift
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
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
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
        [InlineData("Check.NotEmpty")]
        public void NotEmpty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";


            CheckThrowsException(method,
                () => Check.NotEmpty(nilString));
            CheckThrowsException(method,
                () => Check.NotEmpty(emptyString));

            CheckNotThrowsException(method,
                () => Check.NotEmpty(value));

            // --

            string[] array = ToArray("value", "otherValue");
            string[] nilArray = null;
            string[] emptyArray = {};

            CheckThrowsException($"{method}_Array",
                () => Check.NotEmpty(nilArray));
            CheckThrowsException($"{method}_Array",
                () => Check.NotEmpty(emptyArray));

            CheckNotThrowsException($"{method}_Array",
                () => Check.NotEmpty(array));

            // --

            List<string> list = ToArray("value", "otherValue").ToList();
            List<string> nilList = null;
            List<string> emptyList = new List<string>();

            CheckThrowsException($"{method}_List",
                () => Check.NotEmpty(nilList));
            CheckThrowsException($"{method}_List",
                () => Check.NotEmpty(emptyList));

            CheckNotThrowsException($"{method}_List",
                () => Check.NotEmpty(list));

            // --

            Dictionary<string, string> map = list.ToDictionary(item => item, item => item);
            Dictionary<string, string> nilMap = null;
            Dictionary<string, string> emptyMap = new Dictionary<string, string>();

            CheckThrowsException($"{method}_Dictionary",
                () => Check.NotEmpty(nilMap));
            CheckThrowsException($"{method}_Dictionary",
                () => Check.NotEmpty(emptyMap));

            CheckNotThrowsException($"{method}_Dictionary",
                () => Check.NotEmpty(map));
        }
    }
}
*/

extension CheckTests
{
// MARK: - Tests

    func testNotEmpty()
    {
//        let string = "value"
//        let nilString: String? = nil
//        let emptyString = ""
//
//
//        checkThrowsError("notEmpty") {
//            try Check.notEmpty(nilString)
//        }
//        checkThrowsError("notEmpty") {
//            try Check.notEmpty(emptyString)
//        }
//
//        checkNotThrowsError("notEmpty") {
//            try Check.notEmpty(string)
//        }
//
//        // --
//
//        let array = ["value", "otherValue"]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//        checkThrowsError("notEmpty_Array") {
//            try Check.notEmpty(nilArray)
//        }
//        checkThrowsError("notEmpty_Array") {
//            try Check.notEmpty(emptyArray)
//        }
//
//        checkNotThrowsError("notEmpty_Array") {
//            try Check.notEmpty(array)
//        }
//
//        // --
//
//        let map = ["key": "value", "otherKey": "otherValue"]
//        let nilMap: Dictionary<String, String>? = nil
//        let emptyMap = Dictionary<String, String>()
//
//        checkThrowsError("notEmpty_Map") {
//            try Check.notEmpty(nilMap)
//        }
//        checkThrowsError("notEmpty_Map") {
//            try Check.notEmpty(emptyMap)
//        }
//
//        checkNotThrowsError("notEmpty_Map") {
//            try Check.notEmpty(map)
//        }
    }
}

// ----------------------------------------------------------------------------
