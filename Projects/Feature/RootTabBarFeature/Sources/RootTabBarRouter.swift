//
//  RootTabBarRouter.swift
//  RootTabBarFeature
//
//  Created by 이상헌 on 2023/07/23.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

import DesignSystem
import TodayFeatureInterface
import RootTabBarFeatureInterface

// MARK: - RootTabBarInteractable

protocol RootTabBarInteractable: Interactable, TodayListener {
    var router: RootTabBarRouting? { get set }
    var listener: RootTabBarListener? { get set }
}

// MARK: - RootTabBarRouter

final class RootTabBarRouter:
  ViewableRouter<RootTabBarInteractable, RootTabBarViewControllable>,
  RootTabBarRouting
{
    private let todayBuilder: TodayBuildable
    private var todayRouter: TodayRouting?
    
    init(
      interactor: RootTabBarInteractable,
      viewController: RootTabBarViewControllable,
      todayBuilder: TodayBuildable
    ) {
        self.todayBuilder = todayBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTabs() {
        let todayRouter = todayBuilder.build(
            with: TodayBuildDependency(
                listener: interactor
            )
        )
        
        attachChild(todayRouter)
        
        let viewControllers = [
            NavigationControllerable(root: todayRouter.viewControllable)
        ]
        
        viewController.setViewControllers(viewControllers)
    }
    
}
