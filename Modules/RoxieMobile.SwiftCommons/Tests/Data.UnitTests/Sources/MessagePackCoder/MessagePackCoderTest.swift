// ----------------------------------------------------------------------------
//
//  MessagePackCoderTest.swift
//
//  @author     Aleksandr Serov <serov-ae@roxiemobile.com> 
//  @copyright  Copyright (c) 2020, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsConcurrent
import XCTest

// ----------------------------------------------------------------------------

final class MessagePackCoderTest: XCTestCase
{
    // MARK: - Method
    
    func assertNoThrow(action: @escaping () -> Void) -> Void {
        var exception: NSException? = nil
        
        objcTry {
            action()
        }.objcCatch { e in
            exception = e
        }.objcFinally {
            XCTAssertNil(exception)
        }
    }
    
    func assertThrowsExpection(action: @escaping () -> Void) -> Void {
        var exception: NSException? = nil
        
        objcTry {
            action()
        }.objcCatch { e in
            exception = e
        }.objcFinally {
            XCTAssertNotNil(exception)
        }
    }
    
    func cloneSimpleObject<T: Equatable>(_ object: T) -> T? {
        let policy: CodingFailurePolicy = .raiseException
        
        //Encode
        let encoder = MessagePackEncoder(forWritingInto: nil, failurePolicy: policy, sortDictionaryKeys: false)
        encoder.encode(object)
        
        XCTAssert(encoder.error == nil)
        XCTAssert(encoder.encodedData.isNotEmpty)
        
        //Decode
        let decoder = MessagePackDecoder(forReadingFrom: encoder.encodedData, failurePolicy: policy)
        let decoderObject = decoder.decodeObject() as? T
        
        XCTAssert(decoder.error == nil)
        XCTAssert(decoderObject != nil)
        
        //Done
        return decoderObject
    }
    
    func cloneSerializableObject<T: ValidatableModel>(_ object: T) -> T? {
        let policy: CodingFailurePolicy = .raiseException
        
        //Encode
        let jsonObject = Mapper().toJSON(object)
        let encoder = MessagePackEncoder(forWritingInto: nil, failurePolicy: policy, sortDictionaryKeys: false)
        encoder.encode(jsonObject)
        
        XCTAssert(encoder.error == nil)
        XCTAssert(encoder.encodedData.isNotEmpty)
        
        //Decode
        var decodedJsonObject: T?
        let decoder = MessagePackDecoder(forReadingFrom: encoder.encodedData, failurePolicy: policy)
        if let decoderObject = decoder.decodeObject() as? JsonObject {
            decodedJsonObject = try? T(from: decoderObject)
        }
        
        XCTAssert(decoder.error == nil)
        XCTAssert(decodedJsonObject != nil)
        
        //Done
        return decodedJsonObject
    }
    
    func cloneArrayOfSerializableObject<T: ValidatableModel>(_ objects: [T]) -> [T]? {
        let policy: CodingFailurePolicy = .raiseException
        
        //Encode
        let jsonObjects = objects.compactMap {
            Mapper().toJSON($0)
        }
        
        let encoder = MessagePackEncoder(forWritingInto: nil, failurePolicy: policy, sortDictionaryKeys: false)
        encoder.encode(jsonObjects)
        
        XCTAssert(encoder.error == nil)
        XCTAssert(encoder.encodedData.isNotEmpty)
        
        //Decode
        var decodedJsonObjects: Array<T>? = []
        let decoder = MessagePackDecoder(forReadingFrom: encoder.encodedData, failurePolicy: policy)
        if let decoderObjects = decoder.decodeObject() as? [JsonObject] {
            decoderObjects.forEach { decoderObject in
                decodedJsonObjects?.append(try! T(from: decoderObject))
            }
        }
        
        XCTAssert(decoder.error == nil)
        XCTAssert(decodedJsonObjects != nil)
        
        //Done
        return decodedJsonObjects
    }
    
    func cloneDictionaryOfSerializableObject<T: ValidatableModel>(_ objects: [String: T]) -> [String: T]? {
        let policy: CodingFailurePolicy = .raiseException
        
        //Encode
        var jsonObjects = [String: JsonObject]()
        for (key, object) in objects {
            jsonObjects[key] = Mapper().toJSON(object)
        }
        
        let encoder = MessagePackEncoder(forWritingInto: nil, failurePolicy: policy, sortDictionaryKeys: false)
        encoder.encode(jsonObjects)
        
        XCTAssert(encoder.error == nil)
        XCTAssert(encoder.encodedData.isNotEmpty)
        
        //Decode
        var decodedJsonObject: [String: T]? = [:]
        let decoder = MessagePackDecoder(forReadingFrom: encoder.encodedData, failurePolicy: policy)
        if let decoderObject = decoder.decodeObject() as? [String: JsonObject] {
            for (key, object) in decoderObject {
                decodedJsonObject?[key] = try? T(from: object)
            }
        }
        
        XCTAssert(decoder.error == nil)
        XCTAssert(decodedJsonObject != nil)
        
        //Done
        return decodedJsonObject
    }
    
}

// ----------------------------------------------------------------------------
