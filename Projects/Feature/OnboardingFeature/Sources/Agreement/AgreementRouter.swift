//
//  AgreementRouter.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

import OnboardingFeatureInterface

// MARK: - AgreementInteractable

protocol AgreementInteractable: Interactable {
    var router: AgreementRouting? { get set }
    var listener: AgreementListener? { get set }
}

protocol AgreementViewControllable: ViewControllable {}

// MARK: - AgreementRouter

final class AgreementRouter:
  ViewableRouter<AgreementInteractable, AgreementViewControllable>,
  AgreementRouting
{

    override init(
      interactor: AgreementInteractable,
      viewController: AgreementViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
