// swift-tools-version:5.5

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons.Diagnostics",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "SwiftCommonsDiagnostics",
            type: .static,
            targets: [
                "SwiftCommonsDiagnostics",
            ]
        ),
    ],
    dependencies: [
        .package(name: "SwiftCommons.Concurrent", path: "../Concurrent"),
        .package(name: "SwiftCommons.Extensions", path: "../Extensions"),
    ],
    targets: [
        .target(
            name: "SwiftCommonsDiagnostics",
            dependencies: [
                .product(name: "SwiftCommonsConcurrent", package: "SwiftCommons.Concurrent"),
                .product(name: "SwiftCommonsExtensions", package: "SwiftCommons.Extensions"),
            ],
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
