// ----------------------------------------------------------------------------
//
//  MultiValueDictionary.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

public class MultiValueDictionary<Key: Hashable, Value>
{
// MARK: - Construction

    public init() { }

// MARK: - Properties

    // ...

// MARK: - Functions

    public func add(value: Value, key: Key)
    {
        var keyValues = self.values[key] ?? []
        keyValues.append(value)
        self.values[key] = keyValues
    }

    public func get(key: Key) -> [Value] {
        return self.values[key] ?? []
    }

    public func remove(key: Key) -> [Value] {
        return self.values.removeValueForKey(key) ?? []
    }

    // NOTE: Value must be reference-type
    public func remove(key: Key, value: Value) -> Value?
    {
        var result: Value?

        if let index = (self.values[key]?.indexOf{ ($0 as! AnyObject) !== (value as! AnyObject) }) {
            result = self.values[key]?.removeAtIndex(index)
        }

        return result
    }

// MARK: - Actions

    // ...

// MARK: - Private Functions

    // ...

// MARK: - Inner Types

    // ...

// MARK: - Constants

    // ...

// MARK: - Variables

    private var values: [Key: [Value]] = [:]

}

// ----------------------------------------------------------------------------
