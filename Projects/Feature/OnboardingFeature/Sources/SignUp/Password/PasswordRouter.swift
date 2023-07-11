//
//  PasswordRouter.swift
//  OnboardingFeature
//
//  Created by 이상헌 on 2023/07/06.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

import OnboardingFeatureInterface

// MARK: - PasswordInteractable

protocol PasswordInteractable: Interactable {
    var router: PasswordRouting? { get set }
    var listener: PasswordListener? { get set }
}

protocol PasswordViewControllable: ViewControllable {}

// MARK: - PasswordRouter

final class PasswordRouter:
  ViewableRouter<PasswordInteractable, PasswordViewControllable>,
  PasswordRouting
{

    override init(
      interactor: PasswordInteractable,
      viewController: PasswordViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
