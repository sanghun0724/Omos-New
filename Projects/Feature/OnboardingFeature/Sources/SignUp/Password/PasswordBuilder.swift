//
//  PasswordBuilder.swift
//  OnboardingFeature
//
//  Created by 이상헌 on 2023/07/06.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

import OnboardingFeatureInterface
import OnboardingDomainInterface

// MARK: - PasswordDependency

public protocol PasswordDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
    var nicknameBuilder: NicknameBuildable { get }
}


// MARK: - PasswordComponent

public final class PasswordComponent: NeedleFoundation.Component<PasswordDependency> {
    fileprivate var initialState: PasswordPresentableState {
        PasswordPresentableState()
    }
}

// MARK: - PasswordBuilder

public final class PasswordBuilder:
    ComponentizedBuilder<PasswordComponent, PasswordRouting, PasswordBuildDependency, Void>,
    PasswordBuildable
{

    public override func build(
      with component: PasswordComponent,
      _ payload: PasswordBuildDependency
    ) -> PasswordRouting {
        let viewController = PasswordViewController()
        let interactor = PasswordInteractor(
            onboardingRepositoryService: component.onboardingRepositoryService,
            presenter: viewController,
            initialState: component.initialState
        )
        
        interactor.listener = payload.listener
        return PasswordRouter(
            interactor: interactor,
            viewController: viewController,
            nicknameBuilder: component.nicknameBuilder
        )
    }
}
