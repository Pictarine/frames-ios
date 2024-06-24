// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "Frames",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Checkout",
            targets: ["Checkout"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/checkout/checkout-risk-sdk-ios.git",
            exact: "3.0.2"),
        .package(
            url: "https://github.com/checkout/checkout-event-logger-ios-framework.git",
            from: "1.2.4"
        )
    ],
    targets: [
        .target(
            name: "Checkout",
            dependencies: [
                .product(name: "CheckoutEventLoggerKit",
                         package: "checkout-event-logger-ios-framework"),
                .product(name: "Risk", package: "checkout-risk-sdk-ios"),
            ],
            path: "Checkout/Source"
        ),
        .testTarget(
            name: "CheckoutTests",
            dependencies: [
                "Checkout"
            ],
            path: "CheckoutTests"
        )
    ],
    swiftLanguageVersions: [.v5]
)

