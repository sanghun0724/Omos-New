//
//  MyRecordInteractor.swift
//  MyRecordFeature
//
//  Created by 이상헌 on 2023/07/29.
//  Copyright © 2023 Omos. All rights reserved.
//

import ReactorKit
import RIBs
import RxSwift

import BaseDomain
import RecordDomainInterface
import AppFoundation
import MyRecordFeatureInterface

// MARK: - MyRecordPresentable

protocol MyRecordPresentable: Presentable {
    var listener: MyRecordPresentableListener? { get set }
}

// MARK: - MyRecordInteractor

final class MyRecordInteractor:
    PresentableInteractor<MyRecordPresentable>,
    MyRecordInteractable,
    MyRecordPresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = MyRecordPresentableAction
    typealias State = MyRecordPresentableState
    
    enum Mutation {
     case setError(MyError)
     case setLoading(Bool)
     case setRefresh(Bool)
     //case myRecordModelSection()
    }
    
    // MARK: - Properties
    
    weak var router: MyRecordRouting?
    weak var listener: MyRecordListener?
    
    let initialState: MyRecordPresentableState
    private let imagePrefetchWorker: ImagePrefetchWorking
    private let recordRepositoryService: RecordRepositoryService
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: MyRecordPresentable,
        initialState: MyRecordPresentableState,
        imagePrefechWorker: ImagePrefetchWorking,
        recordRepositoryService: RecordRepositoryService
    ) {
        self.initialState = initialState
        self.imagePrefetchWorker = imagePrefechWorker
        self.recordRepositoryService = recordRepositoryService
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - MyRecordPresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

// MARK: - mutate

extension MyRecordInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
     
        return .empty()
    }
}

// MARK: - reduce

extension MyRecordInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        
        
        return newState
    }
}
