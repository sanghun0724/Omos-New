//
//  SignUpRouter.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import RIBs

import AppFoundation
import DesignSystem
import GlobalThirdPartyLibrary
import OnboardingFeatureInterface

// MARK: - SignUpInteractable

protocol EmailSignUpInteractable: Interactable, NicknameListener {
    var router: EmailSignUpRouting? { get set }
    var listener: EmailSignUpListener? { get set }
}

protocol EmailSignUpViewControllable: ViewControllable {}

// MARK: - SignUpRouter

final class EmailSignUpRouter:
  ViewableRouter<EmailSignUpInteractable, EmailSignUpViewControllable>,
  EmailSignUpRouting
{
    private let nicknameBuilder: NicknameBuildable
    private var nicknameRouter: NicknameRouting?

    init(
      nicknameBuilder: NicknameBuildable,
      interactor: EmailSignUpInteractable,
      viewController: EmailSignUpViewControllable
    ) {
        self.nicknameBuilder = nicknameBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachPasswordRIB() {
        guard self.nicknameRouter == nil else { return }
        let router = self.nicknameBuilder.build(
            with: NicknameBuildDependency(
                listener: interactor
            )
        )
        self.nicknameRouter = router
        attachChild(router)
        viewController.push(viewController: router.viewControllable)
    }
    
    func detachPasswordRIB() {
        log.warning("detachNicknameRIB")
    }
}
