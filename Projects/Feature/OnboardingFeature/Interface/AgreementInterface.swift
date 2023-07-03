//
//  AgreementInterface.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

// MARK: - AgreementListener

protocol AgreementListener: AnyObject {}

// MARK: - AgreementRouting

protocol AgreementRouting: ViewableRouting {
    
}

// MARK: - AgreementBuildDependency

struct AgreementBuildDependency {
    let listener: AgreementListener
}

// MARK: - AgreementBuildable

protocol AgreementBuildable: Buildable {
    func build(with dynamicBuildDependency: AgreementBuildDependency) -> AgreementRouting
}
