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
    
    lazy var loginButton = UIButton().builder
        .backgroundColor(.orange)
        .set(\.layer.cornerRadius, to: CommonUI.loginCorner)
        .set(\.layer.masksToBounds, to: true)
        .with {
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        }
        .isEnabled(false)
        .build()

    private lazy var decoView = DecoView()
    
    private lazy var kakaoImageView = UIImageView(image: Asset.Images.Login.kakao.image)
    
    private let kakaoLabel = UILabel().builder
        .text("카카오로 로그인")
        .build()
    lazy var kakaoButton = UIButton().builder
        .backgroundColor(.orange)
        .set(\.layer.cornerRadius, to: CommonUI.loginCorner)
        .set(\.layer.masksToBounds, to: true)
        .with {
            $0.setTitle("  Kakao로 로그인", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        }
        .backgroundColor(.orange)
        .build()

    let appleButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .white)
    
    override func initialize() {
        super.initialize()
        addSubview(loginButton)
        addSubview(decoView)
        addSubview(appleButton)
        addSubview(kakaoButton)
        kakaoButton.addSubview(kakaoImageView)
        kakaoButton.addSubview(kakaoLabel)
    }
    
    override func setupConstraints() {
      super.setupConstraints()
        self.makeLoginButtonConstraints()
        self.makeDecoViewConstraints()
        self.makeKakaoButtonConstraints()
        self.makeAppleButtonConstraints()
    }

    private func makeLoginButtonConstraints() {
        loginButton.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(UI.buttonHeight)
        }
    }
    
    private func makeDecoViewConstraints() {
        decoView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom)
            make.height.equalTo(UI.separatedHeight)
        }
    }
    
    private func makeKakaoButtonConstraints() {
        kakaoButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(decoView.snp.bottom)
            make.height.equalTo(UI.buttonHeight)
        }
        
        kakaoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            kakaoImageView.translatesAutoresizingMaskIntoConstraints = false
            kakaoImageView.rightAnchor.constraint(equalTo: kakaoButton.titleLabel!.leftAnchor).isActive = true
            make.height.width.equalTo(12)
        }
    }
    
    private func makeAppleButtonConstraints() {
        appleButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(kakaoButton.snp.bottom).offset(14)
            make.height.equalTo(UI.buttonHeight)
        }
    }
    
}
