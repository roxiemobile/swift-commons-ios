// swift-tools-version:5.3

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "SwiftCommons",
            type: .static,
            targets: [
                "SwiftCommons",
            ]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftCommons",
            dependencies: [
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
