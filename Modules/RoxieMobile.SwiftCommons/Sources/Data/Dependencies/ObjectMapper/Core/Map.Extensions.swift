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
// MARK: - Methods

    /// Checks if a current value is exists. Raises ObjC exception otherwise.
    internal func roxie_checkState(
            _ value: Any?,
            file: StaticString = #file,
            line: UInt = #line
    ) -> Void {

        let transform: NoopTransform? = nil
        roxie_checkState(value, with: transform, file: file, line: line)
    }

    /// Checks if a current value is exists. Raises ObjC exception otherwise.
    internal func roxie_checkState<TTransform: TransformType>(
            _ value: Any?,
            with transform: TTransform?,
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

        let transform: NoopTransform? = nil
        roxie_checkValue(value, with: transform, optional: optional, file: file, line: line)
    }

    /// Checks if a value is transformed successfully. Raises ObjC exception otherwise.
    internal func roxie_checkValue<TTransform: TransformType>(
            _ value: Any?,
            with transform: TTransform?,
            optional: Bool = false,
            file: StaticString = #file,
            line: UInt = #line
    ) -> Void {

        switch self.mappingType {
            case .fromJSON:
                roxie_checkValue(self.currentKey, self.currentValue, value, optional: optional, file: file, line: line)

            case .toJSON:
                if let key = self.currentKey {
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
}

// ----------------------------------------------------------------------------
