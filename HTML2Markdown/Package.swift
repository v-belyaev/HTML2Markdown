// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "HTML2Markdown",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "HTML2Markdown",
            targets: ["HTML2Markdown"]
        ),
    ],
    dependencies: [
        .package(path: "Dependencies"),
    ],
    targets: [
        .target(
            name: "HTML2Markdown",
            dependencies: [
                .product(name: "_SwiftSoup", package: "Dependencies")
            ]
        ),
    ]
)
