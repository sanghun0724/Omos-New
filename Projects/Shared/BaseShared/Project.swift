import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.BaseShared.rawValue,
    product: .staticLibrary,
    targets: [],
    internalDependencies: [
        .shared(target: .DesignSystem),
        .shared(target: .GlobalThirdPartyLibrary)
    ]
)
