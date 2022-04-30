// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedUI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "SharedUI", targets: ["SharedUI"])
    ],
    dependencies: [],
    targets: [
        .target(name: "SharedUI", dependencies: [])
    ]
)
