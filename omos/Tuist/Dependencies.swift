//
//  Dependencies.swift
//  Config
//
//  Created by sangheon on 2023/04/11.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/ReactiveX/RxSwift.git",
                requirement: .exact("6.5.0")),
        .remote(url: "https://github.com/sanghun0724/LogFlume.git",
                requirement: .exact("0.1.0")),
        .remote(url: "https://github.com/RxSwiftCommunity/RxDataSources.git",
                requirement: .exact("5.0.0")),
        .remote(url: "https://github.com/uber/needle.git",
                requirement: .exact("0.23.0")),
        .remote(url: "https://github.com/uber/RIBs.git",
                requirement: .exact("0.14.1")),
        .remote(url: "https://github.com/ReactorKit/ReactorKit.git",
                requirement: .upToNextMajor(from: "3.0.0")),
        .remote(url: "https://github.com/SnapKit/SnapKit.git",
                requirement: .upToNextMajor(from: "5.0.0")),
        .remote(url: "https://github.com/onevcat/Kingfisher.git",
                requirement: .upToNextMajor(from: "7.0.0")),
        .remote(url: "https://github.com/Juanpe/SkeletonView.git",
                requirement: .upToNextMajor(from: "1.0.0")),
        .remote(url: "https://github.com/Alamofire/Alamofire.git",
                requirement: .upToNextMajor(from: "5.6.4")),
        .remote(url: "https://github.com/kakao/kakao-ios-sdk",
                requirement: .branch("master")),
        .remote(url: "https://github.com/RxSwiftCommunity/RxGesture.git",
                requirement: .upToNextMajor(from: "4.0.4")),
        .remote(url: "https://github.com/sanghun0724/SHLEE.git",
                    requirement: .branch("main"))
    ],
    platforms: [.iOS]
)
