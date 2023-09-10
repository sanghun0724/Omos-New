//
//  AgreementBuilder.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

import OnboardingFeatureInterface
import AppFoundation

// MARK: - AgreementDependency

public protocol AgreementDependency: NeedleFoundation.Dependency {
    var nicknameBuilder: NicknameBuildable { get }
}

// MARK: - AgreementComponent

public final class AgreementComponent: NeedleFoundation.Component<AgreementDependency> {
    fileprivate var initialState: AgreementPresentableState {
        AgreementPresentableState()
    }
}

// MARK: - AgreementBuilder

public final class AgreementBuilder:
    ComponentizedBuilder<AgreementComponent, AgreementRouting, AgreementBuildDependency, Void>,
    AgreementBuildable
{

    public override func build(
      with component: AgreementComponent,
      _ payload: AgreementBuildDependency
    ) -> AgreementRouting {
        let viewController = AgreementViewController()
        let interactor = AgreementInteractor(presenter: viewController, initialState: component.initialState)
        
        interactor.listener = payload.listener
        return AgreementRouter(
            interactor: interactor,
            viewController: viewController,
            nicknameBuilder: component.nicknameBuilder
        )
    }
}
