//
//  SignUpBuilder.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import NeedleFoundation
import RIBs

// MARK: - SignUpDependency

protocol SignUpDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
}

// MARK: - SignUpComponent

public final class SignUpComponent: NeedleFoundation.Component<SignUpDependency> {
    fileprivate var initialState: SignUpPresentableState {
        SignUpPresentableState()
    }
    
    fileprivate var nicknameBuilder: NicknameBuildable {
        NicknameBuilder {
            NicknameComponent(parent: self)
        }
    }
    
}

// MARK: - SignUpBuilder

public final class SignUpBuilder:
    ComponentizedBuilder<SignUpComponent, SignUpRouting, SignUpBuildDependency, Void>,
    SignUpBuildable
{

    override func build(
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
