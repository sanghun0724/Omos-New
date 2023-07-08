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
        static let leadingTrailingMargin = 16
        static let confirmButtonHeight = 48
    }
    
    // MARK: - Properties
    
    weak var listener: PasswordPresentableListener?
    
    private let actionRelay = PublishRelay<PasswordPresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var headerTitleLabel = UILabel().builder
        .text(.signUp)
        .textColor(.white)
        .font(.boldSystemFont(ofSize: 24))
        .build()
    
    private lazy var passwordTextFieldView = PasswordTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: .password)
            $0.fetchLeftBottomLabelText(text: .passwordWarning)
        }
        .build()
    
    private lazy var repasswordTextFieldView = PasswordTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: .password)
            $0.fetchLeftBottomLabelText(text: .repasswordInvalidation)
        }
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
    
    private func bindPasswordsDidChange() {
        //        Observable.combineLatest(self.passwordTextFieldView.textField.rx.text.orEmpty.distinctUntilChanged(),
        //                                 self.repasswordTextFieldView.textField.rx.text.orEmpty.distinctUntilChanged())
        //        .map { .passwordsDidChange(password: $0.0, repassword: $0.1) }
        //        .bind(to: self.actionRelay)
        //        .disposed(by: disposeBag)
    }
}

// MARK: - Binding State

extension PasswordViewController {
    private func bindState(from listener: PasswordPresentableListener) {
        
    }
    
    private func bindValidationPasswordState(from listener: EmailSignUpPresentableListener) {
        //        listener.state
        //            .map(\.isValidPasswordFormat)
        //            .skip(1)
        //            .asDriver(onErrorDriveWith: .empty())
        //            .drive(self.passwordTextFieldView.rx.isValidState)
        //            .disposed(by: disposeBag)
        //
        //        listener.state
        //            .map(\.isValidRepasswordConfirm)
        //            .skip(1)
        //            .asDriver(onErrorDriveWith: .empty())
        //            .drive(self.repasswordTextFieldView.rx.isValidState)
        //            .disposed(by: disposeBag)
    }
}

// MARK: - Layout

extension PasswordViewController {
    private func setupUI() {
        contentView.addSubview(headerTitleLabel)
        contentView.addSubview(passwordTextFieldView)
        contentView.addSubview(repasswordTextFieldView)
        self.layout()
    }
    
    private func layout() {
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.left.equalToSuperview().offset(16)
        }
        passwordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(headerTitleLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        repasswordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldView.leftBottomLabel.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
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
