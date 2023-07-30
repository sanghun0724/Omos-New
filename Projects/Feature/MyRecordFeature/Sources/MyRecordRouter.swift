//
//  MyRecordRouter.swift
//  MyRecordFeature
//
//  Created by 이상헌 on 2023/07/29.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

// MARK: - MyRecordInteractable

protocol MyRecordInteractable: Interactable {
    var router: MyRecordRouting? { get set }
    var listener: MyRecordListener? { get set }
}

protocol MyRecordViewControllable: ViewControllable {}

// MARK: - MyRecordRouter

final class MyRecordRouter:
  ViewableRouter<MyRecordInteractable, MyRecordViewControllable>,
  MyRecordRouting
{

    override init(
      interactor: MyRecordInteractable,
      viewController: MyRecordViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
