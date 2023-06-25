//
//  OnboardingRouter.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/06/25.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

// MARK: - OnboardingInteractable

protocol OnboardingInteractable: Interactable {
    var router: OnboardingRouting? { get set }
    var listener: OnboardingListener? { get set }
}

protocol OnboardingViewControllable: ViewControllable {}

// MARK: - OnboardingRouter

final class OnboardingRouter:
  ViewableRouter<OnboardingInteractable, OnboardingViewControllable>,
  OnboardingRouting
{

    override init(
      interactor: OnboardingInteractable,
      viewController: OnboardingViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
