// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "TransactionFeature", targets: ["TransactionFeature"]),
        .library(name: "HistoryFeature", targets: ["HistoryFeature"]),
        .library(name: "TagListFeature", targets: ["TagListFeature"]),
        .library(name: "TagDetailsFeature", targets: ["TagDetailsFeature"]),
        .library(name: "BudgetFeature", targets: ["BudgetFeature"])
    ],
    dependencies: [
        .package(name: "Core", path: "./Core"),
        .package(name: "Service", path: "./Service"),
        .package(name: "SharedUI", path: "./SharedUI"),
        .package(name: "Model", path: "./Model")
    ],
    targets: [
        .target(name: "TransactionFeature", dependencies: [
            "Core",
            "SharedUI",
            "Model",
            .product(name: "FormatterService", package: "Service"),
            .product(name: "BudgetService", package: "Service")
        ]),
        .target(name: "HistoryFeature", dependencies: [
            "Core",
            "Model",
            .product(name: "BudgetService", package: "Service"),
            .product(name: "FormatterService", package: "Service")
        ]),
        .target(name: "TagListFeature", dependencies: [
            "Core",
            "Model",
            "TagDetailsFeature",
            .product(name: "BudgetService", package: "Service")
        ]),
        .target(name: "TagDetailsFeature", dependencies: [
            "Core",
            "Model",
            .product(name: "BudgetService", package: "Service")
        ]),
        .target(name: "BudgetFeature", dependencies: [
            "Core"
        ])
    ]
)
