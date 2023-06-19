import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.DesignSystem.rawValue,
    product: .staticLibrary,
    targets: [.uiTest, .demo],
    internalDependencies: [
        .shared(target: .AppFoundation),
        .shared(target: .GlobalThirdPartyLibrary)
    ],
    resources: ["Resources/**"]
)
