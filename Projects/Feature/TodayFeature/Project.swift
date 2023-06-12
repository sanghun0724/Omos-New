import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.TodayFeature.rawValue,
    product: .staticLibrary,
    targets: [.unitTest, .uiTest, .demo],
    internalDependencies: [
        .feature(target: .BaseFeature),
    ]
)
