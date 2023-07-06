//
//  PasswordViewController.swift
//  OnboardingFeature
//
//  Created by 이상헌 on 2023/07/06.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

import DesignSystem

// MARK: - PasswordViewController

final class PasswordViewController:
    BaseViewController,
    PasswordPresentable,
    PasswordViewControllable
{
    
    // MARK: - Constants
    
    private enum UI {
        
    }
    
    // MARK: - Properties
    
    weak var listener: PasswordPresentableListener?
    
    private let actionRelay = PublishRelay<PasswordPresentableListener.Action>()
    
    // MARK: - UI Components
    
    // MARK: - Initialization & Deinitialization
    
    override init() {
        super.init()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
        bind(listener: self.listener)
    }
}


// MARK: Private methods

extension PasswordViewController {}

// MARK: - Bind UI

extension PasswordViewController {
    private func bindUI() {
        
    }
}

// MARK: - Bind listener

extension PasswordViewController {
    private func bind(listener: PasswordPresentableListener?) {
        guard let listener = listener else { return }
    }
    
    private func bindActionRelay() {
        self.actionRelay.asObservable()
          .bind(with: self) { onwer, action in
            onwer.listener?.sendAction(action)
          }
          .disposed(by: disposeBag)
    }
}

// MARK: - Binding Action

extension PasswordViewController {
    private func bindActions() {
        
    }
}

// MARK: - Binding State

extension PasswordViewController {
    private func bindState(from listener: PasswordPresentableListener) {
        
    }
}

// MARK: - Layout

extension PasswordViewController {
    private func setupUI() {
        
        self.layout()
    }
    
    private func layout() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct PasswordPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = PasswordViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
