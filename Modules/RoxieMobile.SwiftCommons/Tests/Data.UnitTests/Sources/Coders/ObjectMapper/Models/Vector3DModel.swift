// ----------------------------------------------------------------------------
//
//  Vector3DModel.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class Vector3DModel: ValidatableModel {

// MARK: - Construction

    static let shared16 = try! Vector3DModel(from: Constants.dictionaryOfInt16)

    static let shared32 = try! Vector3DModel(from: Constants.dictionaryOfInt32)

    static let shared = Vector3DModel.shared16

// MARK: - Properties

    private(set) var dx = 0
    private(set) var dy: Int? = 0
    private(set) var dz: Int! = 0

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.dx <~ (map[JsonKeys.dx], StringToIntegerTransform.shared)
        self.dy <~ (map[JsonKeys.dy], StringToIntegerTransform.shared)
        self.dz <~ (map[JsonKeys.dz], StringToIntegerTransform.shared)
    }
}
