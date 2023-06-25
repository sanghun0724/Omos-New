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
        
    }
    
    // MARK: - Properties
    
    weak var listener: OnboardingPresentableListener?
    
    private let actionRelay = PublishRelay<OnboardingPresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var mainTitleLabel = UILabel()
    
    private lazy var mainImageView = UIImageView()
    
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
    
    private lazy var appleButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .white)
    
    private lazy var signUpButton = UIButton()
    
    private lazy var verticalSepeartedLineView = UIView() 
    
    private lazy var loggedInButton = UIButton()
    
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
        
    }
}

// MARK: - Binding State

extension OnboardingViewController {
    private func bindState(from listener: OnboardingListener) {
        
    }
}

// MARK: - Layout

extension OnboardingViewController {
    private func setupUI() {
        
        self.layout()
    }
    
    private func layout() {
        
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
