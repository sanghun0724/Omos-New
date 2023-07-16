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
        static let agreementViewMargin = 16
        static let separatedLineViewMargin = 10
    }
    
    // MARK: - Properties
    
    weak var listener: AgreementPresentableListener?
    
    private let actionRelay = PublishRelay<AgreementPresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var headerTitleLabel = UILabel().builder
        .text("서비스 이용 동의")
        .font(.boldSystemFont(ofSize: 24))
        .build()
    
    private lazy var allAgreeView = AgreementListView().builder
        .with {
            $0.accessoryButton.isHidden = true
        }
        .build()
    
    private lazy var separatedLineView = UIView().builder
        .backgroundColor(.mainBlack3)
        .build()
    
    private lazy var serviceAgreementView = AgreementListView()
    
    private lazy var privacyAgreementView = AgreementListView()

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
        contentView.addSubview(headerTitleLabel)
        contentView.addSubview(allAgreeView)
        contentView.addSubview(separatedLineView)
        contentView.addSubview(serviceAgreementView)
        contentView.addSubview(privacyAgreementView)
        self.layout()
    }
    
    private func layout() {
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.left.equalToSuperview().offset(16)
        }
        allAgreeView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UI.agreementViewMargin)
            $0.top.equalTo(headerTitleLabel.snp.bottom).offset(54)
        }
        separatedLineView.snp.makeConstraints {
            $0.top.equalTo(allAgreeView.snp.bottom).offset(24)
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview().inset(UI.separatedLineViewMargin)
        }
        serviceAgreementView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UI.agreementViewMargin)
            $0.top.equalTo(separatedLineView.snp.bottom).offset(22)
        }
        privacyAgreementView.snp.makeConstraints {
            $0.top.equalTo(serviceAgreementView.snp.bottom).offset(28)
            $0.left.right.equalToSuperview().inset(UI.agreementViewMargin)
        }
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
