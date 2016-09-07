// ----------------------------------------------------------------------------
//
//  LimitedQueue.swift
//
//  @author     Vasily Ivanov <IvanovVF@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       www.ekassir.com
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public struct LimitedQueue<Element>
{
// MARK: - Construction
    
    public init(size s: Int) {
        self.size = s
        self.array.reserveCapacity(s)
    }
    
    public init(size: Int, elements: [Element]) {
        self.init(size: size)
        
        let count = min(size, elements.count)
        let limitedElements = elements[0..<count]
        self.array.insertContentsOf(limitedElements, at: 0)
    }

// MARK: - Properties
    
    public var count: Int {
        return self.array.count
    }
    
// MARK: - Functions
    
    public mutating func push(element: Element)
    {
        if self.array.count == self.size {
            self.array.removeLast()
        }

        self.array.insert(element, atIndex: 0)
    }
    
    public mutating func pushWithPop(element: Element) -> Element?
    {
        var last: Element?

        if self.array.count == self.size {
            last = self.array.popLast()
        }

        self.array.insert(element, atIndex: 0)

        return last
    }
    
    public func filter(@noescape closure: (Element) -> Bool) -> [Element] {
        return self.array.filter(closure)
    }
    
    // Unsafe intentionally, behavior is
    // same with Array behavior
    public subscript(index: Int) -> Element {
        get {
            return self.array[index]
        }
        set(element) {
            self.array[index] = element
        }
    }
    
// MARK: - Private properties
    
    private let size: Int
    
    private var array: [Element] = []
}

// ----------------------------------------------------------------------------

extension Array
{
// MARK: - Construction

    public init(_ limitedQueue: LimitedQueue<Element>) {
        self.init(limitedQueue.array)
    }

}

// ----------------------------------------------------------------------------
