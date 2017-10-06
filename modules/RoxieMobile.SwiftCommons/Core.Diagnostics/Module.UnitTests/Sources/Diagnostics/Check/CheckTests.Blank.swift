// ----------------------------------------------------------------------------
//
//  CheckTests.Blank.swift
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
using Xunit;

namespace RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Diagnostics
{
    public partial class CheckTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Check.Blank")]
        public void Blank(string method)
        {
            const string value = "value";
            const string nilString = null;
            const string emptyString = "";
            const string whitespaceString = " \t\r\n";


            CheckThrowsException(method,
                () => Check.Blank(value));

            CheckNotThrowsException(method,
                () => Check.Blank(nilString));
            CheckNotThrowsException(method,
                () => Check.Blank(emptyString));
            CheckNotThrowsException(method,
                () => Check.Blank(whitespaceString));
        }
    }
}
*/

extension CheckTests
{
// MARK: - Tests

    func testBlank()
    {
//        let string = "value"
//        let nilString: String? = nil
//        let emptyString = ""
//        let whitespaceString = " \t\r\n"
//
//
//        checkThrowsError("blank") {
//            try Check.blank(string)
//        }
//        checkNotThrowsError("blank") {
//            try Check.blank(nilString)
//        }
//        checkNotThrowsError("blank") {
//            try Check.blank(emptyString)
//        }
//        checkNotThrowsError("blank") {
//            try Check.blank(whitespaceString)
//        }
    }
}

// ----------------------------------------------------------------------------
