//
//  LoggedInRouter.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs

import TodayFeatureInterface
import OnboardingFeatureInterface

// MARK: - LoggedInInteractable

protocol LoggedInInteractable: Interactable, TodayListener, EmailSignUpListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LoggedInRouter:
    ViewableRouter<LoggedInInteractable, LoggedInViewControllable>,
    LoggedInRouting
{
    
    private let todayBuilder: TodayBuildable
    private var todayRouter: TodayRouting?
    
    private let emailSignUpBuilder: EmailSignUpBuildable
    private var emailSignUpRouter: EmailSignUpRouting?
    
    // MARK: - initialization * Deinitialization
    
    init(
        todayBuilder: TodayBuildable,
         emailSignUpBuilder: EmailSignUpBuildable,
        interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable
    ) {
        self.todayBuilder = todayBuilder
        self.emailSignUpBuilder = emailSignUpBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachFindRIB() {
    
    }
    
    func detachFindRIB() {
        
    }
    
    func attachSignUpRIB() {
        guard self.emailSignUpRouter == nil else { return }
        let router = self.emailSignUpBuilder.build(
            with: EmailSignUpBuildDependency(
                listener: interactor
            )
        )
        self.emailSignUpRouter = router
        attachChild(router)
        viewController.push(viewController: router.viewControllable)
    }
    
    func detachSignUpRIB() {
        guard let router = emailSignUpRouter else { return }
        self.emailSignUpRouter = nil
        detachChild(router)
        viewController.pop(router.viewControllable)
    }
    
    func attachRootTabBarRIB() {
        
    }

}
