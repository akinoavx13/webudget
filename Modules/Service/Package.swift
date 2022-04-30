// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Service",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "FormatterService", targets: ["FormatterService"])
    ],
    dependencies: [],
    targets: [
        .target(name: "FormatterService", dependencies: [])
    ]
)
