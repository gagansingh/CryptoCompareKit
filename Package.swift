import PackageDescription

let package = Package(
    name: "CryptoCompareKit",
    products: [
        .library(name: "CryptoCompareKit", targets: ["CryptoCompareKit"])
    ],
    targets: [
        .target(name: "CryptoCompareKit", path: "CryptoCompareKit"),
        .testTarget(name: "CryptoCompareKitTests", dependencies: ["CryptoCompareKit"])
    ]
)