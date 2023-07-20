//
//  AppRootInteractor.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import Foundation
import RIBs

protocol AppRootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func attachOnboardingRIB()
    func detachOnobardingRIB()
    
    func attachEmailSignUpRIB()
    func detachEmailSignUpRIB()
    
    func attachPasswordRIB()
    func detachPaswwordRIB()
    
    func attachAgreementRIB()
    func detachAgreementRIB()
    
    func attachNicknameRIB()
    func detachNicknameRIB()
}

protocol AppRootPresentable: Presentable {
    var listener: AppRootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AppRootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AppRootInteractor:
    PresentableInteractor<AppRootPresentable>,
    AppRootInteractable,
    AppRootPresentableListener
{
    
    weak var router: AppRootRouting?
    weak var listener: AppRootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AppRootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func attachRIB(type: DemoSingleRIBType) {
        switch type {
        case .처음_메인_온보딩_화면:
            self.router?.attachOnboardingRIB()
        case .이메일_회원가입:
            self.router?.attachEmailSignUpRIB()
        case .비밀번호_회원가입:
            self.router?.attachPasswordRIB()
        case .닉네임_회원가입:
            self.router?.attachNicknameRIB()
        case .약관동의:
            self.router?.attachAgreementRIB()
        }
    }
}
