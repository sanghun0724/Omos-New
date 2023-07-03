//
//  AgreementBuilder.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

// MARK: - AgreementDependency

protocol AgreementDependency: NeedleFoundation.Dependency {}

// MARK: - AgreementComponent

final class AgreementComponent: NeedleFoundation.Component<AgreementDependency> {
    fileprivate var initialState: AgreementPresentableState {
        AgreementPresentableState()
    }
}


// MARK: - AgreementBuilder

final class AgreementBuilder:
    ComponentizedBuilder<AgreementComponent, AgreementRouting, AgreementBuildDependency, Void>,
    AgreementBuildable
{

    override func build(
      with component: AgreementComponent,
      _ payload: AgreementBuildDependency
    ) -> AgreementRouting {
        let viewController = AgreementViewController()
        let interactor = AgreementInteractor(presenter: viewController, initialState: component.initialState)
        
        interactor.listener = payload.listener
        return AgreementRouter(interactor: interactor, viewController: viewController)
    }
}
