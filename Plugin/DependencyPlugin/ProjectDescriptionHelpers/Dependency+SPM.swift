import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let LogFlume = TargetDependency.external(name: "LogFlume")
    static let NeedleFoundation = TargetDependency.external(name: "NeedleFoundation")
    static let RxDataSources = TargetDependency.external(name: "RxDataSources")
    static let RIBs = TargetDependency.external(name: "RIBs")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let SkeletonView = TargetDependency.external(name: "SkeletonView")
    static let ReactorKit = TargetDependency.external(name: "ReactorKit")
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let KakaoSDK = TargetDependency.external(name: "KakaoSDK")
    static let RxGesture = TargetDependency.external(name: "RxGesture")
}

public extension Package {
}
