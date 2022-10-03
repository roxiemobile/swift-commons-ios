// swift-tools-version: 5.6

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
            targets: ["SwiftCommons"]
        ),

        .library(
            name: "SwiftCommonsAbstractions",
            type: .static,
            targets: ["SwiftCommonsAbstractions"]
        ),
        .library(
            name: "SwiftCommonsConcurrent",
            type: .static,
            targets: ["SwiftCommonsConcurrent"]
        ),
        .library(
            name: "SwiftCommonsData",
            type: .static,
            targets: ["SwiftCommonsData"]
        ),
        .library(
            name: "SwiftCommonsDiagnostics",
            type: .static,
            targets: ["SwiftCommonsDiagnostics"]
        ),
        .library(
            name: "SwiftCommonsExtensions",
            type: .static,
            targets: ["SwiftCommonsExtensions"]
        ),
        .library(
            name: "SwiftCommonsLang",
            type: .static,
            targets: ["SwiftCommonsLang"]
        ),
        .library(
            name: "SwiftCommonsLogging",
            type: .static,
            targets: ["SwiftCommonsLogging"]
        ),
        .library(
            name: "SwiftCommonsObjC",
            type: .static,
            targets: ["SwiftCommonsObjC"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/krzyzanowskim/CryptoSwift",
            exact: "1.6.0"
        ),
    ],
    targets: [
        .target(
            name: "SwiftCommons",
            dependencies: [
                .target(name: "SwiftCommonsAbstractions"),
                .target(name: "SwiftCommonsConcurrent"),
                .target(name: "SwiftCommonsData"),
                .target(name: "SwiftCommonsDiagnostics"),
                .target(name: "SwiftCommonsExtensions"),
                .target(name: "SwiftCommonsLang"),
                .target(name: "SwiftCommonsLogging"),
                .target(name: "SwiftCommonsObjC"),
            ]
        ),

        .target(
            name: "SwiftCommonsAbstractions",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Abstractions/Sources"
        ),
        .target(
            name: "SwiftCommonsConcurrent",
            dependencies: [
                .target(name: "SwiftCommonsObjC"),
            ],
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Concurrent",
            exclude: [
                "Configuration",
                "Package.swift",
                "README.md",
            ],
            sources: [
                "Dependencies/SCAAtomic",
                "Dependencies/Synchronized",
                "Dependencies/TryCatchFinally",
            ]
        ),
        .target(
            name: "SwiftCommonsData",
            dependencies: [
                .byName(name: "CryptoSwift"),
                .target(name: "SwiftCommonsDiagnostics"),
            ],
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Data",
            exclude: [
                "Configuration",
                "Package.swift",
                "README.md",
            ],
            sources: [
                "Dependencies/ObjectMapper",
                "Sources",
            ]
        ),
        .target(
            name: "SwiftCommonsDiagnostics",
            dependencies: [
                .target(name: "SwiftCommonsConcurrent"),
                .target(name: "SwiftCommonsExtensions"),
            ],
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Diagnostics/Sources"
        ),
        .target(
            name: "SwiftCommonsExtensions",
            dependencies: [
                .target(name: "SwiftCommonsAbstractions"),
                .target(name: "SwiftCommonsLogging"),
            ],
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Extensions",
            exclude: [
                "Configuration",
                "Package.swift",
                "README.md",
            ],
            sources: [
                "Dependencies/TimeIntervals",
                "Sources",
            ]
        ),
        .target(
            name: "SwiftCommonsLang",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Lang/Sources"
        ),
        .target(
            name: "SwiftCommonsLogging",
            dependencies: [
                .target(name: "SwiftCommonsConcurrent"),
                .target(name: "SwiftCommonsLang"),
            ],
            path: "Modules/RoxieMobile.SwiftCommons/Sources/Logging/Sources"
        ),
        .target(
            name: "SwiftCommonsObjC",
            path: "Modules/RoxieMobile.SwiftCommons/Sources/ObjC/Sources",
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
