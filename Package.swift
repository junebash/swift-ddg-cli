// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "ddg-cli",
    platforms: [.macOS(.v13)],
    products: [
        .executable(name: "ddg", targets: ["ddg"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "ddg",
            dependencies: [],
            path: "./Sources"
        ),
        .testTarget(
          name: "Tests",
          dependencies: ["ddg"],
          path: "./Tests"
        )
    ]
)
