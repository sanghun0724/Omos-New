//
//  SignUpRouter.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import RIBs

// MARK: - SignUpInteractable

protocol SignUpInteractable: Interactable {
    var router: SignUpRouting? { get set }
    var listener: SignUpListener? { get set }
}

protocol SignUpViewControllable: ViewControllable {}

// MARK: - SignUpRouter

final class SignUpRouter:
  ViewableRouter<SignUpInteractable, SignUpViewControllable>,
  SignUpRouting
{

    override init(
      interactor: SignUpInteractable,
      viewController: SignUpViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
