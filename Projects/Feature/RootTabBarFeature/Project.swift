import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.RootTabBarFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest, .uiTest, .demo],
    internalDependencies: [
        .feature(target: .TodayFeature),
        .feature(target: .MyRecordFeature),
        .feature(target: .MyDJFeature),
        .feature(target: .AllRecordFeature),
        .feature(target: .MyPageFeature)
    ],
    interfaceDependencies: [
        .domain(target: .BaseDomain)
    ]
)
