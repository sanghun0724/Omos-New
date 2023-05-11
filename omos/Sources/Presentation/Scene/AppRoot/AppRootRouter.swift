//
//  AppRootRouter.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs

protocol AppRootInteractable: Interactable, LoggedInListener, LoggedOutListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {

    private let loggedOutBuilder: LoggedOutBuildable
    private let loggedInBuilder: LoggedInBuildable
    
    private var loggedOutRouting: ViewableRouting?
    private var loggedInRouting: ViewableRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        loggeddOutBuilder: LoggedOutBuildable,
        loggedInBuilder: LoggedInBuildable
    ) {
        self.loggedOutBuilder = loggeddOutBuilder
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
        
        let router = loggedInBuilder.build(withListener: interactor)
        self.loggedInRouting = router
        attachChild(router)
        let navigation = NavigationControllerable(root: router.viewControllable)
        viewController.presentFullScreen(navigation, animated: false, completion: nil)
    }
    
    func attachLoggedOut() {
        if loggedOutRouting != nil {
            return
        }
        
        let router = loggedOutBuilder.build(withListener: interactor)
        self.loggedOutRouting = router
        attachChild(router)
        viewController.presentFullScreen(router.viewControllable, animated: false, completion: nil)
    }
}
