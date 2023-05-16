//
//  LoggedInInteractor.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import ReactorKit
import RIBs
import RxSwift

protocol LoggedInRouting: ViewableRouting {
  
}

// MARK: - LoggedInPresentable

protocol LoggedInPresentable: Presentable {
    var listener: LoggedInPresentableListener? { get set }
}

// MARK: - LoggedInListener

protocol LoggedInListener: AnyObject {
   
}

// MARK: - LgogedInInteractor

final class LoggedInInteractor:
    PresentableInteractor<LoggedInPresentable>,
    LoggedInInteractable,
    LoggedInPresentableListener,
    Reactor
{
    
    var initialState: LoggedInPresentableState
    
    // MARK: - Reactor
    
    typealias Action = LoggedInPresentableAction
    typealias State = LoggedInPresentableState
    
    enum Mutation {
        case detach 
    }
    
    // MARK: - Properties
    
    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?

    
    // MARK: Initializition & Deinitialization
    
    init(
        presenter: LoggedInPresentable,
        initialState: LoggedInPresentableState
    ) {
        self.initialState = initialState
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    deinit {
        Log.verbose(type(of: self))
    }

}

// MARK: - Reactor

extension LoggedInInteractor {
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
    
    // MARK: - mutate
    
    func mutate(action: LoggedInPresentableAction) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad: return .empty()
        case .localLoginButtonDidTap: return .empty()
        case .kakaoLoginButtonDidTap: return .empty()
        case .appleLoginButtonDidTap: return .empty()
        }
    }
    
    
}
