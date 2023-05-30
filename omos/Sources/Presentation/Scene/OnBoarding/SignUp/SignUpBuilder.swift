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

// MARK: - SignUpBuildDependency

struct SignUpBuildDependency {
    let listener: SignUpListener
}

// MARK: - SignUpComponent

final class SignUpComponent: NeedleFoundation.Component<SignUpDependency> {
    fileprivate var initialState: SignUpPresentableState {
        SignUpPresentableState()
    }
    
}

// MARK: - SignUpBuildable

protocol SignUpBuildable: Buildable {
    func build(with dynamicBuildDependency: SignUpBuildDependency) -> SignUpRouting
}

// MARK: - SignUpBuilder

final class SignUpBuilder:
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
        return SignUpRouter(interactor: interactor, viewController: viewController)
    }
}
