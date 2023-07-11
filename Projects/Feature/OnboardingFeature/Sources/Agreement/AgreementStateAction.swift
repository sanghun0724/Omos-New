//
//  AgreementStateAction.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

struct AgreementPresentableState {
    
}

// MARK: - AgreementPresentableAction

enum AgreementPresentableAction {
    
}

// MARK: - AgreementPresentableListener

protocol AgreementPresentableListener: AnyObject {
    typealias Action = AgreementPresentableAction
    typealias State = AgreementPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
