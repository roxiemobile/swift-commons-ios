// ----------------------------------------------------------------------------
//
//  CheckTests.ThrowsAny.swift
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
        [InlineData("Check.ThrowsAny")]
        public void ThrowsAny(string method)
        {
            CheckThrowsException(method,
                () => Check.ThrowsAny<Exception>(() => {}));
            CheckThrowsException(method,
                () => Check.ThrowsAny<IOException>(() => throw new OperationCanceledException()));

            CheckNotThrowsException(method,
                () => Check.ThrowsAny<Exception>(() => throw new IOException()));
            CheckNotThrowsException(method,
                () => Check.ThrowsAny<IOException>(() => throw new IOException()));
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
