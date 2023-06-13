import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    product: .framework,
    targets: [.unitTest],
    internalDependencies: [
        .userInterface(target: .DesignSystem),
        .userInterface(target: .PresentationFoundation),
        .shared(target: .GlobalThirdPartyLibrary),
        .shared(target: .AppFoundation),
    ]
)
