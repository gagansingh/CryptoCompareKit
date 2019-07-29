// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "CryptoCompareKit",
    // platforms: [.iOS("10.0"), .macOS("10.12"), tvOS("10.0"), .watchOS("3.0")],
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
