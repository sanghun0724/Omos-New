//
//  OnboardingRouter.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/06/25.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

import OnboardingFeatureInterface

// MARK: - OnboardingInteractable

protocol OnboardingInteractable: Interactable, EmailSignUpListener, LoggedInListener {
    var router: OnboardingRouting? { get set }
    var listener: OnboardingListener? { get set }
}

protocol OnboardingViewControllable: ViewControllable {}

// MARK: - OnboardingRouter

final class OnboardingRouter:
  ViewableRouter<OnboardingInteractable, OnboardingViewControllable>,
  OnboardingRouting
{
    private let signUpBuilder: EmailSignUpBuildable
    private var signUpRouter: EmailSignUpRouting?
    
    private let loggedInBuilder: LoggedInBuildable
    private var loggedInRouter: LoggedInRouting?
    
    init(
      interactor: OnboardingInteractable,
      signUpBuilder: EmailSignUpBuildable,
      loggedInBuilder: LoggedInBuildable,
      viewController: OnboardingViewControllable
    ) {
        self.signUpBuilder = signUpBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachSignUpRIB() {
        guard self.signUpRouter == nil else { return }
        let router = self.signUpBuilder.build(
            with: EmailSignUpBuildDependency(
                listener: interactor
            )
        )
        self.signUpRouter = router
        attachChild(router)
        viewController.push(viewController: router.viewControllable)
    }
    
    func detachSignUpRIB() {
        guard let router = signUpRouter else { return }
        self.signUpRouter = nil
        detachChild(router)
        viewController.pop(router.viewControllable)
    }
    
    func attachLoggedInRIB() {
        guard self.loggedInRouter == nil else { return }
        let router = self.loggedInBuilder.build(
            with: LoggedInBuildDependency(
                listener: interactor
            )
        )
        attachChild(router)
        viewController.push(viewController: router.viewControllable)
    }
    
    func detachLoggedInRIB() {
        guard let router = loggedInRouter else { return }
        self.loggedInRouter = nil
        detachChild(router)
        viewController.pop(router.viewControllable)
    }
}
