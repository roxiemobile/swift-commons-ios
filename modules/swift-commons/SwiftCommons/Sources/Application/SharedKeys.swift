// ----------------------------------------------------------------------------
//
//  SharedKeys.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

public final class SharedKeys: NonCreatable
{
// MARK: - Constants

    private struct Inner {
        static let URN = "urn:roxiemobile:shared"
    }

    public struct Prefix {
        public static let Action = Inner.URN + ":action."
        public static let Extra  = Inner.URN + ":extra."
        public static let Prefs  = Inner.URN + ":prefs."
    }

}

// ----------------------------------------------------------------------------
