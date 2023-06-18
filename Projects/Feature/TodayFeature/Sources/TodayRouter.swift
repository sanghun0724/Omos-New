//
//  TodayRouter.swift
//  omos
//
//  Created by sangheon on 2023/05/23.
//

import RIBs

import TodayFeatureInterface

// MARK: - TodayInteractable

protocol TodayInteractable: Interactable {
    var router: TodayRouting? { get set }
    var listener: TodayListener? { get set }
}

protocol TodayViewControllable: ViewControllable {}

// MARK: - TodayRouter

final class TodayRouter:
    ViewableRouter<TodayInteractable, TodayViewControllable>,
    TodayRouting
    {

    override init(
      interactor: TodayInteractable,
      viewController: TodayViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
