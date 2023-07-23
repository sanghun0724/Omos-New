//
//  NicknameInterface.swift
//  SignUpFeatureTesting
//
//  Created by sangheon on 2023/06/14.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

// MARK: - NicknameListener

/// @mockable
public protocol NicknameListener: AnyObject {
    
}

// MARK: - NicknameRouting

/// @mockable
public protocol NicknameRouting: ViewableRouting {
    func attachRootTabBarRIB()
    func detachRootTabBarRIB()
}

// MARK: - NicknameBuildDependency

/// @mockable
public struct NicknameBuildDependency {
    public let listener: NicknameListener
    
    public init(listener: NicknameListener) {
        self.listener = listener
    }
}

// MARK: - NicknameBuildable

/// @mockable
public protocol NicknameBuildable: Buildable {
    func build(with dynamicBuildDependency: NicknameBuildDependency) -> NicknameRouting
}
