//
//  OnboardingBuilder.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/06/25.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

// MARK: - OnboardingDependency

protocol OnboardingDependency: NeedleFoundation.Dependency {}

// MARK: - OnboardingBuildDependency

struct OnboardingBuildDependency {
    let listener: OnboardingListener
}

// MARK: - OnboardingComponent

final class OnboardingComponent: NeedleFoundation.Component<OnboardingDependency> {
    fileprivate var initialState: OnboardingPresentableState {
        OnboardingPresentableState()
    }
}

// MARK: - OnboardingBuildable

protocol OnboardingBuildable: Buildable {
    func build(with dynamicBuildDependency: OnboardingBuildDependency) -> OnboardingRouting
}

// MARK: - OnboardingBuilder

final class OnboardingBuilder:
    ComponentizedBuilder<OnboardingComponent, OnboardingRouting, OnboardingBuildDependency, Void>,
    OnboardingBuildable
{

    override func build(
      with component: OnboardingComponent,
      _ payload: OnboardingBuildDependency
    ) -> OnboardingRouting {
        let viewController = OnboardingViewController()
        let interactor = OnboardingInteractor(presenter: viewController, initialState: component.initialState)
        
        interactor.listener = payload.listener
        return OnboardingRouter(interactor: interactor, viewController: viewController)
    }
}
