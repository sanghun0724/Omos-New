//
//  AppRootRouter.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs

import DesignSystem
import OnboardingFeatureInterface
import RootTabBarFeatureInterface

protocol AppRootInteractable: Interactable, OnboardingListener, RootTabBarListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let onboardingBuilder: OnboardingBuildable
    private var onboardingRouting: OnboardingRouting?
    
    private let rootTabBarBuilder: RootTabBarBuildable
    private var rootTabBarRouting: RootTabBarRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        onboardingBuilder: OnboardingBuildable,
        rootTabBarBuilder: RootTabBarBuildable
    ) {
        self.onboardingBuilder = onboardingBuilder
        self.rootTabBarBuilder = rootTabBarBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        
    }
    
    func attachOnboarding() {
        if onboardingRouting != nil {
            return
        }
        
        let router = onboardingBuilder.build(
            with: OnboardingBuildDependency(
                listener: interactor
            )
        )
        self.onboardingRouting = router
        attachChild(router)
        let navigation = NavigationControllerable(root: router.viewControllable)
        viewController.presentFullScreen(navigation, animated: false, completion: nil)
    }
    
    func attachRootTabBar() {
        if rootTabBarRouting != nil {
            return
        }
        
        let router = rootTabBarBuilder.build(
            with: RootTabBarBuildDependency(
                listener: interactor)
        )
        self.rootTabBarRouting = router
        attachChild(router)
        let navigation = NavigationControllerable(root: router.viewControllable)
        viewController.presentFullScreen(navigation, animated: false, completion: nil)
    }
}
