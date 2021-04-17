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
        .package(
            name: "SwiftCommons.Abstractions",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Abstractions"
        ),
        .package(
            name: "SwiftCommons.ObjC",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/ObjC"
        ),
    ],
    targets: [
        .target(
            name: "SwiftCommons",
            dependencies: [
                .product(name: "SwiftCommonsAbstractions", package: "SwiftCommons.Abstractions"),
                .product(name: "SwiftCommonsObjC", package: "SwiftCommons.ObjC"),
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
