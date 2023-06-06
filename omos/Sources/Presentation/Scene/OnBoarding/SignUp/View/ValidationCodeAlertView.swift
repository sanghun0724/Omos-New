//
//  ValidationCodeAlert.swift
//  omos
//
//  Created by sangheon on 2023/06/03.
//

import UIKit

class ValidationCodeAlertView: BaseView {
    
    // MARK: Constants
    
    enum UI {
        static let textFieldHeight = 48
    }
    
    private lazy var guideLabel = UILabel().builder
        .text("인증코드를 해당 이메일로 전송했습니다")
        .font(.systemFont(ofSize: 14, weight: .regular))
        .build()
    
    lazy var codeInputField = UITextField().builder
        .backgroundColor(Asset.Colors.mainGray4.color)
        .textAlignment(.center)
        .build()
    
    private lazy var buttonStackView = UIStackView(arrangedSubviews: [varifyButton, cancelButton]).builder
        .spacing(14)
        .distribution(.fillEqually)
        .build()
    
    lazy var varifyButton = UIButton().builder
        .with {
            $0.setTitle("확인", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
            $0.setTitleColor(Asset.Colors.mainGray4.color, for: .normal)
        }
        .build()
    
    private lazy var cancelButton = UIButton().builder
        .with {
            $0.setTitle("취소", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
            $0.setTitleColor(Asset.Colors.mainGray4.color, for: .normal)
            $0.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchDown)
        }
        .build()
    
    @objc
    private func cancelButtonDidTap() {
        isHidden = true 
    }
    
    override func initialize() {
        super.initialize()
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 8
        addSubview(guideLabel)
        addSubview(codeInputField)
        addSubview(buttonStackView)
        self.makeButtonStackViewConstraints()
        self.makeGuideLableConstraints()
        self.makeCodeInputFieldConstraints()
    }
    
    private func makeButtonStackViewConstraints() {
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    private func makeCodeInputFieldConstraints() {
        codeInputField.snp.makeConstraints {
            $0.bottom.equalTo(buttonStackView.snp.top).offset(-12)
            $0.height.equalTo(UI.textFieldHeight)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
    }
    
    private func makeGuideLableConstraints() {
        guideLabel.snp.makeConstraints {
            $0.bottom.equalTo(codeInputField.snp.top).offset(-12)
            $0.centerX.equalToSuperview()
            $0.top.greaterThanOrEqualToSuperview().offset(12)
        }
    }
    
}

