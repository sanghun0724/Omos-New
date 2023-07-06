//
//  AgreementViewController.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

import DesignSystem

// MARK: - AgreementViewController

final class AgreementViewController:
    BaseViewController,
    AgreementPresentable,
    AgreementViewControllable
{
    
    // MARK: - Constants
    
    private enum UI {
        
    }
    
    // MARK: - Properties
    
    weak var listener: AgreementPresentableListener?
    
    private let actionRelay = PublishRelay<AgreementPresentableListener.Action>()
    
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

extension AgreementViewController {}

// MARK: - Bind UI

extension AgreementViewController {
    private func bindUI() {
        
    }
}

// MARK: - Bind listener

extension AgreementViewController {
    private func bind(listener: AgreementPresentableListener?) {
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

extension AgreementViewController {
    private func bindActions() {
        
    }
}

// MARK: - Binding State

extension AgreementViewController {
    private func bindState(from listener: AgreementPresentableListener) {
        
    }
}

// MARK: - Layout

extension AgreementViewController {
    private func setupUI() {
        
        self.layout()
    }
    
    private func layout() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct AgreementPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = AgreementViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
