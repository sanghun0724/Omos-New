//
//  ButtonView.swift
//  omos
//
//  Created by sangheon on 2023/05/14.
//

import AuthenticationServices
import UIKit

class BottomButtonsView: BaseView {
    
    // MARK: Constants
    
    private enum UI {
        static let buttonHeight = 48
        static let separatedHeight = 41
    }
    
    lazy var loginButton = ConfirmButton(Strings.Onboarding.loggedIn).builder
        .set(\.layer.cornerRadius, to: CommonUI.loginCorner)
        .set(\.layer.masksToBounds, to: true)
        .build()
    
    private lazy var decoView = DecoView()
    
    private lazy var kakaoImageView = UIImageView(image: Asset.Images.Login.kakao.image)
    
    lazy var kakaoButton = UIButton().builder
        .backgroundColor(Asset.Colors.kakaoYellow.color)
        .set(\.layer.cornerRadius, to: CommonUI.loginCorner)
        .set(\.layer.masksToBounds, to: true)
        .with {
            $0.setTitle(Strings.Onboarding.kakao, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
            $0.setTitleColor(Asset.Colors.kakaoBrownLabel.color, for: .normal)
        }
        .build()
    
    let appleButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .white)
    
    override func initialize() {
        super.initialize()
        backgroundColor = .clear
        addSubview(loginButton)
        addSubview(decoView)
        addSubview(appleButton)
        addSubview(kakaoButton)
        kakaoButton.addSubview(kakaoImageView)
    }

    override func setupConstraints() {
        super.setupConstraints()
        self.makeLoginButtonConstraints()
        self.makeDecoViewConstraints()
        self.makeKakaoButtonConstraints()
        self.makeAppleButtonConstraints()
    }
    
    private func makeLoginButtonConstraints() {
        loginButton.snp.makeConstraints {
            $0.left.right.top.equalToSuperview()
            $0.height.equalTo(UI.buttonHeight)
        }
    }
    
    private func makeDecoViewConstraints() {
        decoView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom)
            $0.height.equalTo(UI.separatedHeight)
        }
    }
    
    private func makeKakaoButtonConstraints() {
        kakaoButton.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(decoView.snp.bottom)
            $0.height.equalTo(UI.buttonHeight)
        }
        
        kakaoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            kakaoImageView.translatesAutoresizingMaskIntoConstraints = false
            kakaoImageView.rightAnchor.constraint(equalTo: kakaoButton.titleLabel!.leftAnchor).isActive = true
            $0.height.width.equalTo(12)
        }
    }
    
    private func makeAppleButtonConstraints() {
        appleButton.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(kakaoButton.snp.bottom).offset(14)
            $0.height.equalTo(UI.buttonHeight)
            $0.bottom.equalToSuperview()
        }
    }
}
