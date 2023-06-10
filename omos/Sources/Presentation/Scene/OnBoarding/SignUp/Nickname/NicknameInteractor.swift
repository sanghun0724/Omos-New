//
//  NicknameInteractor.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import ReactorKit
import RIBs
import RxSwift

// MARK: - NicknameRouting

protocol NicknameRouting: ViewableRouting {
    
}

// MARK: - NicknamePresentable

protocol NicknamePresentable: Presentable {
    var listener: NicknamePresentableListener? { get set }
}

// MARK: - NicknameListener

protocol NicknameListener: AnyObject {}

// MARK: - NicknameInteractor

final class NicknameInteractor:
    PresentableInteractor<NicknamePresentable>,
    NicknameInteractable,
    NicknamePresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = NicknamePresentableAction
    typealias State = NicknamePresentableState
    
    enum Mutation {
        
    }
    
    // MARK: - Properties
    
    weak var router: NicknameRouting?
    weak var listener: NicknameListener?
    
    let initialState: NicknamePresentableState
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: NicknamePresentable,
        initialState: NicknamePresentableState
    ) {
        self.initialState = initialState
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - NicknamePresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

// MARK: - mutate

extension NicknameInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
}

// MARK: - reduce

extension NicknameInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
