// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Branch",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
    ],
    products: [
        .library(
            name: "Branch",
            targets: ["Branch"]),
    ],
    targets: [
        .target(
            name: "Branch",
            path: "Branch-SDK",
            publicHeadersPath: ".",
            swiftSettings: [
               .unsafeFlags(["-Xcc", "-Wno-incomplete-umbrella"])
            ],
            linkerSettings: [
                .linkedFramework("CoreServices"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony", .when(platforms: [.iOS])),
                .linkedFramework("WebKit", .when(platforms: [.iOS])),
                .linkedFramework("CoreSpotlight", .when(platforms: [.iOS])),
                .linkedFramework("AdServices", .when(platforms: [.iOS]))
            ]
        ),
    ]
)
