//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by sangheon on 2023/05/05.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
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


/// 피처 의존성 예시 
//extension TargetDependency {
//    public enum Projcet {}
//}
//
//extension TargetDependency.Projcet {
//    static let Feature = TargetDependency.project(target: "Feature", path: .relativeToRoot("Projects/Feature"))
//    static let Service = TargetDependency.project(target: "Service", path: .relativeToRoot("Projects/Service"))
//    static let ThirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/ThirdPartyLib"))
//}
