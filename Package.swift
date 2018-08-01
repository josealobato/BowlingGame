// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BowlingGame",
  dependencies: [
  ],
  targets: [
    .target(
      name: "BowlingGame",
      dependencies: ["BowlingGameCore"]
      ),
    .target(
      name: "BowlingGameCore",
      dependencies: []
      ),
    .testTarget(
      name: "BowlingGameTests",
      dependencies: ["BowlingGameCore"]
    )
  ]
)
