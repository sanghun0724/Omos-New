//
//  AuthSupportedView.swift
//  omos
//
//  Created by sangheon on 2023/05/14.
//

import UIKit

class AuthSupportedView: BaseView {
    
    // MARK: Constants
    
    private enum UI {
        static let buttonHeight = 40
        static let buttonwidth = 64
    }
    
    lazy var findButton = UIButton().builder
        .with {
            $0.setTitle("아이디 찾기 | 비밀번호 찾기", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
            $0.setTitleColor(DesignSystemAsset.Colors.mainGray4.color, for: .normal)
        }
        .build()
    
    lazy var signUpButton = UIButton().builder
        .with {
            $0.setTitle("회원가입", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
            $0.setTitleColor(DesignSystemAsset.Colors.mainGray4.color, for: .normal)
        }
        .build()
    
    override func initialize() {
        super.initialize()
        addSubview(findButton)
        addSubview(signUpButton)
        self.makeFindButtonConstraints()
        self.makeSignUpButtonConstraints()
    }
    
    private func makeFindButtonConstraints() {
        findButton.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
    }
    
    private func makeSignUpButtonConstraints() {
        signUpButton.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
        }
    }
    
}
