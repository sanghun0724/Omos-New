//
//  OnboardingBuilder.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/06/25.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

import OnboardingFeatureInterface
import OnboardingDomainInterface

// MARK: - OnboardingDependency

public protocol OnboardingDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
    var emailSignUpBuilder: EmailSignUpBuildable { get }
    var loggedInBuilder: LoggedInBuildable { get }
    var agreementBuilder: AgreementBuildable { get }
}

// MARK: - OnboardingComponent

public final class OnboardingComponent: NeedleFoundation.Component<OnboardingDependency> {
    fileprivate var initialState: OnboardingPresentableState {
        OnboardingPresentableState()
    }
}

// MARK: - OnboardingBuilder

public final class OnboardingBuilder:
    ComponentizedBuilder<OnboardingComponent, OnboardingRouting, OnboardingBuildDependency, Void>,
    OnboardingBuildable
{

    override public func build(
      with component: OnboardingComponent,
      _ payload: OnboardingBuildDependency
    ) -> OnboardingRouting {
        let viewController = OnboardingViewController()
        let interactor = OnboardingInteractor(
            presenter: viewController,
            initialState: component.initialState,
            onboardingRepositoryService: component.onboardingRepositoryService
        )
        
        interactor.listener = payload.listener
        return OnboardingRouter(
            interactor: interactor,
            viewController: viewController, signUpBuilder: component.emailSignUpBuilder,
            loggedInBuilder: component.loggedInBuilder,
            agreementBuilder: component.agreementBuilder
        )
    }
}
