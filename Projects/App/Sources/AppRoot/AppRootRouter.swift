//
//  AppRootRouter.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs

import DesignSystem
import OnboardingFeatureInterface
import TodayFeatureInterface

protocol AppRootInteractable: Interactable, LoggedInListener, TodayListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let loggedInBuilder: LoggedInBuildable
    private let todayBuilder: TodayBuildable
    
    private var loggedInRouting: ViewableRouting?
    private var todayRouting: TodayRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        loggedInBuilder: LoggedInBuildable,
        todayBuilder: TodayBuildable
    ) {
        self.loggedInBuilder = loggedInBuilder
        self.todayBuilder = todayBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        
    }
    
    func attachLoggedIn() {
        if loggedInRouting != nil {
            return
        }
        
        let router = loggedInBuilder.build(
            with: LoggedInBuildDependency(
                listener: interactor))
        self.loggedInRouting = router
        attachChild(router)
        let navigation = NavigationControllerable(root: router.viewControllable)
        viewController.presentFullScreen(navigation, animated: false, completion: nil)
    }
    
    func attachToday() {
        if todayRouting != nil {
            return
        }
        
        let router = todayBuilder.build(
            with: TodayBuildDependency(
                listener: interactor)
        )
        self.todayRouting = router
        attachChild(router)
        let navigation = NavigationControllerable(root: router.viewControllable)
        viewController.presentFullScreen(navigation, animated: false, completion: nil)
    }
}
