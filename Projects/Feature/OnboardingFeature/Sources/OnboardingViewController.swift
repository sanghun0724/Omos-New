//
//  OnboardingViewController.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/06/25.
//  Copyright © 2023 Omos. All rights reserved.
//

import AuthenticationServices
import UIKit

import RIBs
import RxCocoa
import RxSwift

import DesignSystem

// MARK: - OnboardingViewController

final class OnboardingViewController:
    BaseViewController,
    OnboardingPresentable,
    OnboardingViewControllable
{
    
    // MARK: - Constants
    
    private enum UI {
        static let logoViewWidth = 150
        static let logoViewHeight = 40
        static let buttonHeight = 50
        static let verticalSepeartedLineViewWidth = 1
        static let verticalSepeartedLineViewHeight = 16
    }
    
    // MARK: - Properties
    
    weak var listener: OnboardingPresentableListener?
    
    private let actionRelay = PublishRelay<OnboardingPresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var mainTitleLabel = UILabel().builder
        .text(.mainTitle)
        .numberOfLines(2)
        .font(.systemFont(ofSize: 22, weight: .bold))
        .textColor(.white)
        .build()
    
    private lazy var mainLogoView = UIImageView().builder
        .contentMode(.scaleAspectFit)
        .image(.loginLogo)
        .build()
        
    private lazy var kakaoButton = UIButton().builder
        .backgroundColor(DesignSystemAsset.Colors.kakaoYellow.color)
        .set(\.layer.cornerRadius, to: CommonUI.loginCorner)
        .set(\.layer.masksToBounds, to: true)
        .with {
            $0.setTitle(DesignSystemStrings.Onboarding.kakao, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
            $0.setTitleColor(DesignSystemAsset.Colors.kakaoBrownLabel.color, for: .normal)
        }
        .build()
    
    private lazy var kakaoImageView = UIImageView(image: DesignSystemAsset.Login.kakao.image)
    
    private lazy var appleButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .white)
    
    private lazy var signUpButton = UIButton().builder
        .with {
            $0.setTitle(.signUp, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
            $0.setTitleColor(.white, for: .normal)
        }
        .build()
    
    private lazy var verticalSepeartedLineView = UIView().builder
        .backgroundColor(.white)
        .build()
    
    private lazy var loggedInButton = UIButton().builder
        .with {
            $0.setTitle(.loggedIn, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
            $0.setTitleColor(.white, for: .normal)
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

extension OnboardingViewController {}

// MARK: - Bind UI

extension OnboardingViewController {
    private func bindUI() {
    
    }
    

}

// MARK: - Bind listener

extension OnboardingViewController {
    private func bind(listener: OnboardingPresentableListener?) {
        guard let listener = listener else { return }
        self.bindActionRelay()
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

extension OnboardingViewController {
    private func bindActions() {
        bindKakaoLoggedInButtonAction()
        bindAppleLoggedInButtonAction()
        bindEmailSignUpButtonAction()
        bindEmailLoggedInButtonAction()
    }
    
    private func bindKakaoLoggedInButtonAction() {
        kakaoButton
            .rx
            .tap
            .preventDuplication()
            .map { .didTapKakaoLoggedInButton }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindAppleLoggedInButtonAction() {
        appleButton
            .rx
            .tapGesture()
            .preventDuplication()
            .map { _ in .didTapAppleLoggedInButton }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindEmailSignUpButtonAction() {
        signUpButton
            .rx
            .tap
            .preventDuplication()
            .map { .didTapEmailSingUpButton }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindEmailLoggedInButtonAction() {
        loggedInButton
            .rx
            .tap
            .preventDuplication()
            .map { .didTapEmailLoggedInButton }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binding State

extension OnboardingViewController {
    private func bindState(from listener: OnboardingPresentableListener) {

    }
    
    private func bindTestEamilState() {
        
    }
}

// MARK: - Layout

extension OnboardingViewController {
    private func setupUI() {
        contentView.addSubview(mainTitleLabel)
        contentView.addSubview(mainLogoView)
        contentView.addSubview(verticalSepeartedLineView)
        contentView.addSubview(signUpButton)
        contentView.addSubview(loggedInButton)
        
        contentView.addSubview(kakaoButton)
        kakaoButton.addSubview(kakaoImageView)
        
        contentView.addSubview(appleButton)
        self.layout()
    }
    
    private func layout() {
        mainTitleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(36)
            $0.top.equalToSuperview().offset(100)
        }
        mainLogoView.snp.makeConstraints {
            $0.left.equalTo(mainTitleLabel)
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(20)
            $0.width.equalTo(UI.logoViewWidth)
            $0.height.equalTo(UI.logoViewHeight)
        }
        verticalSepeartedLineView.snp.makeConstraints {
            $0.width.equalTo(UI.verticalSepeartedLineViewWidth)
            $0.height.equalTo(UI.verticalSepeartedLineViewHeight)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-60)
        }
        signUpButton.snp.makeConstraints {
            $0.right.equalTo(verticalSepeartedLineView.snp.left).offset(-12)
            $0.centerY.equalTo(verticalSepeartedLineView)
        }
        loggedInButton.snp.makeConstraints {
            $0.left.equalTo(verticalSepeartedLineView.snp.right).offset(12)
            $0.centerY.equalTo(verticalSepeartedLineView)
        }
        appleButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(UI.buttonHeight)
            $0.bottom.equalTo(verticalSepeartedLineView.snp.top).offset(-20)
        }
        kakaoButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(UI.buttonHeight)
            $0.bottom.equalTo(appleButton.snp.top).offset(-20)
        }
        kakaoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            kakaoImageView.translatesAutoresizingMaskIntoConstraints = false
            kakaoImageView.rightAnchor.constraint(equalTo: kakaoButton.titleLabel!.leftAnchor).isActive = true
            $0.height.width.equalTo(12)
        }
    }

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct OnboardingPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = OnboardingViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
