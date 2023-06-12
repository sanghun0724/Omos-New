import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.SignUpFeature.rawValue,
    product: .staticLibrary,
    targets: [.unitTest, .uiTest, .demo],
    internalDependencies: [
        .feature(target: .BaseFeature),
        .feature(target: .TodayFeature),
        .domain(target: .OnboardingDomain)
    ]
)
