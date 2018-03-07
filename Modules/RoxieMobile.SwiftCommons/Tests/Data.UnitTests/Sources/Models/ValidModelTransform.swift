// ----------------------------------------------------------------------------
//
//  ValidModelTransform.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

internal class ValidModelTransform: TransformType
{
    typealias Object = ValidTransformMappableObjectModel
    typealias JSON = String

    // MARK: - Construction
    init() {
        // Do nothing
    }

    // MARK: - Methods
    func transformFromJSON(_ value: Any?) -> ValidTransformMappableObjectModel? {
        guard let string = value as? [String : Any] else{
            return nil
        }
        return ValidTransformMappableObjectModel(JSON: string)
    }

    func transformToJSON(_ value: ValidTransformMappableObjectModel?) -> String? {
        guard let validModel = value else{
            return nil
        }
        
        let JSONString = Mapper().toJSONString(validModel, prettyPrint: true)
        return JSONString
    }
}

// ----------------------------------------------------------------------------
