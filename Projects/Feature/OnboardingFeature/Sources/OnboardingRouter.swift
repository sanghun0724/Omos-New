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

protocol OnboardingInteractable: Interactable, SignUpListener, LoggedInListener {
    var router: OnboardingRouting? { get set }
    var listener: OnboardingListener? { get set }
}

protocol OnboardingViewControllable: ViewControllable {}

// MARK: - OnboardingRouter

final class OnboardingRouter:
  ViewableRouter<OnboardingInteractable, OnboardingViewControllable>,
  OnboardingRouting
{
    private let signUpBuilder: SignUpBuildable
    private var signUpRouter: SignUpRouting?
    
    private let loggedInBuilder: LoggedInBuildable
    private var loggedInRouter: LoggedInRouting?
    
    init(
      interactor: OnboardingInteractable,
      signUpBuilder: SignUpBuildable,
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
            with: SignUpBuildDependency(
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
