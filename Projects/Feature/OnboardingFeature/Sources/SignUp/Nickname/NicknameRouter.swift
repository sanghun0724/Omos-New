//
//  NicknameRouter.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import RIBs

import DesignSystem
import OnboardingFeatureInterface
import RootTabBarFeatureInterface

// MARK: - NicknameInteractable

protocol NicknameInteractable: Interactable, RootTabBarListener {
    var router: NicknameRouting? { get set }
    var listener: NicknameListener? { get set }
}

protocol NicknameViewControllable: ViewControllable {}

// MARK: - NicknameRouter

final class NicknameRouter:
  ViewableRouter<NicknameInteractable, NicknameViewControllable>,
  NicknameRouting
{
    private let rootTabBarBuilder: RootTabBarBuildable
    private var rootTabBarRouter: RootTabBarRouting?

    init(
      interactor: NicknameInteractable,
      viewController: NicknameViewControllable,
      rootTabBarBuilder: RootTabBarBuildable
    ) {
        self.rootTabBarBuilder = rootTabBarBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachRootTabBarRIB() {
        guard rootTabBarRouter == nil else { return }
        let router = rootTabBarBuilder.build(
            with: RootTabBarBuildDependency(
                listener: interactor
            )
        )
        attachChild(router) // 없어도 되는지 확인
        viewController.presentFullScreen(router.viewControllable, animated: false, completion: nil)
    }
    
    func detachRootTabBarRIB() {
   
        
    }
}
