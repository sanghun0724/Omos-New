import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    product: .framework,
    targets: [.unitTest],
    internalDependencies: [
        .domain(target: .OnboardingDomain, type: .sources),
        .domain(target: .OnboardingDomain, type: .interface)
    ]
)
