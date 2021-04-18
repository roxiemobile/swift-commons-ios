// ----------------------------------------------------------------------------
//
//  Vector3DTransform.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

final class Vector3DTransform: TransformType {

// MARK: - Construction

    static let shared = Vector3DTransform()

    private init() {
        // Do nothing
    }

// MARK: - Methods

    func transformFromJSON(_ value: Any?) -> Object? {
        if let value = value as? [String: Any] {
            return try? Vector3DModel(from: value)
        }
        return nil
    }

    func transformToJSON(_ value: Object?) -> JSON? {
        if let object = value {
            return Inner.sharedMapper.toJSON(object)
        }
        return nil
    }

// MARK: - Inner Types

    private struct Inner {
        static let sharedMapper = Mapper<Object>()
    }

    typealias Object = Vector3DModel
    typealias JSON = [String: Any]
}
