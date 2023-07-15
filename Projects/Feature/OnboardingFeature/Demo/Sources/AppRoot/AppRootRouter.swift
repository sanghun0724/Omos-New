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

protocol AppRootInteractable: Interactable, OnboardingListener, TodayListener, PasswordListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let onboardingBuilder: OnboardingBuildable
    private var onboardingRouting: OnboardingRouting?
    
    private let passwordBuilder: PasswordBuildable
    private var passwordRouting: PasswordRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        onboardingBuilder: OnboardingBuildable,
        passwordBuilder: PasswordBuildable
    ) {
        self.onboardingBuilder = onboardingBuilder
        self.passwordBuilder = passwordBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        
    }
    
    func attachOnboardingRIB() {
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
    
    func attachPasswordRIB() {
        if passwordRouting != nil {
            return
        }
        
        let router = passwordBuilder.build(
            with: PasswordBuildDependency(
                listener: interactor
            )
        )
        self.passwordRouting = router
        attachChild(router)
        let navigation = NavigationControllerable(root: router.viewControllable)
        viewController.presentFullScreen(navigation, animated: false, completion: nil)
    }
}
