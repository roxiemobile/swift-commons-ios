// ----------------------------------------------------------------------------
//
//  CheckTests.Valid.swift
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
using Newtonsoft.Json;
using RoxieMobile.CSharpCommons.Abstractions.Models;
using RoxieMobile.CSharpCommons.Data.Serialization.Json;
using RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Models;
using Xunit;

namespace RoxieMobile.CSharpCommons.Diagnostics.UnitTests.Diagnostics
{
    public partial class CheckTests
    {
// MARK: - Tests

        [Theory]
        [InlineData("Check.Valid")]
        public void Valid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable notValidObject = new NotValidModel();


            CheckThrowsException(method,
                () => Check.Valid(notValidObject));

            CheckNotThrowsException(method,
                () => Check.Valid(validObject));
        }

        [Theory]
        [InlineData("Check.Valid", "test_parking_model_with_valid_vehicles_in_array")]
        public void ValidModel(string method, string fileName)
        {
            var json = LoadJsonString(fileName);
            Assert.NotNull($"Could not parse JSON from file ‘Fixtures/{fileName}.json’");

            ParkingModel parking = null;

            CheckNotThrowsException($"{method}_Model", typeof(JsonSerializationException),
                () => parking = JsonCoder.FromSnakeCaseJson<ParkingModel>(json));

            Assert.NotNull(parking);
            Assert.True(parking.IsValid());
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
