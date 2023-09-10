//
//  AppRootViewController.swift
//  RootTabBarFeatureDemoApp
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

import DesignSystem

protocol AppRootPresentableListener: AnyObject {
    
}

// MARK: - AppRootViewController

final class AppRootViewController:
    BaseViewController,
    AppRootPresentable,
    AppRootViewControllable
{
    
    // MARK: - Properties
    
    weak var listener: AppRootPresentableListener?
    
    // MARK: - UI Components
    
    // MARK: - Initialization & Deinitialization
    
    override init() {
        super.init()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


// MARK: Private methods

extension AppRootViewController {}


// MARK: - Layout

extension AppRootViewController {
    private func setupUI() {
        
        self.layout()
    }
    
    private func layout() {
        
    }
}

