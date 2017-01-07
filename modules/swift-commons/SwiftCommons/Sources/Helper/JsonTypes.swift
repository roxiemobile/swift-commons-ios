// ----------------------------------------------------------------------------
//
//  JsonTypes.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

/// A type representing an element of Json.
public typealias JsonElement = AnyObject

/// A type representing an object type in Json.
public typealias JsonObject = [JsonString: JsonElement]

/// A type representing an array type in Json.
public typealias JsonArray = [JsonElement]

/// A type representing a String value.
public typealias JsonString = String

/// A type representing a Json null value.
public typealias JsonNull = NSNull

// ----------------------------------------------------------------------------
