// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Service",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "FormatterService", targets: ["FormatterService"]),
        .library(name: "DatabaseService", targets: ["DatabaseService"]),
        .library(name: "BudgetService", targets: ["BudgetService"])
    ],
    dependencies: [
        .package(name: "Model", path: "./Model"),
        .package(name: "Core", path: "./Core")
    ],
    targets: [
        .target(name: "FormatterService", dependencies: []),
        .target(name: "DatabaseService", dependencies: [
            "Model"
        ]),
        .target(name: "BudgetService", dependencies: [
            "Model",
            "DatabaseService",
            "Core"
        ])
    ]
)
