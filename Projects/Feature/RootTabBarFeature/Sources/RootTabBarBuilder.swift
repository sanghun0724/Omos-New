//
//  RootTabBarBuilder.swift
//  RootTabBarFeature
//
//  Created by 이상헌 on 2023/07/23.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

import DesignSystem
import TodayFeatureInterface
import TodayFeature
import RootTabBarFeatureInterface

// MARK: - RootTabBarDependency

public protocol RootTabBarDependency: NeedleFoundation.Dependency {

}

// MARK: - RootTabBarComponent

public final class RootTabBarComponent: NeedleFoundation.Component<RootTabBarDependency> {
    var todayBuilder: TodayBuildable {
        TodayBuilder {
            TodayComponent(parent: self)
        }
    }
}

// MARK: - RootTabBarBuilder

public final class RootTabBarBuilder:
    ComponentizedBuilder<RootTabBarComponent, RootTabBarRouting, RootTabBarBuildDependency, Void>,
    RootTabBarBuildable
{

    public override func build(
      with component: RootTabBarComponent,
      _ payload: RootTabBarBuildDependency
    ) -> RootTabBarRouting {
        let viewController = RootTabBarController()
        let interactor = RootTabBarInteractor(presenter: viewController)
        
        interactor.listener = payload.listener
        return RootTabBarRouter(
            interactor: interactor,
            viewController: viewController,
            todayBuilder: component.todayBuilder
        )
    }
}
