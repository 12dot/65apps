// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommandLineTool",
    dependencies: [
        //loading frameworks
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "CommandLineTool",
            dependencies: ["Alamofire", "SwiftyJSON",.product(name: "ArgumentParser", package: "swift-argument-parser")]
        ),
        .testTarget(
            name: "CommandLineToolTests"
        )
    ]
)
