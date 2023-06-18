//
//  SignUpRouter.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import RIBs

import AppFoundation
import DesignSystem
import GlobalThirdPartyLibrary
import SignUpFeatureInterface

// MARK: - SignUpInteractable

protocol SignUpInteractable: Interactable, NicknameListener {
    var router: SignUpRouting? { get set }
    var listener: SignUpListener? { get set }
}

protocol SignUpViewControllable: ViewControllable {}

// MARK: - SignUpRouter

final class SignUpRouter:
  ViewableRouter<SignUpInteractable, SignUpViewControllable>,
  SignUpRouting
{
    private let nicknameBuilder: NicknameBuildable
    private var nicknameRouter: NicknameRouting?

    init(
      nicknameBuilder: NicknameBuildable,
      interactor: SignUpInteractable,
      viewController: SignUpViewControllable
    ) {
        self.nicknameBuilder = nicknameBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachNicknameRIB() {
        guard self.nicknameRouter == nil else { return }
        let router = self.nicknameBuilder.build(
            with: NicknameBuildDependency(
                listener: interactor
            )
        )
        self.nicknameRouter = router
        attachChild(router)
        viewController.push(viewController: router.viewControllable)
    }
    
    func detachNicknameRIB() {
        log.warning("detachNicknameRIB")
    }
}
