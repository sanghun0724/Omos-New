//
//  OnboardingInterface.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/06/25.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

// MARK: - OnboardingListener

public protocol OnboardingListener: AnyObject {}

// MARK: - OnboardingRouting

public protocol OnboardingRouting: ViewableRouting {
    
}

// MARK: - OnboardingBuildDependency

public struct OnboardingBuildDependency {
    public let listener: OnboardingListener
    
    public init(listener: OnboardingListener) {
        self.listener = listener
    }
}

// MARK: - OnboardingBuildable

public protocol OnboardingBuildable: Buildable {
    func build(with dynamicBuildDependency: OnboardingBuildDependency) -> OnboardingRouting
}
