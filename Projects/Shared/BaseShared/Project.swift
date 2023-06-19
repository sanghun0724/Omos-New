import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.BaseShared.rawValue,
    product: .framework,
    targets: [],
    internalDependencies: [
        .shared(target: .DesignSystem),
        .shared(target: .GlobalThirdPartyLibrary)
    ]
)
