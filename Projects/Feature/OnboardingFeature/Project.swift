import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.OnboardingFeature.rawValue,
    product: .staticLibrary,
    targets: [.testing, .interface, .unitTest, .uiTest, .demo],
    internalDependencies: [
        .feature(target: .TodayFeature, type: .interface)
    ],
    interfaceDependencies: [
        .domain(target: .BaseDomain)
    ]
)
