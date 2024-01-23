// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Dependencies",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "_SwiftSoup",
            targets: ["_SwiftSoup"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/scinfu/SwiftSoup",
            exact: "2.7.0"
        )
    ],
    targets: [
        .target(
            name: "_SwiftSoup",
            dependencies: [
                .product(name: "SwiftSoup", package: "SwiftSoup")
            ]
        ),
    ]
)
