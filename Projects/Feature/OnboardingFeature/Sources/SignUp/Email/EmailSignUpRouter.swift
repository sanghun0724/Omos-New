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

protocol EmailSignUpInteractable: Interactable, PasswordListener {
    var router: EmailSignUpRouting? { get set }
    var listener: EmailSignUpListener? { get set }
}

protocol EmailSignUpViewControllable: ViewControllable {}

// MARK: - SignUpRouter

final class EmailSignUpRouter:
  ViewableRouter<EmailSignUpInteractable, EmailSignUpViewControllable>,
  EmailSignUpRouting
{
    private let passwordBuilder: PasswordBuildable
    private var passwordRouter: PasswordRouting?

    init(
      passwordBuilder: PasswordBuildable,
      interactor: EmailSignUpInteractable,
      viewController: EmailSignUpViewControllable
    ) {
        self.passwordBuilder = passwordBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachPasswordRIB() {
        guard self.passwordRouter == nil else { return }
        let router = self.passwordBuilder.build(
            with: PasswordBuildDependency(
                listener: interactor
            )
        )
        self.passwordRouter = router
        attachChild(router)
        viewController.push(viewController: router.viewControllable)
    }
    
    func detachPasswordRIB() {
        log.warning("detachNicknameRIB")
    }
}
