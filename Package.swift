// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "XcodeProj",
    products: [
        .library(name: "XcodeProj", targets: ["XcodeProj"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tuist/XcodeProjCExt", .exact("0.1.0")),
        .package(url: "https://github.com/tadija/AEXML", .upToNextMinor(from: "4.4.0")),
        .package(url: "https://github.com/kylef/PathKit", .upToNextMinor(from: "0.9.0")),
    ],
      swiftLanguageVersions: [.v5],

    targets: [
        .target(name: "XcodeProj",
                dependencies: [
                    "XcodeProjCExt",
                    "PathKit",
                    "AEXML",
                ]),
        .testTarget(name: "XcodeProjTests", dependencies: ["XcodeProj"]),
    ]
)
