//
//  PasswordInterace.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/06.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

// MARK: - PasswordListener

public protocol PasswordListener: AnyObject {}

// MARK: - PasswordRouting

public protocol PasswordRouting: ViewableRouting {
    func attachAgreementRIB()
    func detachAgreementRIB()
}

// MARK: - PasswordBuildDependency

public struct PasswordBuildDependency {
    public let listener: PasswordListener
    
    public init(listener: PasswordListener) {
        self.listener = listener
    }
}

// MARK: - PasswordBuildable

public protocol PasswordBuildable: Buildable {
    func build(with dynamicBuildDependency: PasswordBuildDependency) -> PasswordRouting
}
