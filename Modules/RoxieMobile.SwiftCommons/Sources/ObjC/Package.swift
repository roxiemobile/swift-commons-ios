// swift-tools-version:5.5

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "SwiftCommons.ObjC",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "SwiftCommonsObjC",
            type: .static,
            targets: [
                "SwiftCommonsObjC",
            ]
        ),
    ],
    targets: [
        .target(
            name: "SwiftCommonsObjC",
            path: "Sources",
            cSettings: [
                .define("HAVE_INTTYPES_H"),
                .define("HAVE_PKCRYPT"),
                .define("HAVE_STDINT_H"),
                .define("HAVE_WZAES"),
                .define("HAVE_ZLIB"),
            ],
            linkerSettings: [
                .linkedFramework("Security"),
                .linkedLibrary("iconv"),
                .linkedLibrary("z"),
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
