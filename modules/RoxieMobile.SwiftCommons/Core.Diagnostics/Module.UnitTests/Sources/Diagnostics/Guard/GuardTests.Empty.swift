// ----------------------------------------------------------------------------
//
//  GuardTests.Empty.swift
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
    public partial class GuardTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Guard.Empty")]
        public void Empty(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";


            GuardThrowsError(method,
                () => Guard.Empty(value));

            GuardNotThrowsError(method,
                () => Guard.Empty(nilString));
            GuardNotThrowsError(method,
                () => Guard.Empty(emptyString));

            // --

            string[] array = ToArray("value", "otherValue");
            string[] nilArray = null;
            string[] emptyArray = {};

            GuardThrowsError($"{method}_Array",
                () => Guard.Empty(array));

            GuardNotThrowsError($"{method}_Array",
                () => Guard.Empty(nilArray));
            GuardNotThrowsError($"{method}_Array",
                () => Guard.Empty(emptyArray));

            // --

            List<string> list = ToArray("value", "otherValue").ToList();
            List<string> nilList = null;
            List<string> emptyList = new List<string>();

            GuardThrowsError($"{method}_List",
                () => Guard.Empty(list));

            GuardNotThrowsError($"{method}_List",
                () => Guard.Empty(nilList));
            GuardNotThrowsError($"{method}_List",
                () => Guard.Empty(emptyList));

            // --

            Dictionary<string, string> map = list.ToDictionary(item => item, item => item);
            Dictionary<string, string> nilMap = null;
            Dictionary<string, string> emptyMap = new Dictionary<string, string>();

            GuardThrowsError($"{method}_Dictionary",
                () => Guard.Empty(map));

            GuardNotThrowsError($"{method}_Dictionary",
                () => Guard.Empty(nilMap));
            GuardNotThrowsError($"{method}_Dictionary",
                () => Guard.Empty(emptyMap));
        }
    }
}
*/

extension GuardTests
{
// MARK: - Tests

    func testEmpty()
    {
//        let string = "value"
//        let nilString: String? = nil
//        let emptyString = ""
//
//
//        guardThrowsException("isEmpty") {
//            Guard.empty(string)
//        }
//
//        guardNotThrowsException("isEmpty") {
//            Guard.empty(nilString)
//        }
//        guardNotThrowsException("isEmpty") {
//            Guard.empty(emptyString)
//        }
//
//        // --
//
//        let array = ["value", "otherValue"]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//        guardThrowsException("isEmpty_Array") {
//            Guard.empty(array)
//        }
//
//        guardNotThrowsException("isEmpty_Array") {
//            Guard.empty(nilArray)
//        }
//        guardNotThrowsException("isEmpty_Array") {
//            Guard.empty(emptyArray)
//        }
//
//        // --
//
//        let map = ["key": "value", "otherKey": "otherValue"]
//        let nilMap: Dictionary<String, String>? = nil
//        let emptyMap = Dictionary<String, String>()
//
//        guardThrowsException("isEmpty_Map") {
//            Guard.empty(map)
//        }
//
//        guardNotThrowsException("isEmpty_Map") {
//            Guard.empty(nilMap)
//        }
//        guardNotThrowsException("isEmpty_Map") {
//            Guard.empty(emptyMap)
//        }
    }
}

// ----------------------------------------------------------------------------
