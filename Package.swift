// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PocketFiles",
    platforms: [
        .iOS(.v11),
        .watchOS(.v5),
    ],
    products: [.library(
        name: "PocketFiles",
        targets: ["PocketFiles"])],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PocketFiles",
            dependencies: []),
        .testTarget(
            name: "PocketFilesTests",
            dependencies: ["PocketFiles"]),
    ])
