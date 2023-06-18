import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.SignUpFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest, .uiTest, .demo],
    internalDependencies: [
        .feature(target: .BaseFeature),
        .feature(target: .TodayFeature, type: .interface),
        .domain(target: .OnboardingDomain, type: .interface)
    ]
)
