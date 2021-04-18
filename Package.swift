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
            name: "SwiftCommons.Concurrent",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Concurrent"
        ),
        .package(
            name: "SwiftCommons.Data",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Data"
        ),
        .package(
            name: "SwiftCommons.Diagnostics",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Diagnostics"
        ),
        .package(
            name: "SwiftCommons.Extensions",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Extensions"
        ),
        .package(
            name: "SwiftCommons.Lang",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Lang"
        ),
        .package(
            name: "SwiftCommons.Logging",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Logging"
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
                .product(name: "SwiftCommonsConcurrent", package: "SwiftCommons.Concurrent"),
                .product(name: "SwiftCommonsData", package: "SwiftCommons.Data"),
                .product(name: "SwiftCommonsDiagnostics", package: "SwiftCommons.Diagnostics"),
                .product(name: "SwiftCommonsExtensions", package: "SwiftCommons.Extensions"),
                .product(name: "SwiftCommonsLang", package: "SwiftCommons.Lang"),
                .product(name: "SwiftCommonsLogging", package: "SwiftCommons.Logging"),
                .product(name: "SwiftCommonsObjC", package: "SwiftCommons.ObjC"),
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
