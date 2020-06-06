// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "CryptoCompareKit",
    platforms: [.iOS(.v10), .macOS(.v10_14)],
    products: [
        .library(name: "CryptoCompareKit", targets: ["CryptoCompareKit"])
    ],
    targets: [
        .target(
            name: "CryptoCompareKit",
            path: "Source"
        )
    ]
)
