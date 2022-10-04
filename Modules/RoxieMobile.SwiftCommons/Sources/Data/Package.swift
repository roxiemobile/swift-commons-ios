// swift-tools-version: 5.6

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons.Data",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "SwiftCommonsData",
            type: .static,
            targets: [
                "SwiftCommonsData",
            ]
        ),
    ],
    dependencies: [
        .package(
            name: "SwiftCommons.Diagnostics",
            path: "../Diagnostics"
        ),
    ],
    targets: [
        .target(
            name: "SwiftCommonsData",
            dependencies: [
                .product(name: "SwiftCommonsDiagnostics", package: "SwiftCommons.Diagnostics"),
            ],
            path: "",
            exclude: [
                "README.md",
            ],
            sources: [
                "Dependencies/ObjectMapper",
                "Sources",
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
