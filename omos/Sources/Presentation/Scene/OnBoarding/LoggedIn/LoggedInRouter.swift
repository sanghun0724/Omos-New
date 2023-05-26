//
//  LoggedInRouter.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs

// MARK: - LoggedInInteractable

protocol LoggedInInteractable: Interactable, TodayListener {
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
    
    // MARK: - initialization * Deinitialization
    
    init(todayBuilder: TodayBuildable,
        interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable) {
        self.todayBuilder = todayBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachSignUpRIB() {
        
    }
    
    func detachSignUpRIB() {
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
    
    func attachTodayRIB() {
        
    }
    
    func detachTodayRIB() {
        
    }

}
