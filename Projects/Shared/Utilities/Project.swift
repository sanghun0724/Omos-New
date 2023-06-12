import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.Utilities.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: []
)
