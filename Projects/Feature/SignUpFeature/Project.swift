import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.SignUpFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest, .uiTest, .demo],
    internalDependencies: [
        .feature(target: .TodayFeature, type: .interface)
    ],
    interfaceDependencies: [
        .domain(target: .BaseDomain)
    ]
)
