// swift-tools-version: 5.6

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons.Logging",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "SwiftCommonsLogging",
            type: .static,
            targets: [
                "SwiftCommonsLogging",
            ]
        ),
    ],
    dependencies: [
        .package(name: "SwiftCommons.Concurrent", path: "../Concurrent"),
        .package(name: "SwiftCommons.Lang", path: "../Lang"),
    ],
    targets: [
        .target(
            name: "SwiftCommonsLogging",
            dependencies: [
                .product(name: "SwiftCommonsConcurrent", package: "SwiftCommons.Concurrent"),
                .product(name: "SwiftCommonsLang", package: "SwiftCommons.Lang"),
            ],
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
