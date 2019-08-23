// ----------------------------------------------------------------------------
//
//  STCCharacterModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class STCCharacterModel: ValidatableModel
{
// MARK: - Construction

    static let shared = try! STCCharacterModel(from: Constants.dictionaryForSTCCharacter)

// MARK: - Properties

    fileprivate(set) var character: Character = " "

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.character <~ map[JsonKeys.character]
    }
}

// ----------------------------------------------------------------------------
