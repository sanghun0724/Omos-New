import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.DesignSystem.rawValue,
    product: .framework,
    targets: [.uiTest, .demo],
    internalDependencies: [
        .shared(target: .AppFoundation)
    ],
    resources: ["Resources/**"]
)
