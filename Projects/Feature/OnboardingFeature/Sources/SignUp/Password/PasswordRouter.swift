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

protocol PasswordInteractable: Interactable, AgreementListener {
    var router: PasswordRouting? { get set }
    var listener: PasswordListener? { get set }
}

protocol PasswordViewControllable: ViewControllable {}

// MARK: - PasswordRouter

final class PasswordRouter:
  ViewableRouter<PasswordInteractable, PasswordViewControllable>,
  PasswordRouting
{
    private let agreementBuilder: AgreementBuildable
    private var agreementRouter: AgreementRouting?

     init(
      interactor: PasswordInteractable,
      viewController: PasswordViewControllable,
      agreementBuilder: AgreementBuildable
    ) {
        self.agreementBuilder = agreementBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachAgreementRIB() {
        guard self.agreementRouter == nil else { return }
        let router = self.agreementBuilder.build(
            with: AgreementBuildDependency(
                listener: interactor
            )
        )
        attachChild(router)
        viewController.push(viewController: router.viewControllable)
    }
    
    func detachAgreementRIB() {
        guard let router = agreementRouter else { return }
        detachChild(router)
        viewController.pop(router.viewControllable)
    }
}
