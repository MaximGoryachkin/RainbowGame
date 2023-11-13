// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nexus",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(name: "GameModule", targets: ["GameModule"]),
    ],
    targets: [
        .target(name: "Redux"),
        .target(
            name: "GameModule",
            dependencies: [
                "Redux"
            ]),
        .testTarget(
            name: "GameModuleTests",
            dependencies: ["GameModule"]),
    ]
)
