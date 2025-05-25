// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "GraphqlAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "GraphqlAPI", targets: ["GraphqlAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios", exact: "1.21.0"),
  ],
  targets: [
    .target(
      name: "GraphqlAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
  ]
)
