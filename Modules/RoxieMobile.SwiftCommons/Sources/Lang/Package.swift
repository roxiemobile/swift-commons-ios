// swift-tools-version:5.3

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons.Lang",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "SwiftCommonsLang",
            type: .static,
            targets: [
                "SwiftCommonsLang",
            ]
        ),
    ],
    targets: [
        .target(
            name: "SwiftCommonsLang",
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
