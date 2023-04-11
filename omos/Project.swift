import ProjectDescription

// MARK: - Project

let infoPlist: [String: InfoPlist.Value] = [
    "UILaunchScreen": [:],
    "App Transport Security Settings": ["Allow Arbitrary Loads": "YES"],
]

let project = Project(
    name: "omos",
    organizationName: nil,
    targets: [
        Target(
            name: "omos",
            platform: .iOS,
            product: .app,
            bundleId: "com.sangheon.Omos",
           // deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "ModernRIBs")
            ]
        ),
        Target(
            name: "omosTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.sangheon.Omos",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "omos")
            ]
        )
    ]
)
