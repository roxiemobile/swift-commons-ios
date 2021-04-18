// ----------------------------------------------------------------------------
//
//  CodingFailurePolicy.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

/// Describes the action an coder should take when it encounters encode/decode
/// failures (e.g. corrupt data). Darwin platform supports exceptions here,
/// so its included for completeness.
public enum CodingFailurePolicy: Int {
    case raiseException
    case setErrorAndReturn
}
