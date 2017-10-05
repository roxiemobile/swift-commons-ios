// ----------------------------------------------------------------------------
//
//  CheckTests.NotValid.swift
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
        [InlineData("Check.NotValid")]
        public void NotValid(string method)
        {
            IValidatable validObject = new ValidModel();
            IValidatable notValidObject = new NotValidModel();


            CheckThrowsException(method,
                () => Check.NotValid(validObject));

            CheckNotThrowsException(method,
                () => Check.NotValid(notValidObject));
        }

        [Theory]
        [InlineData("Check.NotValid", "test_parking_model_with_one_non_valid_vehicle_in_array")]
        public void NotValidModel(string method, string fileName)
        {
            var json = LoadJsonString(fileName);
            Assert.NotNull($"Could not parse JSON from file ‘Fixtures/{fileName}.json’");

            ParkingModel parking = null;

            CheckThrowsException($"{method}_Model", typeof(JsonSerializationException),
                () => parking = JsonCoder.FromSnakeCaseJson<ParkingModel>(json));

            Assert.Null(parking);
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
