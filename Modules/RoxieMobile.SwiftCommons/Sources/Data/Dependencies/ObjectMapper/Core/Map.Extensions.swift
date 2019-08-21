// ----------------------------------------------------------------------------
//
//  Map.Extensions.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Map
{
// MARK: - Methods: Subscript

    public subscript(key: String, default default: Any) -> Map {
        return replaceNilWithDefault(self[key], `default`)
    }

    public subscript(key: String, delimiter delimiter: String, default default: Any) -> Map {
        return replaceNilWithDefault(self[key, delimiter: delimiter], `default`)
    }

    public subscript(key: String, nested nested: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(self[key, nested: nested], `default`)
    }

    public subscript(key: String, nested nested: Bool, delimiter delimiter: String, default default: Any) -> Map {
        return replaceNilWithDefault(self[key, nested: nested, delimiter: delimiter], `default`)
    }

    public subscript(key: String, ignoreNil ignoreNil: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(self[key, ignoreNil: ignoreNil], `default`)
    }

    public subscript(key: String, delimiter delimiter: String, ignoreNil ignoreNil: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(self[key, delimiter: delimiter, ignoreNil: ignoreNil], `default`)
    }

    public subscript(key: String, nested nested: Bool, ignoreNil ignoreNil: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(self[key, nested: nested, ignoreNil: ignoreNil], `default`)
    }

    public subscript(key: String, nested nested: Bool?, delimiter delimiter: String, ignoreNil ignoreNil: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(self[key, nested: nested, delimiter: delimiter, ignoreNil: ignoreNil], `default`)
    }

// MARK: - Methods

    /// Checks if a current value is exists. Raises ObjC exception otherwise.
    /// Checks if a current value is exists. Raises ObjC exception otherwise.
    internal func roxie_checkInput(
            _ value: Any?,
            check action: @autoclosure () -> Bool = false,
            file: StaticString = #file,
            line: UInt = #line
    ) -> Void {

        switch self.mappingType {
            case .fromJSON:
                if (self.currentValue != nil) || action() {
                    return
                }
            case .toJSON:
                if (value != nil) || action() {
                    return
                }
        }

        var logMessage = "Value is not found."
        if let key = self.currentKey {
            if self.isKeyPresent {
                logMessage = "Value for key ‘\(key)’ is not set."
            }
            else {
                logMessage = "Key ‘\(key)’ is not found."
            }
        }
        roxie_objectMapper_raiseException(message: logMessage, file: file, line: line)
    }

    /// Checks if a value is transformed successfully. Raises ObjC exception otherwise.
    internal func roxie_checkValue(
            _ value: Any?,
            optional: Bool = false,
            check action: @autoclosure () -> Bool = false,
            file: StaticString = #file,
            line: UInt = #line
    ) -> Void {

        guard let key = self.currentKey else {
            roxie_objectMapper_raiseException(message: "Current key is not set.")
        }

        var lhsValue: Any?, rhsValue: Any?
        switch self.mappingType {

            case .fromJSON:
                lhsValue = self.currentValue
                rhsValue = value

            case .toJSON:
                lhsValue = value
                rhsValue = fetch(valueFor: key, ignoreNil: true).value
        }

        roxie_checkValue(key, lhsValue, rhsValue, optional: optional, check: action, file: file, line: line)
    }

    /// Checks if a value is transformed successfully. Raises ObjC exception otherwise.
    internal func roxie_checkValue(
            _ key: String?,
            _ value: Any?,
            _ transformedValue: Any?,
            optional: Bool = false,
            check action: @autoclosure () -> Bool = false,
            file: StaticString = #file,
            line: UInt = #line
    ) -> Void {

        if (value != nil) && (transformedValue != nil) {
            return
        }
        if (value == nil) && (transformedValue == nil) && optional {
            return
        }
        if (value == nil) && (transformedValue != nil) && action() {
            return
        }

        var logMessage = "Could not transform value."
        if let key = key {
            logMessage = "Could not transform value for key ‘\(key)’."
        }
        roxie_objectMapper_raiseException(message: logMessage, file: file, line: line)
    }

// MARK: - Private Methods

    private func replaceNilWithDefault(_ map: Map, _ defaultValue: Any) -> Map {
        switch map.mappingType {
            // Change internal state of a Map
            case .fromJSON where (map.currentValue == nil):
                map.currentValue = defaultValue
                map.isKeyPresent = true
            default: ()
        }
        return map
    }
}

// ----------------------------------------------------------------------------
