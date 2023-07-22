//
//  NicknameRouter.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import RIBs

import DesignSystem
import OnboardingFeatureInterface
import TodayFeatureInterface

// MARK: - NicknameInteractable

protocol NicknameInteractable: Interactable, TodayListener {
    var router: NicknameRouting? { get set }
    var listener: NicknameListener? { get set }
}

protocol NicknameViewControllable: ViewControllable {}

// MARK: - NicknameRouter

final class NicknameRouter:
  ViewableRouter<NicknameInteractable, NicknameViewControllable>,
  NicknameRouting
{
    private let todayBuilder: TodayBuildable
    private var todayRouter: TodayRouting?

    init(
      interactor: NicknameInteractable,
      viewController: NicknameViewControllable,
      todayBuilder: TodayBuildable
    ) {
        self.todayBuilder = todayBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTodayRIB() {
        guard todayRouter == nil else { return }
        let router = todayBuilder.build(
            with: TodayBuildDependency(
                listener: interactor
            )
        )
        //attachChild(router)
        //let navigation = NavigationControllerable(root: router.viewControllable) // should tabbar
        
    }
    
    func detachTodayRIB() {
        guard let router = todayRouter else { return }
        detachChild(router)
        
    }
}
