//
//  AgreementStateAction.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

struct AgreementPresentableState {
    var isAllAgreeCheckBoxSelected = false
    var isServiceCheckBoxSelected = false
    var isPrivacyCheckBoxSelected = false
    var isConfirmButtonEnable = false
    var openWebLink = String()
}

// MARK: - AgreementPresentableAction

enum AgreementPresentableAction {
    case allAgreeCheckButtonDidTap(Bool)
    case serviceCheckButtonDidTap(Bool)
    case privacyCheckButtonDidTap(Bool)
    case serviceAccessoryButtonDidTap
    case privacyAccessoryButtonDidTap
    case confirmButtonDidTap(Bool)
}

// MARK: - AgreementPresentableListener

protocol AgreementPresentableListener: AnyObject {
    typealias Action = AgreementPresentableAction
    typealias State = AgreementPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
