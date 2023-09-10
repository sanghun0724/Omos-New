//
//  AppRootRouter.swift
//  RootTabBarFeatureDemoApp
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

// MARK: - AppRootInteractable

protocol AppRootInteractable: Interactable {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {}

// MARK: - AppRootRouter

final class AppRootRouter:
  LaunchRouter<AppRootInteractable, AppRootViewControllable>,
  AppRootRouting
{

     override init(
      interactor: AppRootInteractable,
      viewController: AppRootViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
}
