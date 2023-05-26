//
//  TodayInteractor.swift
//  omos
//
//  Created by sangheon on 2023/05/23.
//

import ReactorKit
import RIBs
import RxSwift

// MARK: - TodayRouting

protocol TodayRouting: ViewableRouting {
    
}

// MARK: - TodayPresentable

protocol TodayPresentable: Presentable {
    var listener: TodayPresentableListener? { get set }
}

// MARK: - TodayListener

protocol TodayListener: AnyObject {}

// MARK: - TodayInteractor

final class TodayInteractor:
    PresentableInteractor<TodayPresentable>,
    TodayInteractable,
    TodayPresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = TodayPresentableAction
    typealias State = TodayPresentableState
    
    enum Mutation {
        
    }
    
    // MARK: - Properties
    
    weak var router: TodayRouting?
    weak var listener: TodayListener?
    
    let initialState: TodayPresentableState
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: TodayPresentable,
        initialState: TodayPresentableState
    ) {
        self.initialState = initialState
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - TodayPresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

// MARK: - mutate

extension TodayInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
}

// MARK: - reduce

extension TodayInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
