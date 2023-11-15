// swift-tools-version: 5.7.1
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
        .library(name: "Timer", targets: ["Timer"]),
    ],
    targets: [
        .target(name: "Redux"),
        .target(name: "Models"),
        .target(name: "Timer", dependencies: ["Core"]),
        .target(
            name: "Core",
            dependencies: [
                "Redux",
                "Models"
            ]),
        .target(
            name: "GameModule",
            dependencies: [
                "Core"
            ]),
//        .testTarget(
//            name: "GameModuleTests",
//            dependencies: [
//                "GameModule",
//                "Core"
//            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: [
                "Core"
            ])
    ]
)
