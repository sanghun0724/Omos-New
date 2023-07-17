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
        static let leadingTrailingMargin = 16
        static let separatedLineViewMargin = 10
        static let confirmButtonHeight = 48
    }
    
    // MARK: - Properties
    
    weak var listener: AgreementPresentableListener?
    
    private let actionRelay = PublishRelay<AgreementPresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var headerTitleLabel = BaseLabel().builder
        .text("서비스 이용 동의")
        .textColor(.white)
        .font(.boldSystemFont(ofSize: 24))
        .build()
    
    private lazy var allAgreeView = AgreementListView().builder
        .with {
            $0.accessoryButton.isHidden = true
            $0.titleLabel.text = "약관 전체동의"
        }
        .build()
    
    private lazy var separatedLineView = UIView().builder
        .backgroundColor(.mainBlack3)
        .build()
    
    private lazy var serviceAgreementView = AgreementListView().builder
        .with {
            $0.titleLabel.text = "(필수) 서비스 이용약관"
        }
        .build()
    
    private lazy var privacyAgreementView = AgreementListView().builder
        .with {
            $0.titleLabel.text = "(필수) 개인정보 보호정책"
        }
        .build()
    
    private lazy var confirmButton = ConfirmButton(.next, disableText: .next).builder
        .set(\.layer.cornerRadius, to: CommonUI.loginCorner)
        .set(\.layer.masksToBounds, to: true)
        .build()

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
        bindActionRelay()
        bindActions()
        bindState(from: listener)
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
        bindAllCheckBoxTapAction()
        bindServiceCheckBoxTapAction()
        bindPrivacyCheckBoxTapAction()
    }
    
    private func bindAllCheckBoxTapAction() {
        allAgreeView.checkButton.rx
            .tapWithPreventDuplication()
            .withLatestFrom(allAgreeView.checkButton.rx.isSelectedChanged)
            .map { .allAgreeCheckButtonDidTap($0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindServiceCheckBoxTapAction() {
        serviceAgreementView.checkButton.rx
            .tapWithPreventDuplication()
            .withLatestFrom(serviceAgreementView.checkButton.rx.isSelectedChanged)
            .map { .serviceCheckButtonDidTap($0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindPrivacyCheckBoxTapAction() {
        privacyAgreementView.checkButton.rx
            .tapWithPreventDuplication()
            .withLatestFrom(privacyAgreementView.checkButton.rx.isSelectedChanged)
            .map { .privacyCheckButtonDidTap($0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binding State

extension AgreementViewController {
    private func bindState(from listener: AgreementPresentableListener) {
        bindIsAllAgreeCheckBoxSelected(from: listener)
        bindIsServiceCheckBoxSelected(from: listener)
        bindIsPrivacyCheckBoxSelected(from: listener)
        bindIsConfirmButtonEnable(from: listener)
    }
    
    private func bindIsAllAgreeCheckBoxSelected(from listener: AgreementPresentableListener) {
        listener.state.map(\.isAllAgreeCheckBoxSelected)
            .distinctUntilChanged()
            .asDriver(onErrorDriveWith: .empty())
            .drive(allAgreeView.checkButton.rx.isSelected)
            .disposed(by: disposeBag)
    }
    
    private func bindIsServiceCheckBoxSelected(from listener: AgreementPresentableListener) {
        listener.state.map(\.isServiceCheckBoxSelected)
            .distinctUntilChanged()
            .asDriver(onErrorDriveWith: .empty())
            .drive(serviceAgreementView.checkButton.rx.isSelected)
            .disposed(by: disposeBag)
    }
    
    private func bindIsPrivacyCheckBoxSelected(from listener: AgreementPresentableListener) {
        listener.state.map(\.isPrivacyCheckBoxSelected)
            .distinctUntilChanged()
            .asDriver(onErrorDriveWith: .empty())
            .drive(privacyAgreementView.checkButton.rx.isSelected)
            .disposed(by: disposeBag)
    }
    
    private func bindIsConfirmButtonEnable(from listener: AgreementPresentableListener) {
        listener.state.map(\.isConfirmButtonEnable)
            .distinctUntilChanged()
            .asDriver(onErrorDriveWith: .empty())
            .drive(confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)
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
        contentView.addSubview(confirmButton)
        self.layout()
    }
    
    private func layout() {
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.left.equalToSuperview().offset(16)
        }
        allAgreeView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.top.equalTo(headerTitleLabel.snp.bottom).offset(54)
        }
        separatedLineView.snp.makeConstraints {
            $0.top.equalTo(allAgreeView.snp.bottom).offset(24)
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview().inset(UI.separatedLineViewMargin)
        }
        serviceAgreementView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.top.equalTo(separatedLineView.snp.bottom).offset(22)
        }
        privacyAgreementView.snp.makeConstraints {
            $0.top.equalTo(serviceAgreementView.snp.bottom).offset(28)
            $0.left.right.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        confirmButton.snp.makeConstraints {
            $0.height.equalTo(UI.confirmButtonHeight)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.bottom.equalToSuperview().offset(-34).priority(750)
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
