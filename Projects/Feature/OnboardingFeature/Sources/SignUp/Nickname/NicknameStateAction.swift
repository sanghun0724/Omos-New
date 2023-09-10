//
//  NicknameStateAction.swift
//  SignUpFeature
//
//  Created by sangheon on 2023/06/18.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

import AppFoundation
import DesignSystem

// MARK: - NicknamePresentableState

struct NicknamePresentableState: HasLoadingState, HasErrorState {
    var revision = 0
    var isLoading: Bool = false
    var myError: ReactorValue<MyError> = .init()
    var isValidNicknameFormat = false
}

// MARK: - NicknamePresentableAction

enum NicknamePresentableAction {
    case nicknameTextFieldDidChange(nickname: String)
    case confirmButtonDidTap
    case detach
}

// MARK: - NicknamePresentableListener

protocol NicknamePresentableListener: AnyObject, HasLoadingStream, HasErrorStream {
    typealias Action = NicknamePresentableAction
    typealias State = NicknamePresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
