//
//  ValidationCodeAlert.swift
//  omos
//
//  Created by sangheon on 2023/06/03.
//

import UIKit

class ValidationCodeAlertView: BaseView {
    
    // MARK: - Constants
    
    enum UI {
        static let textFieldHeight = 48
    }
    
    // MARK: Properties
    
    var isSuccess: Bool = false {
        didSet {
            isSuccess ? setSuccessState() : setFailureState()
        }
    }
    
    // MARK: - UI Components
    
    private lazy var backContainerView = UIView().builder
        .backgroundColor(.clear)
        .isHidden(true)
        .build()
    
    private lazy var guideLabel = UILabel().builder
        .text("인증코드를 해당 이메일로 전송했습니다")
        .font(.systemFont(ofSize: 14, weight: .regular))
        .numberOfLines(0)
        .build()
    
    lazy var codeInputField = UITextField().builder
        .backgroundColor(Asset.Colors.mainGray4.color)
        .textAlignment(.center)
        .set(\.layer.borderWidth, to: 1)
        .set(\.layer.cornerRadius, to: 4)
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
    
    // MARK: - Private
    
    private func setSuccessState() {
        isHidden = true
        guideLabel.text = "인증코드를 해당 이메일로 전송했습니다"
        guideLabel.textColor = .black
        codeInputField.layer.borderColor = UIColor.clear.cgColor
        codeInputField.text = ""
    }
    
    private func setFailureState() {
        guideLabel.text = "인증번호가 틀렸습니다.\n다시 한번 확인해 주세요"
        guideLabel.textColor = Asset.Colors.mainOrange.color
        codeInputField.layer.borderColor = Asset.Colors.mainOrange.color.cgColor
    }
    
    @objc
    private func cancelButtonDidTap() {
        isHidden = true
        superview?.isHidden = true
    }
    
    // MARK: - initialize
    
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

