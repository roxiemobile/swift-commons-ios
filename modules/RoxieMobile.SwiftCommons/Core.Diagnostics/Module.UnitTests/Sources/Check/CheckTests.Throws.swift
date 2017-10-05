// ----------------------------------------------------------------------------
//
//  CheckTests.Throws.swift
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
using System;
using System.IO;
using Xunit;

namespace RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Diagnostics
{
    public partial class CheckTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Check.Throws")]
        public void Throws(string method)
        {
            CheckThrowsException(method,
                () => Check.Throws<Exception>(() => {}));
            CheckThrowsException(method,
                () => Check.Throws<IOException>(() => throw new OperationCanceledException()));
            CheckThrowsException(method,
                () => Check.Throws<Exception>(() => throw new IOException()));

            CheckNotThrowsException(method,
                () => Check.Throws<IOException>(() => throw new IOException()));
        }
    }
}
*/

extension CheckTests
{
// MARK: - Tests

    // TODO
}

// ----------------------------------------------------------------------------
