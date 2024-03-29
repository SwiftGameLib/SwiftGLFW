// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let targets: [PackageDescription.Target] = [
    .target(
        name: "SwiftGLFW",
        dependencies: ["cglfw"]
    ),
    .systemLibrary(
        name: "cglfw",
        pkgConfig: "glfw3",
        providers: [.brew(["glfw"]),
                    .apt(["libglfw3-dev"])]
    ),
    .testTarget(
        name: "SwiftGLFWTests",
        dependencies: ["SwiftGLFW", "cglfw"]
    ),
]

let package = Package(
    name: "SwiftGLFW",
    products: [
        .library(name: "SwiftGLFW", targets: ["SwiftGLFW"]),
    ],
    dependencies: [],
    targets: targets
)
