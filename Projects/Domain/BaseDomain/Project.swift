import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    product: .framework,
    targets: [.unitTest],
    internalDependencies: [
        .core(target: .CoreKit),
        .domain(target: .OnboardingDomain),
        .domain(target: .OnboardingDomain, type: .interface)
    ]
)
