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
        .library(name: "TimerService", targets: ["TimerService"]),
        .library(name: "QuestionService", targets: ["QuestionService"]),
        .library(name: "SoundService", targets: ["SoundService"]),
        .library(name: "Redux", targets: ["Redux"]),
        .library(name: "Core", targets: ["Core"]),
        .library(name: "Models", targets: ["Models"]),
    ],
    targets: [
        .target(name: "Redux"),
        .target(name: "Models"),
        .target(name: "TimerService"),
        .target(
            name: "SoundService",
            resources: [.process("Resources")]
        ),
        .target(
            name: "QuestionService",
            dependencies: ["Models"]),
        .target(
            name: "Core",
            dependencies: [
                "Redux",
                "Models"
            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: [
                "Core"
            ])
    ]
)
