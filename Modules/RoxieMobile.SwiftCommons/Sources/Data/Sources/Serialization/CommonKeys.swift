// ----------------------------------------------------------------------------
//
//  CommonKeys.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

public final class CommonKeys: NonCreatable
{
// MARK: - Constants

    private struct Inner {
        static let URN = "urn:roxiemobile:shared"
    }

    public struct Prefix
    {
        public static let Action = Inner.URN + ":action."
        public static let Extra  = Inner.URN + ":extra."
        public static let Option = Inner.URN + ":option."
        public static let Prefs  = Inner.URN + ":prefs."
        public static let State  = Inner.URN + ":state."
    }

    public struct Action {
        // Do nothing
    }

    public struct Option {
        public static let Invalid = Prefix.Option + "INVALID";
    }

    public struct State {
        public static let Undefined = Prefix.State + "UNDEFINED";
    }
}

// ----------------------------------------------------------------------------
