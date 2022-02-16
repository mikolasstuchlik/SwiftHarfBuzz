// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HarfBuzz",
    products: [
        .library(name: "HarfBuzz", targets: ["HarfBuzz"]),
    ],
    dependencies: [
    ],
    targets: [
        .systemLibrary(
            name: "CHarfBuzz", 
            pkgConfig: "harfbuzz", 
            providers: [
                .brew(["harfbuzz", "glib", "glib-networking", "gobject-introspection"]),
                .apt(["libharfbuzz-dev", "libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
                ]
            ),
        .target(
            name: "HarfBuzz",
            dependencies: ["CHarfBuzz"],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug))]
        ),
        .testTarget(
            name: "HarfBuzzTests",
            dependencies: ["HarfBuzz"]),
    ]
)
