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

protocol PasswordInteractable: Interactable, NicknameListener {
    var router: PasswordRouting? { get set }
    var listener: PasswordListener? { get set }
}

protocol PasswordViewControllable: ViewControllable {}

// MARK: - PasswordRouter

final class PasswordRouter:
  ViewableRouter<PasswordInteractable, PasswordViewControllable>,
  PasswordRouting
{
    
    private let nicknameBuilder: NicknameBuildable
    private var nicknameRouter: NicknameRouting?

     init(
      interactor: PasswordInteractable,
      viewController: PasswordViewControllable,
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
        guard self.nicknameRouter != nil else { return }
        
    }
}
