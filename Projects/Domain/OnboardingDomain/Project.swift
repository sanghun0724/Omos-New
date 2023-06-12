import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.OnboardingDomain.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest],
    internalDependencies: [
        .domain(target: .BaseDomain),
    ]
)
