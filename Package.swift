// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aws-signer-v4",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "AWSSigner", targets: ["AWSSigner"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio", .upToNextMajor(from: "2.13.1")),
        .package(url: "https://github.com/apple/swift-crypto.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "AWSSigner",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOHTTP1", package: "swift-nio"),
                .product(name: "Crypto", package: "swift-crypto")
            ]
        ),
        
        .testTarget(name: "AWSSignerTests", dependencies: ["AWSSigner"])
    ]
)
