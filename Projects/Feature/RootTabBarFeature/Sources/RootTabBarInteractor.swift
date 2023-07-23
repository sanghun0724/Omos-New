//
//  RootTabBarInteractor.swift
//  RootTabBarFeature
//
//  Created by 이상헌 on 2023/07/23.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs
import RxSwift

import RootTabBarFeatureInterface

protocol RootTabBarViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable])
}

protocol RootTabBarPresentable: Presentable {
  var listener: RootTabBarListener? { get set }
}

// MARK: - RootTabBarInteractor

final class RootTabBarInteractor:
    PresentableInteractor<RootTabBarPresentable>,
    RootTabBarInteractable
{
    
    // MARK: - Properties
    
    weak var router: RootTabBarRouting?
    weak var listener: RootTabBarListener?
    
    // MARK: - Initialization & Deinitialization
    
    override init(presenter: RootTabBarPresentable) {
        super.init(presenter: presenter)
        presenter.listener = listener
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        
        router?.attachTabs()
    }
}
