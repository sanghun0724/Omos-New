//
//  AgreementInterface.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

// MARK: - AgreementListener

public protocol AgreementListener: AnyObject {}

// MARK: - AgreementRouting

public protocol AgreementRouting: ViewableRouting {
    
}

// MARK: - AgreementBuildDependency

public struct AgreementBuildDependency {
    public let listener: AgreementListener
    
    init(listener: AgreementListener) {
        self.listener = listener
    }
}

// MARK: - AgreementBuildable

public protocol AgreementBuildable: Buildable {
    func build(with dynamicBuildDependency: AgreementBuildDependency) -> AgreementRouting
}
