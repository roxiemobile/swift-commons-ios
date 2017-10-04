// ----------------------------------------------------------------------------
//
//  CommonKeys.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

@available(*, deprecated)
public final class CommonKeys: NonCreatable
{
// MARK: - Constants

    @available(*, deprecated)
    private struct Inner {
        static let URN = "urn:roxiemobile:shared"
    }

    @available(*, deprecated)
    public struct Prefix
    {
        public static let Action = Inner.URN + ":action."
        public static let Extra  = Inner.URN + ":extra."
        public static let Prefs  = Inner.URN + ":prefs."
        public static let State  = Inner.URN + ":state."
    }

    @available(*, deprecated)
    public struct Action {
        // Do nothing
    }

    @available(*, deprecated)
    public struct State {
        public static let Undefined = Prefix.State + "undefined";
    }
}

// ----------------------------------------------------------------------------
