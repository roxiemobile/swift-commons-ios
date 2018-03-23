//
//  FromJSON.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-09.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014-2016 Hearst
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

internal final class FromJSON {

    /// Mappable object
    class func object<N: BaseMappable>(_ field: N, map: Map) -> N? {
        if map.toObject {
            return Mapper<N>(context: map.context).map(JSONObject: map.currentValue, toObject: field)
        } else {
            return Mapper<N>(context: map.context).map(JSONObject: map.currentValue)
        }
    }

    /// Optional Mappable object
    class func optionalObject<N: BaseMappable>(_ field: N?, map: Map) -> N? {
        if let f = field, map.toObject && map.currentValue != nil {
            return Mapper<N>(context: map.context).map(JSONObject: map.currentValue, toObject: f)
        } else {
            return Mapper<N>(context: map.context).map(JSONObject: map.currentValue)
        }
    }

    /// Implicitly unwrapped optional Mappable object
    class func implicitlyUnwrappedOptionalObject<N: BaseMappable>(_ field: N!, map: Map) -> N? {
        if let f = field, map.toObject && map.currentValue != nil {
            return Mapper<N>(context: map.context).map(JSONObject: map.currentValue, toObject: f)
        } else {
            return Mapper<N>(context: map.context).map(JSONObject: map.currentValue)
        }
    }

    /// Mappable object array
    class func objectArray<N: BaseMappable>(_ field: Array<N>, map: Map) -> Array<N>? {
        return Mapper<N>(context: map.context).mapArray(JSONObject: map.currentValue)
    }

    /// Optional Mappable object array
    class func optionalObjectArray<N: BaseMappable>(_ field: Array<N>?, map: Map) -> Array<N>? {
        return Mapper<N>(context: map.context).mapArray(JSONObject: map.currentValue)
    }

    /// Implicitly unwrapped optional Mappable object array
    class func implicitlyUnwrappedOptionalObjectArray<N: BaseMappable>(_ field: Array<N>!, map: Map) -> Array<N>? {
        return Mapper<N>(context: map.context).mapArray(JSONObject: map.currentValue)
    }

    /// 2-dimentional object array
    class func twoDimensionalObjectArray<N: BaseMappable>(_ field: Array<Array<N>>, map: Map) -> Array<Array<N>>? {
        return Mapper<N>(context: map.context).mapArrayOfArrays(JSONObject: map.currentValue)
    }

    /// Optional 2-dimentional object array
    class func optionalTwoDimensionalObjectArray<N: BaseMappable>(_ field: Array<Array<N>>?, map: Map) -> Array<Array<N>>? {
        return Mapper<N>(context: map.context).mapArrayOfArrays(JSONObject: map.currentValue)
    }

    /// Implicitly unwrapped optional 2-dimentional object array
    class func implicitlyUnwrappedOptionalTwoDimensionalObjectArray<N: BaseMappable>(_ field: Array<Array<N>>!, map: Map) -> Array<Array<N>>? {
        return Mapper<N>(context: map.context).mapArrayOfArrays(JSONObject: map.currentValue)
    }

    /// Dictionary containing Mappable objects
    class func objectDictionary<N: BaseMappable>(_ field: Dictionary<String, N>, map: Map) -> Dictionary<String, N>? {
        if map.toObject {
            return Mapper<N>(context: map.context).mapDictionary(JSONObject: map.currentValue, toDictionary: field)
        } else {
            return Mapper<N>(context: map.context).mapDictionary(JSONObject: map.currentValue)
        }
    }

    /// Optional dictionary containing Mappable objects
    class func optionalObjectDictionary<N: BaseMappable>(_ field: Dictionary<String, N>?, map: Map) -> Dictionary<String, N>? {
        if let f = field, map.toObject && map.currentValue != nil {
            return Mapper<N>(context: map.context).mapDictionary(JSONObject: map.currentValue, toDictionary: f)
        } else {
            return Mapper<N>(context: map.context).mapDictionary(JSONObject: map.currentValue)
        }
    }

    /// Implicitly unwrapped Dictionary containing Mappable objects
    class func implicitlyUnwrappedOptionalObjectDictionary<N: BaseMappable>(_ field: Dictionary<String, N>!, map: Map) -> Dictionary<String, N>? {
        if let f = field, map.toObject && map.currentValue != nil {
            return Mapper<N>(context: map.context).mapDictionary(JSONObject: map.currentValue, toDictionary: f)
        } else {
            return Mapper<N>(context: map.context).mapDictionary(JSONObject: map.currentValue)
        }
    }

    /// Dictionary containing Array of Mappable objects
    class func objectDictionaryOfArrays<N: BaseMappable>(_ field: Dictionary<String, [N]>, map: Map) -> Dictionary<String, [N]>? {
        return Mapper<N>(context: map.context).mapDictionaryOfArrays(JSONObject: map.currentValue)
    }

    /// Optional Dictionary containing Array of Mappable objects
    class func optionalObjectDictionaryOfArrays<N: BaseMappable>(_ field: Dictionary<String, [N]>?, map: Map) -> Dictionary<String, [N]>? {
        return Mapper<N>(context: map.context).mapDictionaryOfArrays(JSONObject: map.currentValue)
    }

    /// Implicitly unwrapped Dictionary containing Array of Mappable objects
    class func implicitlyUnwrappedOptionalObjectDictionaryOfArrays<N: BaseMappable>(_ field: Dictionary<String, [N]>!, map: Map) -> Dictionary<String, [N]>? {
        return Mapper<N>(context: map.context).mapDictionaryOfArrays(JSONObject: map.currentValue)
    }

    /// mappable object Set
    class func objectSet<N: BaseMappable>(_ field: Set<N>, map: Map) -> Set<N>? {
        return Mapper<N>(context: map.context).mapSet(JSONObject: map.currentValue)
    }

    /// optional mappable object array
    class func optionalObjectSet<N: BaseMappable>(_ field: Set<N>?, map: Map) -> Set<N>? {
        return Mapper<N>(context: map.context).mapSet(JSONObject: map.currentValue)
    }

    /// Implicitly unwrapped optional mappable object array
    class func implicitlyUnwrappedOptionalObjectSet<N: BaseMappable>(_ field: Set<N>!, map: Map) -> Set<N>? {
        return Mapper<N>(context: map.context).mapSet(JSONObject: map.currentValue)
    }
}
