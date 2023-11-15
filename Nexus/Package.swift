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
        .library(name: "TimerDriver", targets: ["TimerDriver"]),
        .library(name: "QuestionDriver", targets: ["QuestionDriver"]),
    ],
    targets: [
        .target(name: "Redux"),
        .target(name: "Models"),
        .target(name: "TimerDriver", dependencies: ["Core"]),
        .target(
            name: "QuestionDriver",
            dependencies: [
                "Core",
                "Models",
            ]),
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
