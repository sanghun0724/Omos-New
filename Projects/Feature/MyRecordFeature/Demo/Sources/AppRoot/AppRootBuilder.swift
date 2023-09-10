//
//  AppRootBuilder.swift
//  RootTabBarFeatureDemoApp
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

import RootTabBarFeature
import RootTabBarFeatureInterface

// MARK: - AppRootDependency

protocol AppRootDependency: NeedleFoundation.Dependency {
}

// MARK: - AppRootBuildDependency

struct AppRootBuildDependency {
    let listener: AppRootListener
}

// MARK: - AppRootComponent

final class AppRootComponent: NeedleFoundation.Component<AppRootDependency> {
}

// MARK: - AppRootBuildable

protocol AppRootBuildable: Buildable {
    func build() -> LaunchRouting
}

// MARK: - AppRootBuilder

final class AppRootBuilder:
    SimpleComponentizedBuilder<AppRootComponent, LaunchRouting>,
    AppRootBuildable
{

    override func build(
      with component: AppRootComponent
    ) -> LaunchRouting {
        let viewController = AppRootViewController()
        let interactor = AppRootInteractor(presenter: viewController)
        
        return AppRootRouter(
            interactor: interactor,
            viewController: viewController,
            rootTabBarBuilder: component.rootTabBarBuilder
        )
    }
}
