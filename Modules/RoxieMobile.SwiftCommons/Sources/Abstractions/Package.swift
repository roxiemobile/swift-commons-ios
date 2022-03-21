// swift-tools-version:5.5

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons.Abstractions",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "SwiftCommonsAbstractions",
            type: .static,
            targets: [
                "SwiftCommonsAbstractions",
            ]
        ),
    ],
    targets: [
        .target(
            name: "SwiftCommonsAbstractions",
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
