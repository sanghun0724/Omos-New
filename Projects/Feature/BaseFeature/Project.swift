import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .feature(target: .OnboardingFeature),
        .feature(target: .TodayFeature)
    ]
)
