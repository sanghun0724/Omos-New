//
//  PasswordStateAction.swift
//  OnboardingFeature
//
//  Created by 이상헌 on 2023/07/06.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

// MARK: - PasswordPresentableState

struct PasswordPresentableState {
    
}

// MARK: - AgreementPresentableAction

enum PasswordPresentableAction {
    
}

// MARK: - PasswordPresentableListener

protocol PasswordPresentableListener: AnyObject {
    typealias Action = PasswordPresentableAction
    typealias State = PasswordPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
