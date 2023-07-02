//
//  OnboardingStateAction.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/06/25.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

import RxSwift

import CoreKit
import AppFoundation
import DesignSystem

// MARK: - OnboardingPresentableState

struct OnboardingPresentableState: Equatable, HasLoadingState, HasErrorState {
    var revision = 0
    var isLoading = false
    var myError = ReactorValue<MyError>(revision: 0, value: MyError.noError)
}

// MARK: - OnboardingPresentableAction

enum OnboardingPresentableAction {
    case didTapKakaoLoggedInButton
    case didTapAppleLoggedInButton(email: String)
    case didTapEmailSingUpButton
    case didTapEmailLoggedInButton
}

// MARK: - OnboardingPresentableListener

protocol OnboardingPresentableListener: AnyObject, HasLoadingStream, HasErrorStream {
    typealias Action = OnboardingPresentableAction
    typealias State = OnboardingPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
