// swift-tools-version: 5.6

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons.Concurrent",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "SwiftCommonsConcurrent",
            type: .static,
            targets: [
                "SwiftCommonsConcurrent",
            ]
        ),
    ],
    dependencies: [
        .package(name: "SwiftCommons.ObjC", path: "../ObjC"),
    ],
    targets: [
        .target(
            name: "SwiftCommonsConcurrent",
            dependencies: [
                .product(name: "SwiftCommonsObjC", package: "SwiftCommons.ObjC"),
            ],
            path: "",
            exclude: [
                "README.md",
            ],
            sources: [
                "Dependencies/SCAAtomic",
                "Dependencies/Synchronized",
                "Dependencies/TryCatchFinally",
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
