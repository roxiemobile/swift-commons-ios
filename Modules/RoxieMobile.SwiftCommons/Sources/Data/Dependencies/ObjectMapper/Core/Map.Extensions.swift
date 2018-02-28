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
        return replaceNilWithDefault(map: self[key], `default`)
    }

    public subscript(key: String, delimiter delimiter: String, default default: Any) -> Map {
        return replaceNilWithDefault(map: self[key, delimiter: delimiter], `default`)
    }

    public subscript(key: String, nested nested: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(map: self[key, nested: nested], `default`)
    }

    public subscript(key: String, nested nested: Bool, delimiter delimiter: String, default default: Any) -> Map {
        return replaceNilWithDefault(map: self[key, nested: nested, delimiter: delimiter], `default`)
    }

    public subscript(key: String, ignoreNil ignoreNil: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(map: self[key, ignoreNil: ignoreNil], `default`)
    }

    public subscript(key: String, delimiter delimiter: String, ignoreNil ignoreNil: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(map: self[key, delimiter: delimiter, ignoreNil: ignoreNil], `default`)
    }

    public subscript(key: String, nested nested: Bool, ignoreNil ignoreNil: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(map: self[key, nested: nested, ignoreNil: ignoreNil], `default`)
    }

    public subscript(key: String, nested nested: Bool?, delimiter delimiter: String, ignoreNil ignoreNil: Bool, default default: Any) -> Map {
        return replaceNilWithDefault(map: self[key, nested: nested, delimiter: delimiter, ignoreNil: ignoreNil], `default`)
    }

// MARK: - Methods

    /// Checks if a current value is exists. Raises ObjC exception otherwise.
    internal func roxie_checkState(
            _ value: Any?,
            file: StaticString = #file,
            line: UInt = #line
    ) -> Void {

        switch self.mappingType {
            case .fromJSON:
                if let _ = self.currentValue {
                    return
                }
            case .toJSON:
                if let _ = value {
                    return
                }
        }

        var logMessage = "Value not found."
        if let key = self.currentKey {
            logMessage = "Value for key ‘\(key)’ not found."
        }
        roxie_objectMapper_raiseException(message: logMessage, file: file, line: line)
    }

    /// Checks if a value is transformed successfully. Raises ObjC exception otherwise.
    internal func roxie_checkValue(
            _ value: Any?,
            optional: Bool = false,
            file: StaticString = #file,
            line: UInt = #line
    ) -> Void {

        switch self.mappingType {
            case .fromJSON:
                roxie_checkValue(self.currentKey, self.currentValue, value, optional: optional, file: file, line: line)

            case .toJSON:
                if let key = self.currentKey {
                    // FIXME: self.JSON[key] -> valueFor(ArraySlice(self.currentKey.components(separatedBy: delimiter)), dictionary: self.JSON)
                    roxie_checkValue(self.currentKey, value, self.JSON[key], optional: optional, file: file, line: line)
                }
                else {
                    roxie_objectMapper_raiseException(message: "Current key is not set.")
                }
        }
    }

    /// Checks if a value is transformed successfully. Raises ObjC exception otherwise.
    internal func roxie_checkValue(
            _ key: String?,
            _ value: Any?,
            _ transformedValue: Any?,
            optional: Bool = false,
            file: StaticString = #file,
            line: UInt = #line
    ) -> Void {

        if let _ = value, let _ = transformedValue {
            return
        }
        else if optional && (value == nil) && (transformedValue == nil) {
            return
        }

        var logMessage = "Could not transform value."
        if let key = key {
            logMessage = "Could not transform value for key ‘\(key)’."
        }
        roxie_objectMapper_raiseException(message: logMessage, file: file, line: line)
    }

// MARK: - Private Methods

    private func replaceNilWithDefault(map: Map, _ defaultValue: Any) -> Map {
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
