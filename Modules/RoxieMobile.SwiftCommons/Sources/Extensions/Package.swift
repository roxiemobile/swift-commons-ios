// swift-tools-version:5.5

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons.Extensions",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "SwiftCommonsExtensions",
            type: .static,
            targets: [
                "SwiftCommonsExtensions",
            ]
        ),
    ],
    dependencies: [
        .package(name: "SwiftCommons.Abstractions", path: "../Abstractions"),
        .package(name: "SwiftCommons.Logging", path: "../Logging"),
    ],
    targets: [
        .target(
            name: "SwiftCommonsExtensions",
            dependencies: [
                .product(name: "SwiftCommonsAbstractions", package: "SwiftCommons.Abstractions"),
                .product(name: "SwiftCommonsLogging", package: "SwiftCommons.Logging"),
            ],
            path: "",
            exclude: [
                "README.md",
            ],
            sources: [
                "Dependencies/TimeIntervals",
                "Sources",
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
