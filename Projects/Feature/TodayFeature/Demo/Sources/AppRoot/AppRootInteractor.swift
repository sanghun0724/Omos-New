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
    func attachTodayRIB()
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
        self.router?.attachTodayRIB()
    }
    
}
