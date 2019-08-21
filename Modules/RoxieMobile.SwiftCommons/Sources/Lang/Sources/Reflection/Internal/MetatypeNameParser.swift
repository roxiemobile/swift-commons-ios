// ----------------------------------------------------------------------------
//
//  MetatypeNameParser.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

class MetatypeNameParser
{
// MARK: - Methods

    func reflect(_ type: Any.Type) -> ReflectedType
    {
        let root = split(fullName: String(reflecting: type), maxDepth: 1)
        var node = root

        let isOptional = self.isOptional(root)
        let isImplicitlyUnwrappedOptional = self.isImplicitlyUnwrappedOptional(root)

        if (isOptional || isImplicitlyUnwrappedOptional) {
            if let child = root.child {
                node = child
            }
        }

        let (simpleName, canonicalName) = normalizeName(node)
        return ReflectedType(
            name: simpleName,
            fullName: canonicalName,
            isOptional: isOptional,
            isImplicitlyUnwrappedOptional: isImplicitlyUnwrappedOptional,
            isProtocol: isProtocol(node)
        )
    }

// MARK: - Private Methods

    private func split(fullName: String, maxDepth: UInt = UInt.max) -> MetatypeNode
    {
        var wrappedName = Substring(fullName)
        var names = [String]()

        // Split names of Types
        for _ in 0..<maxDepth {
            if let from = wrappedName.index(of: "<"), let upto = wrappedName.index(of: ">") {

                // Extract name of wrapped type
                names.append("\(wrappedName[...from])T\(wrappedName[upto...])")
                wrappedName = wrappedName[wrappedName.index(after: from)..<upto]
            }
            else {
                break;
            }
        }

        // Build linked list of MetatypeNodes
        var node = MetatypeNode(value: String(wrappedName), child: nil)
        for name in names.reversed() {
            node = MetatypeNode(value: name, child: node)
        }

        // Done
        return node
    }

    private func isOptional(_ node: MetatypeNode) -> Bool {
        return Inner.Prefixes.Optionals.contains { node.value.hasPrefix($0) }
    }

    private func isImplicitlyUnwrappedOptional(_ node: MetatypeNode) -> Bool {
        return Inner.Prefixes.ImplicitlyUnwrappedOptionals.contains { node.value.hasPrefix($0) }
    }

    private func isProtocol(_ node: MetatypeNode) -> Bool {
        return Inner.Suffixes.Protocols.contains { node.value.hasSuffix($0) }
    }

    private func normalizeName(_ node: MetatypeNode) -> (simpleName: String, canonicalName: String)
    {
        // Build canonical name of Type
        var canonicalName = ""
        Swift.sequence(first: node, next: { $0.child }).reversed().forEach {
            let value = normalize(name: $0.value)

            if (canonicalName.isEmpty) {
                canonicalName = value
            }
            else if let range = value.range(of: "<T>") {
                canonicalName = value.replacingCharacters(in: range, with: "<\(canonicalName)>")
            }
            else {
                Roxie.fatalError("Invalid state. Value ‘\(value)’ does not contains placeholder ‘<T>’.")
            }
        }

        // Extract simple name of Type
        var startIndex = canonicalName.startIndex
        var char: Character = "?" // dummy

        for index in canonicalName.indices {
            char = canonicalName[index]

            if char == "." {
                startIndex = canonicalName.index(after: index)
            }
            else if char == "<" {
                break
            }
        }

        // Done
        return (String(canonicalName[startIndex...]), canonicalName)
    }

    private func normalize(name: String) -> String
    {
// FIXME: Delete!
//        var components = "\(type)".split(separator: ".", omittingEmptySubsequences: false)
//        if (components.first?.starts(with: "__lldb_expr_") ?? false) {
//            components = Array(components[0...])
//        }

        // TODO
        return name
    }

// MARK: - Constants

    private struct Inner
    {
        struct Prefixes
        {
            static let ImplicitlyUnwrappedOptionals = ["Swift.ImplicitlyUnwrappedOptionals<", "ImplicitlyUnwrappedOptionals<"]
            static let Optionals = ["Swift.Optional<", "Optional<"]
        }

        struct Suffixes
        {
            static let Protocols = [".Protocol"]
        }
    }
}

// ----------------------------------------------------------------------------
