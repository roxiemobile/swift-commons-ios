// ----------------------------------------------------------------------------
//
//  MessagePackCoderTest.ArrayOfSerializableObject.swift
//
//  @author     Aleksandr Serov <serov-ae@roxiemobile.com>
//  @copyright  Copyright (c) 2020, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsLang
import XCTest

// ----------------------------------------------------------------------------

extension MessagePackCoderTest
{
// MARK: - Test
    
    func testDictionaryOf_SerializableObject_Bolean() {
        
        assertNoThrow {
            let object: [String: STCBoolModel] = [JsonKeys.value: STCBoolModel.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
    }
    
    func  testDictionaryOf_SerializableObject_SignedInteger() {
        
        assertNoThrow {
            let object: [String: STCSignedInteger8Model] = [JsonKeys.value: STCSignedInteger8Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCSignedInteger16Model] = [JsonKeys.value: STCSignedInteger16Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCSignedInteger32Model] = [JsonKeys.value: STCSignedInteger32Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCSignedInteger64Model] = [JsonKeys.value: STCSignedInteger64Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCSignedIntegerModel] = [JsonKeys.value: STCSignedIntegerModel.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
    }
 
    func  testDictionaryOf_SerializableObject_UnsignedInteger() {
        
        assertNoThrow {
            let object: [String: STCUnsignedInteger8Model] = [JsonKeys.value: STCUnsignedInteger8Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCUnsignedInteger16Model] = [JsonKeys.value: STCUnsignedInteger16Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCUnsignedInteger32Model] = [JsonKeys.value: STCUnsignedInteger32Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCUnsignedInteger64Model] = [JsonKeys.value: STCUnsignedInteger64Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCUnsignedIntegerModel] = [JsonKeys.value: STCUnsignedIntegerModel.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
    }
    
    func testDictionaryOf_SerializableObject_Float() {
        
        assertNoThrow {
            let object: [String: STCFloat32Model] = [JsonKeys.value: STCFloat32Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCFloat64Model] = [JsonKeys.value: STCFloat64Model.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
        assertNoThrow {
            let object: [String: STCFloatModel] = [JsonKeys.value: STCFloatModel.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
    }
    
    func testDictionaryOf_SerializableObject_Double() {
        
        assertNoThrow {
            let object: [String: STCDoubleModel] = [JsonKeys.value: STCDoubleModel.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
    }
    
    func testDictionaryOf_SerializableObject_String() {
        
        assertNoThrow {
            let object: [String: STCStringModel] = [JsonKeys.value: STCStringModel.shared]
            XCTAssertEqual(object, self.cloneDictionaryOfSerializableObject(object))
        }
    }  
}

// ----------------------------------------------------------------------------
