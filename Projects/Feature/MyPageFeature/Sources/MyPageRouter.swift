//
//  MyPageRouter.swift
//  MyPageFeature
//
//  Created by 이상헌 on 2023/07/31.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

import MyPageFeatureInterface

// MARK: - MyPageInteractable

protocol MyPageInteractable: Interactable {
    var router: MyPageRouting? { get set }
    var listener: MyPageListener? { get set }
}

protocol MyPageViewControllable: ViewControllable {}

// MARK: - MyPageRouter

final class MyPageRouter:
  ViewableRouter<MyPageInteractable, MyPageViewControllable>,
  MyPageRouting
{

    override init(
      interactor: MyPageInteractable,
      viewController: MyPageViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
