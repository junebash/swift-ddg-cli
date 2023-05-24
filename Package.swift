// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ddg-cli",
    platforms: [.macOS(.v13)],
    products: [
        .executable(name: "ddg", targets: ["ddg-cli"])
    ],
    dependencies: [
    ],
    targets: [
        .executableTarget(
            name: "ddg-cli",
            dependencies: []
        ),
        .testTarget(
            name: "ddg-cliTests",
            dependencies: ["ddg-cli"]
        ),
    ]
)
