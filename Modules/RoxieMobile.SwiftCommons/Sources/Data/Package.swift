// swift-tools-version: 5.6

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons.Data",
    platforms: [
        .iOS(.v12),
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
        .package(
            url: "https://github.com/krzyzanowskim/CryptoSwift",
            exact: "1.6.0"
        ),
    ],
    targets: [
        .target(
            name: "SwiftCommonsData",
            dependencies: [
                .product(name: "CryptoSwift", package: "CryptoSwift"),
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
