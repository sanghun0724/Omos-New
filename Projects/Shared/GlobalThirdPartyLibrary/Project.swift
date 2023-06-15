import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.GlobalThirdPartyLibrary.rawValue,
    product: .framework,
    targets: [],
    externalDependencies: [
        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.LogFlume,
        .SPM.RIBs,
        .SPM.RxDataSources,
        .SPM.NeedleFoundation,
        .SPM.ReactorKit,
        .SPM.Kingfisher,
        .SPM.Alamofire,
        .SPM.SkeletonView,
        .SPM.SnapKit,
        .SPM.KakaoSDK,
        .SPM.RxGesture,
    ]
)
