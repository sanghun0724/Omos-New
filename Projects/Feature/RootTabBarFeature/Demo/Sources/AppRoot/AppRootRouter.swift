//
//  AppRootRouter.swift
//  RootTabBarFeatureDemoApp
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

import RootTabBarFeatureInterface

// MARK: - AppRootInteractable

protocol AppRootInteractable: Interactable, RootTabBarListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {}

// MARK: - AppRootRouter

final class AppRootRouter:
  LaunchRouter<AppRootInteractable, AppRootViewControllable>,
  AppRootRouting
{
    private let rootTabBarBuilder: RootTabBarBuildable
    private var rootTabBarRouter: RootTabBarRouting?

    init(
      interactor: AppRootInteractable,
      viewController: AppRootViewControllable,
      rootTabBarBuilder: RootTabBarBuildable
    ) {
        self.rootTabBarBuilder = rootTabBarBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachRootTabBarRIB() {
        guard rootTabBarRouter == nil else { return }
        let router = rootTabBarBuilder.build(
            with: RootTabBarBuildDependency(
                listener: interactor
            )
        )
        rootTabBarRouter = router
        attachChild(router)
        viewController.presentFullScreen(router.viewControllable, animated: false, completion: nil)
    }
    
}
