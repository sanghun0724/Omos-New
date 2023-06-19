import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.TodayFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest, .uiTest, .demo],
    internalDependencies: [
        
    ],
    interfaceDependencies: [
        .domain(target: .BaseDomain)
    ]
)
