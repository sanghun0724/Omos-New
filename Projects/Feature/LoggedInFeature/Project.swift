import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.LoggedInFeature.rawValue,
    product: .staticLibrary,
    targets: [.testing, .interface, .unitTest, .uiTest, .demo],
    internalDependencies: [
        .feature(target: .BaseFeature),
        .feature(target: .SignUpFeature),
        .domain(target: .OnboardingDomain)
    ]
)
