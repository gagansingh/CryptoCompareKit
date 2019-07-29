// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "CryptoCompareKit",
    products: [
        .library(name: "CryptoCompareKit", targets: ["CryptoCompareKit"])
    ],
    targets: [
        .target(name: "CryptoCompareKit", path: "Source"),
        .testTarget(name: "CryptoCompareKitTests", dependencies: ["CryptoCompareKit"])
    ]
)