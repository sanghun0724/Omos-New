import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.LoggedInFeature.rawValue,
    product: .staticLibrary,
    targets: [.testing, .interface, .unitTest, .uiTest, .demo],
    internalDependencies: [
        .feature(target: .SignUpFeature, type: .interface),
        .feature(target: .TodayFeature, type: .interface)
    ],
    interfaceDependencies: [
        .domain(target: .BaseDomain)
    ]
)
