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
import SignUpFeatureInterface


// MARK: - SignUpDependency

public protocol SignUpDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
}

// MARK: - SignUpComponent

public final class SignUpComponent: NeedleFoundation.Component<SignUpDependency> {
    fileprivate var initialState: SignUpPresentableState {
        SignUpPresentableState()
    }
    
}

// MARK: - SignUpBuilder

public final class SignUpBuilder:
    ComponentizedBuilder<SignUpComponent, SignUpRouting, SignUpBuildDependency, Void>,
    SignUpBuildable
{

    override public func build(
      with component: SignUpComponent,
      _ payload: SignUpBuildDependency
    ) -> SignUpRouting {
        let viewController = SignUpViewController()
        let interactor = SignUpInteractor(presenter: viewController, initialState: component.initialState, onboardingRepositoryService: component.onboardingRepositoryService)
        
        interactor.listener = payload.listener
        return SignUpRouter(
            nicknameBuilder: component.nicknameBuilder,
            interactor: interactor,
            viewController: viewController
        )
    }
}
