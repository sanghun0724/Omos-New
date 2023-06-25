//
//  NicknameRouter.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import RIBs

import OnboardingFeatureInterface

// MARK: - NicknameInteractable

protocol NicknameInteractable: Interactable {
    var router: NicknameRouting? { get set }
    var listener: NicknameListener? { get set }
}

protocol NicknameViewControllable: ViewControllable {}

// MARK: - NicknameRouter

final class NicknameRouter:
  ViewableRouter<NicknameInteractable, NicknameViewControllable>,
  NicknameRouting
{

    override init(
      interactor: NicknameInteractable,
      viewController: NicknameViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTodayRIB() {
        
    }
    
    func detachTodayRIB() {
        
    }
}
