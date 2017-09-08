// ----------------------------------------------------------------------------
//
//  StringUtils.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public final class StringUtils: NonCreatable
{
// MARK: - Methods

    /// Checks if a String is empty ("") or {@code nil}.
    ///
    /// <pre>
    /// StringUtils.isEmpty(nil)       = true
    /// StringUtils.isEmpty("")        = true
    /// StringUtils.isEmpty(" ")       = false
    /// StringUtils.isEmpty("bob")     = false
    /// StringUtils.isEmpty("  bob  ") = false
    /// </pre>
    ///
    /// @param value The String to check, may be nil
    /// @return {@code true} if the String is empty or nil
    ///
    public static func isEmpty(_ value: String?) -> Bool {
        return (value == nil) || value!.isEmpty
    }

    /// Checks if all of the Strings are empty ("") or {@code nil}.
    ///
    /// <pre>
    /// StringUtils.isAllEmpty(nil)              = true
    /// StringUtils.isAllEmpty(nil, "")          = true
    /// StringUtils.isAllEmpty(new String[] {})  = true
    /// StringUtils.isAllEmpty(nil, "foo")       = false
    /// StringUtils.isAllEmpty("", "bar")        = false
    /// StringUtils.isAllEmpty("bob", "")        = false
    /// StringUtils.isAllEmpty("  bob  ", nil)   = false
    /// StringUtils.isAllEmpty(" ", "bar")       = false
    /// StringUtils.isAllEmpty("foo", "bar")     = false
    /// </pre>
    ///
    /// @param values The Strings to check, may be nil or empty
    /// @return {@code true} if all of the Strings are empty or nil
    ///
    public static func isAllEmpty(_ values: [String]?) -> Bool {
        return CollectionUtils.isEmpty(values) || values!.all { isEmpty($0) }
    }

    public static func isAllEmpty(_ values: [String?]?) -> Bool {
        return CollectionUtils.isEmpty(values) || values!.all { isEmpty($0) }
    }

    /// Checks if a String is not empty ("") and not {@code nil}.
    ///
    /// <pre>
    /// StringUtils.isNotEmpty(nil)       = false
    /// StringUtils.isNotEmpty("")        = false
    /// StringUtils.isNotEmpty(" ")       = true
    /// StringUtils.isNotEmpty("bob")     = true
    /// StringUtils.isNotEmpty("  bob  ") = true
    /// </pre>
    ///
    /// @param value The String to check, may be nil
    /// @return {@code true} if the String is not empty and not nil
    ///
    public static func isNotEmpty(_ value: String?) -> Bool {
        return !isEmpty(value)
    }

    /// Checks if none of the Strings are not empty ("") and not {@code nil}.
    ///
    /// <pre>
    /// StringUtils.isAllNotEmpty(nil)              = false
    /// StringUtils.isAllNotEmpty(nil, "foo")       = false
    /// StringUtils.isAllNotEmpty("", "bar")        = false
    /// StringUtils.isAllNotEmpty("bob", "")        = false
    /// StringUtils.isAllNotEmpty("  bob  ", nil)   = false
    /// StringUtils.isAllNotEmpty(new String[] {})  = false
    /// StringUtils.isAllNotEmpty(" ", "bar")       = true
    /// StringUtils.isAllNotEmpty("foo", "bar")     = true
    /// </pre>
    ///
    /// @param values The Strings to check, may be nil or empty
    /// @return {@code true} if none of the Strings are empty or nil
    ///
    public static func isAllNotEmpty(_ values: [String]?) -> Bool {
        return CollectionUtils.isNotEmpty(values) && values!.all { isNotEmpty($0) }
    }

    public static func isAllNotEmpty(_ values: [String?]?) -> Bool {
        return CollectionUtils.isNotEmpty(values) && values!.all { isNotEmpty($0) }
    }

// MARK: -

    /// Checks if a String is empty (""), {@code nil} or whitespace only.
    ///
    /// <pre>
    /// StringUtils.isBlank(nil)       = true
    /// StringUtils.isBlank("")        = true
    /// StringUtils.isBlank(" ")       = true
    /// StringUtils.isBlank("bob")     = false
    /// StringUtils.isBlank("  bob  ") = false
    /// </pre>
    ///
    /// @param value The String to check, may be nil
    /// @return {@code true} if the String is nil, empty or whitespace only
    ///
    public static func isBlank(_ value: String?) -> Bool {
        return (value == nil) || strip(value!).isEmpty
    }

    /// Checks if all of the Strings are empty (""), {@code nil} or whitespace only.
    ///
    /// <pre>
    /// StringUtils.isAllBlank(nil)              = true
    /// StringUtils.isAllBlank(nil, "foo")       = false
    /// StringUtils.isAllBlank(nil, nil)         = true
    /// StringUtils.isAllBlank("", "bar")        = false
    /// StringUtils.isAllBlank("bob", "")        = false
    /// StringUtils.isAllBlank("  bob  ", nil)   = false
    /// StringUtils.isAllBlank(" ", "bar")       = false
    /// StringUtils.isAllBlank("foo", "bar")     = false
    /// StringUtils.isAllBlank(new String[] {})  = true
    /// </pre>
    ///
    /// @param values The Strings to check, may be nil or empty
    /// @return {@code true} if all of the Strings are empty or nil or whitespace only
    ///
    public static func isAllBlank(_ values: [String]?) -> Bool {
        return CollectionUtils.isEmpty(values) || values!.all { isBlank($0) }
    }

    public static func isAllBlank(_ values: [String?]?) -> Bool {
        return CollectionUtils.isEmpty(values) || values!.all { isBlank($0) }
    }

    /// Checks if a String is not empty (""), not {@code nil} and not whitespace only.
    ///
    /// <pre>
    /// StringUtils.isNotBlank(nil)       = false
    /// StringUtils.isNotBlank("")        = false
    /// StringUtils.isNotBlank(" ")       = false
    /// StringUtils.isNotBlank("bob")     = true
    /// StringUtils.isNotBlank("  bob  ") = true
    /// </pre>
    ///
    /// @param value The String to check, may be nil
    /// @return {@code true} if the String is not empty and not nil and not whitespace only
    ///
    public static func isNotBlank(_ value: String?) -> Bool {
        return !isBlank(value)
    }

    /// Checks if none of the Strings are empty (""), {@code nil} or whitespace only.
    ///
    /// <pre>
    /// StringUtils.isAllNotBlank(nil)              = false
    /// StringUtils.isAllNotBlank(nil, "foo")       = false
    /// StringUtils.isAllNotBlank(nil, nil)         = false
    /// StringUtils.isAllNotBlank("", "bar")        = false
    /// StringUtils.isAllNotBlank("bob", "")        = false
    /// StringUtils.isAllNotBlank("  bob  ", nil)   = false
    /// StringUtils.isAllNotBlank(" ", "bar")       = false
    /// StringUtils.isAllNotBlank(new String[] {})  = false
    /// StringUtils.isAllNotBlank("foo", "bar")     = true
    /// </pre>
    ///
    /// @param values The Strings to check, may be nil or empty
    /// @return {@code true} if none of the Strings are empty or nil or whitespace only
    ///
    public static func isAllNotBlank(_ values: [String]?) -> Bool {
        return CollectionUtils.isNotEmpty(values) && values!.all { isNotBlank($0) }
    }

    public static func isAllNotBlank(_ values: [String?]?) -> Bool {
        return CollectionUtils.isNotEmpty(values) && values!.all { isNotBlank($0) }
    }

// MARK: -

    /// Strips any of a set of characters from the start and end of a String.
    /// This is similar to {@link String#trim()} but allows the characters
    /// to be stripped to be controlled.
    ///
    /// A {@code nil} input String returns {@code nil}. An empty string ("") input
    /// returns the empty string.
    ///
    /// If the stripChars String is {@code nil}, whitespace is stripped.
    ///
    /// <pre>
    /// StringUtils.strip(nil, *)           = nil
    /// StringUtils.strip("", *)            = ""
    /// StringUtils.strip("   ", nil)       = ""
    /// StringUtils.strip("abc", nil)       = "abc"
    /// StringUtils.strip("  abc", nil)     = "abc"
    /// StringUtils.strip("abc  ", nil)     = "abc"
    /// StringUtils.strip(" abc ", nil)     = "abc"
    /// StringUtils.strip("  abcyx", "xyz") = "  abc"
    /// </pre>
    ///
    /// @param value      The String to remove characters from, may be nil
    /// @param stripChars The characters to remove, nil treated as whitespace
    /// @return the stripped String, {@code nil} if nil String input
    ///
    public static func strip(_ value: String?, stripChars set: CharacterSet? = nil) -> String? {
        return stripEnd(stripStart(value, stripChars: set), stripChars: set)
    }

    public static func strip(_ value: String, stripChars set: CharacterSet? = nil) -> String {
        return strip(Optional(value), stripChars: set)!
    }

    /// Strips any of a set of characters from the start of a String.
    ///
    /// A {@code nil} input String returns {@code nil}. An empty string ("") input
    /// returns the empty string.
    ///
    /// If the stripChars String is {@code nil}, whitespace is stripped.
    ///
    /// <pre>
    /// StringUtils.stripStart(nil, *)           = nil
    /// StringUtils.stripStart("", *)            = ""
    /// StringUtils.stripStart("abc", "")        = "abc"
    /// StringUtils.stripStart("abc", nil)       = "abc"
    /// StringUtils.stripStart("  abc", nil)     = "abc"
    /// StringUtils.stripStart("abc  ", nil)     = "abc  "
    /// StringUtils.stripStart(" abc ", nil)     = "abc "
    /// StringUtils.stripStart("yxabc  ", "xyz") = "abc  "
    /// </pre>
    ///
    /// @param value      The String to remove characters from, may be nil
    /// @param stripChars The characters to remove, nil treated as whitespace
    /// @return the stripped String, {@code nil} if nil String input
    ///
    public static func stripStart(_ value: String?, stripChars: CharacterSet? = nil) -> String? {
        if isEmpty(value) { return value }

        let set = stripChars ?? CharacterSet.whitespacesAndNewlines
        var result = ""

        if let value = value,
           let range = value.rangeOfCharacter(from: set.inverted)
        {
            result = String(value[range.lowerBound..<value.endIndex])
        }

        return result
    }

    public static func stripStart(_ value: String, stripChars set: CharacterSet? = nil) -> String {
        return stripStart(Optional(value), stripChars: set)!
    }

    /// Strips any of a set of characters from the end of a String.
    ///
    /// A {@code nil} input String returns {@code nil}. An empty string ("") input
    /// returns the empty string.
    ///
    /// If the stripChars String is {@code nil}, whitespace is stripped.
    ///
    /// <pre>
    /// StringUtils.stripEnd(nil, *)           = nil
    /// StringUtils.stripEnd("", *)            = ""
    /// StringUtils.stripEnd("abc", "")        = "abc"
    /// StringUtils.stripEnd("abc", nil)       = "abc"
    /// StringUtils.stripEnd("  abc", nil)     = "  abc"
    /// StringUtils.stripEnd("abc  ", nil)     = "abc"
    /// StringUtils.stripEnd(" abc ", nil)     = " abc"
    /// StringUtils.stripEnd("  abcyx", "xyz") = "  abc"
    /// StringUtils.stripEnd("120.00", ".0")   = "12"
    /// </pre>
    ///
    /// @param value      The String to remove characters from, may be nil
    /// @param stripChars The set of characters to remove, nil treated as whitespace
    /// @return the stripped String, {@code nil} if nil String input
    ///
    public static func stripEnd(_ value: String?, stripChars: CharacterSet? = nil) -> String? {
        if isEmpty(value) { return value }

        let set = stripChars ?? CharacterSet.whitespacesAndNewlines

        var result = ""

        if let value = value,
           let range = value.rangeOfCharacter(from: set.inverted, options: NSString.CompareOptions.backwards)
        {
            result = String(value[..<range.upperBound])
        }

        return result
    }

    public static func stripEnd(_ value: String, stripChars set: CharacterSet? = nil) -> String {
        return stripEnd(Optional(value), stripChars: set)!
    }

// MARK: -

    /// Returns the given string if it is nonempty; {@code nil} otherwise.
    public static func emptyToNil(_ value: String?) -> String? {
        return isEmpty(value) ? nil : value
    }

    /// Returns the given string if it is non {@code nil}; the empty string otherwise.
    public static func nilToEmpty(_ value: String?) -> String {
        return (value == nil) ? "" : value!
    }
}

// ----------------------------------------------------------------------------
