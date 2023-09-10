//
//  LoggedInRouter.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs

import RootTabBarFeatureInterface
import OnboardingFeatureInterface


// MARK: - LoggedInInteractable

protocol LoggedInInteractable: Interactable, RootTabBarListener, EmailSignUpListener {
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
    
    private let rootTabBarBuilder: RootTabBarBuildable
    private var rootTabBarRouter: RootTabBarRouting?
    
    private let emailSignUpBuilder: EmailSignUpBuildable
    private var emailSignUpRouter: EmailSignUpRouting?
    
    // MARK: - initialization * Deinitialization
    
    init(
        rootTabBarBuilder: RootTabBarBuildable,
         emailSignUpBuilder: EmailSignUpBuildable,
        interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable
    ) {
        self.rootTabBarBuilder = rootTabBarBuilder
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
