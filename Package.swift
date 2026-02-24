// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CSOTPView",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "CSOTPView", targets: ["CSOTPView"])
    ],
    targets: [
        .target(
            name: "CSOTPView",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
