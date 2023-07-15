//
//  SignUpBuilder.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import NeedleFoundation
import RIBs

import OnboardingDomain
import OnboardingDomainInterface
import OnboardingFeatureInterface


// MARK: - SignUpDependency

public protocol EmailSignUpDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
    var passwordBuilder: PasswordBuildable { get }
}

// MARK: - SignUpComponent

public final class EmailSignUpComponent: NeedleFoundation.Component<EmailSignUpDependency> {
    fileprivate var initialState: EmailSignUpPresentableState {
        EmailSignUpPresentableState()
    }
    
}

// MARK: - SignUpBuilder

public final class EmailSignUpBuilder:
    ComponentizedBuilder<EmailSignUpComponent, EmailSignUpRouting, EmailSignUpBuildDependency, Void>,
    EmailSignUpBuildable
{

    override public func build(
      with component: EmailSignUpComponent,
      _ payload: EmailSignUpBuildDependency
    ) -> EmailSignUpRouting {
        let viewController = EmailSignUpViewController()
        let interactor = EmailSignUpInteractor(presenter: viewController, initialState: component.initialState, onboardingRepositoryService: component.onboardingRepositoryService)
        
        interactor.listener = payload.listener
        return EmailSignUpRouter(
            passwordBuilder: component.passwordBuilder,
            interactor: interactor,
            viewController: viewController
        )
    }
}
