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
        let root = split(name: String(reflecting: type))
        var node = root

        let isOptional = self.isOptional(root)
        let isImplicitlyUnwrappedOptional = self.isImplicitlyUnwrappedOptional(root)

        if (isOptional || isImplicitlyUnwrappedOptional) {
            if let child = root.child {
                node = child
            }
        }

        return ReflectedType(
            name: simpleName(node),
            fullName: canonicalName(node),
            isOptional: isOptional,
            isImplicitlyUnwrappedOptional: isImplicitlyUnwrappedOptional,
            isProtocol: isProtocol(node)
        )
    }

// MARK: - Private Methods

    private func split(name: String, maxDepth: Int = Int.max) -> MetatypeNode
    {
        // TODO
        return MetatypeNode(value: name, child: nil)
    }

    private func isOptional(_ node: MetatypeNode) -> Bool
    {
        // TODO
        return false
    }

    private func isImplicitlyUnwrappedOptional(_ node: MetatypeNode) -> Bool
    {
        // TODO
        return false
    }

    private func isProtocol(_ node: MetatypeNode) -> Bool
    {
        // TODO
        return false
    }

    private func simpleName(_ node: MetatypeNode) -> String
    {
        // TODO
        return node.value
    }

    private func canonicalName(_ node: MetatypeNode) -> String
    {
        var joined = ""
        Swift.sequence(first: node, next: { $0.child }).reversed().forEach {

            if (joined.isEmpty) {
                joined = $0.value
            }
            else if let range = joined.range(of: "<T>") {
                joined = joined.replacingCharacters(in: range, with: "<\(simpleName($0))>")
            }
            else {
                roxie_fatalError(message: "Invalid state. Value ‘\(joined)’ does not contains placeholder ‘<T>’.")
            }
        }
        return joined
    }
}

// ----------------------------------------------------------------------------

