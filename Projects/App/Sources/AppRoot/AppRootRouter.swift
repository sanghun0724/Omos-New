//
//  AppRootRouter.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs

import DesignSystem
import LoggedInFeatureInterface

protocol AppRootInteractable: Interactable, LoggedInListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let loggedInBuilder: LoggedInBuildable
    
    private var loggedInRouting: ViewableRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        loggedInBuilder: LoggedInBuildable
    ) {
        self.loggedInBuilder = loggedInBuilder
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
}
