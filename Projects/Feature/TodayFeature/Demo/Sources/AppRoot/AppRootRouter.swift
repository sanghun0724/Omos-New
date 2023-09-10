//
//  AppRootRouter.swift
//  RootTabBarFeatureDemoApp
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

import TodayFeatureInterface

// MARK: - AppRootInteractable

protocol AppRootInteractable: Interactable, TodayListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {}

// MARK: - AppRootRouter

final class AppRootRouter:
  LaunchRouter<AppRootInteractable, AppRootViewControllable>,
  AppRootRouting
{
    private let todayBuilder: TodayBuildable
    private var todayRouting: TodayRouting?

    init(
      interactor: AppRootInteractable,
      viewController: AppRootViewControllable,
      todayBuilder: TodayBuildable
    ) {
        self.todayBuilder = todayBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTodayRIB() {
        guard todayRouting == nil else { return }
        let router = todayBuilder.build(
            with: TodayBuildDependency(
                listener: interactor
            )
        )
        todayRouting = router
        attachChild(router)
        viewController.presentFullScreen(router.viewControllable, animated: false, completion: nil)
    }
    
}
