import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Core.CoreKit.rawValue,
    product: .framework,
    targets: [],
    internalDependencies: [
        .shared(target: .GlobalThirdPartyLibrary),
        .shared(target: .AppFoundation)
    ]
)
