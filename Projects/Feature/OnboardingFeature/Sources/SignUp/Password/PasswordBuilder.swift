//
//  PasswordBuilder.swift
//  OnboardingFeature
//
//  Created by 이상헌 on 2023/07/06.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

// MARK: - PasswordDependency

protocol PasswordDependency: NeedleFoundation.Dependency {}

// MARK: - PasswordBuildDependency

struct PasswordBuildDependency {
    let listener: PasswordListener
}

// MARK: - PasswordComponent

final class PasswordComponent: NeedleFoundation.Component<PasswordDependency> {
    fileprivate var initialState: PasswordPresentableState {
        PasswordPresentableState()
    }
}

// MARK: - PasswordBuildable

protocol PasswordBuildable: Buildable {
    func build(with dynamicBuildDependency: PasswordBuildDependency) -> PasswordRouting
}

// MARK: - PasswordBuilder

final class PasswordBuilder:
    ComponentizedBuilder<PasswordComponent, PasswordRouting, PasswordBuildDependency, Void>,
    PasswordBuildable
{

    override func build(
      with component: PasswordComponent,
      _ payload: PasswordBuildDependency
    ) -> PasswordRouting {
        let viewController = PasswordViewController()
        let interactor = PasswordInteractor(presenter: viewController, initialState: component.initialState)
        
        interactor.listener = payload.listener
        return PasswordRouter(interactor: interactor, viewController: viewController)
    }
}
