//
//  AppRootInteractor.swift
//  RootTabBarFeatureDemoApp
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//
import Foundation

import RIBs
import RxSwift

// MARK: - AppRootRouting

protocol AppRootRouting: ViewableRouting {
    func attachRootTabBarRIB()
}

// MARK: - AppRootPresentable

protocol AppRootPresentable: Presentable {
    var listener: AppRootPresentableListener? { get set }
}

// MARK: - AppRootListener

protocol AppRootListener: AnyObject {}

// MARK: - AppRootInteractor

final class AppRootInteractor:
    PresentableInteractor<AppRootPresentable>,
    AppRootInteractable,
    AppRootPresentableListener
{
    
    // MARK: - Properties
    
    weak var router: AppRootRouting?
    weak var listener: AppRootListener?
    
    // MARK: - Initialization & Deinitialization
    
    override init(
        presenter: AppRootPresentable
    ) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
//            self?.router?.attachRootTabBarRIB()
//        })
        // rootTabBar데모로 보려면 모든 피쳐들의 의존성을 해결해야 하는데 (지금은 여기서 해결 불가)
        // Composition Root개념으로 위에다가 한번 다 넣어주는식 -> rootTabBarBuilder에 있는 Today지우고 AppComponent로 옮겨서 해보기 
    }
    
    
    
}
