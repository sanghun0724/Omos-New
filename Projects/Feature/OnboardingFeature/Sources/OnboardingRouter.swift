//
//  OnboardingRouter.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/06/25.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

import OnboardingFeatureInterface
import RootTabBarFeatureInterface

// MARK: - OnboardingInteractable

protocol OnboardingInteractable: Interactable, EmailSignUpListener, LoggedInListener, AgreementListener, RootTabBarListener {
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
    
    private let agreementBuilder: AgreementBuildable
    private var agreementRouter: AgreementRouting?
    
    private let rootTabBarBuilder: RootTabBarBuildable
    private var rootTabBarRouter: RootTabBarRouting?
    
    init(
      interactor: OnboardingInteractable,
      viewController: OnboardingViewControllable,
      signUpBuilder: EmailSignUpBuildable,
      loggedInBuilder: LoggedInBuildable,
      agreementBuilder: AgreementBuildable,
      rootTabBarBuilder: RootTabBarBuildable
    ) {
        self.signUpBuilder = signUpBuilder
        self.loggedInBuilder = loggedInBuilder
        self.agreementBuilder = agreementBuilder
        self.rootTabBarBuilder = rootTabBarBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachEmailSignUpRIB() {
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
    
    func detachEmailSignUpRIB() {
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
    
    func attachAgreewmentRIB() {
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
    
    func attachRootTabBarRIB() {
        guard self.rootTabBarRouter == nil else { return }
        let router = rootTabBarBuilder.build(
            with: RootTabBarBuildDependency(
                listener: interactor
            )
        )
        attachChild(router)
        viewController.presentFullScreen(router.viewControllable, animated: false, completion: nil)
    }
    
}
