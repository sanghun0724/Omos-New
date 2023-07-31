//
//  MyPageBuilder.swift
//  MyPageFeature
//
//  Created by 이상헌 on 2023/07/31.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

import MyPageFeatureInterface

// MARK: - MyPageDependency

protocol MyPageDependency: NeedleFoundation.Dependency {}

// MARK: - MyPageComponent

final class MyPageComponent: NeedleFoundation.Component<MyPageDependency> {
    fileprivate var initialState: MyPagePresentableState {
        MyPagePresentableState()
    }
}

// MARK: - MyPageBuilder

final class MyPageBuilder:
    ComponentizedBuilder<MyPageComponent, MyPageRouting, MyPageBuildDependency, Void>,
    MyPageBuildable
{

    override func build(
      with component: MyPageComponent,
      _ payload: MyPageBuildDependency
    ) -> MyPageRouting {
        let viewController = MyPageViewController()
        let interactor = MyPageInteractor(presenter: viewController, initialState: component.initialState)
        
        interactor.listener = payload.listener
        return MyPageRouter(interactor: interactor, viewController: viewController)
    }
}
