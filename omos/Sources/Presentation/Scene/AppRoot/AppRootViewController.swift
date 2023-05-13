//
//  AppRootViewController.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import UIKit
import RIBs

protocol AppRootPresentableListener: AnyObject {
    
}

final class AppRootViewController:
    BaseViewController,
    AppRootPresentable,
    AppRootViewControllable {
    
    // MARK: UI Components
    
    private lazy var splashImageView = UIImageView()
        .builder
        .contentMode(.scaleAspectFill)
        .backgroundColor(.gray)
        .build()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    weak var listener: AppRootPresentableListener?
    
}

// MARK: - Layout

extension AppRootViewController {
    private func setupUI() {
        contentView.addSubview(splashImageView)
        
        self.layout()
    }
    
    private func layout() {
        splashImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.9)
            $0.height.equalToSuperview().multipliedBy(0.133)
            $0.width.equalToSuperview().multipliedBy(0.32)
        }
    }
}
