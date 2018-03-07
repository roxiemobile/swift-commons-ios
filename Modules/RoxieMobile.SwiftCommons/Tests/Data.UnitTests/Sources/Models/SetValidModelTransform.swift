// ----------------------------------------------------------------------------
//
//  SetValidModelTransform.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

internal class SetValidModelTransform: TransformType
{
    typealias Object = SetValidTransformMappableObjectModel
    typealias JSON = String

    // MARK: - Construction
    init() {
        // Do nothing
    }

    // MARK: - Methods
    func transformFromJSON(_ value: Any?) -> SetValidTransformMappableObjectModel? {
        guard let string = value as? [String: Any] else {
            return nil
        }
        return SetValidTransformMappableObjectModel(JSON: string)
    }

    func transformToJSON(_ value: SetValidTransformMappableObjectModel?) -> String? {
        guard let validModel = value else {
            return nil
        }

        let JSONString = Mapper().toJSONString(validModel, prettyPrint: true)
        return JSONString
    }
}

// ----------------------------------------------------------------------------

