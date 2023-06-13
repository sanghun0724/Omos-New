import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.UserInterface.PresentationFoundation.rawValue,
    product: .staticLibrary,
    targets: [],
    internalDependencies: [
        .shared(target: .GlobalThirdPartyLibrary),
    ]
)
