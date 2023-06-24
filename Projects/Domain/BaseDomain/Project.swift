import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .core(target: .CoreKit),
        .domain(target: .OnboardingDomain),
        .domain(target: .OnboardingDomain, type: .interface),
        .domain(target: .RecordDomain),
        .domain(target: .RecordDomain, type: .interface)
    ]
)
