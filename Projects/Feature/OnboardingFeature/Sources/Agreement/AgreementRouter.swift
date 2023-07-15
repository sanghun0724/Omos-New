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

protocol AgreementInteractable: Interactable, NicknameListener {
    var router: AgreementRouting? { get set }
    var listener: AgreementListener? { get set }
}

protocol AgreementViewControllable: ViewControllable {}

// MARK: - AgreementRouter

final class AgreementRouter:
  ViewableRouter<AgreementInteractable, AgreementViewControllable>,
  AgreementRouting
{
    private let nicknameBuilder: NicknameBuildable
    private var nicknameRouter: NicknameRouting?

    init(
      interactor: AgreementInteractable,
      viewController: AgreementViewControllable,
      nicknameBuilder: NicknameBuildable
    ) {
        self.nicknameBuilder = nicknameBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachNicknameRIB() {
        guard self.nicknameRouter == nil else { return }
        let router = nicknameBuilder.build(
            with: NicknameBuildDependency(
                listener: interactor
            )
        )
        self.nicknameRouter = router
        attachChild(router)
        viewController.pushViewController(router.viewControllable, animated: false)
    }
    
    func detachNicknameRIB() {
        guard let router = nicknameRouter else { return }
        detachChild(router)
        viewControllable.pop(router.viewControllable)
    }
}
