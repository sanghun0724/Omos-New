//
//  LoggedInRouter.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs

import TodayFeatureInterface
import SignUpFeatureInterface
import LoggedInFeatureInterface

// MARK: - LoggedInInteractable

protocol LoggedInInteractable: Interactable, TodayListener, SignUpListener {
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
    
    private let signUpBuilder: SignUpBuildable
    private var signUpRouter: SignUpRouting?
    
    // MARK: - initialization * Deinitialization
    
    init(todayBuilder: TodayBuildable,
         signUpBuilder: SignUpBuildable,
        interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable) {
        self.todayBuilder = todayBuilder
        self.signUpBuilder = signUpBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachFindRIB() {
    
    }
    
    func detachFindRIB() {
        
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
    
    func attachTodayRIB() {
        guard self.todayRouter == nil else { return }
        let router = self.todayBuilder.build(
            with: TodayBuildDependency(
                listener: interactor
            )
        )
        self.todayRouter = router
        attachChild(router)
        viewController.push(viewController: router.viewControllable)
    }
    
    func detachTodayRIB() {
        
    }

}
