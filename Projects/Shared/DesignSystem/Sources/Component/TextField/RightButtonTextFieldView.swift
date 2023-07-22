//
//  EmailTextFieldView.swift
//  DesignSystem
//
//  Created by 이상헌 on 2023/07/07.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

public final class RightButtonTextFieldView: CustomTextFieldView {
    
    // MARK: - Constants

    private enum UI {
      static let rightButtonHeight: CGFloat = 36
      static let rightButtonWidth: CGFloat = 68
      static let textFieldHeight: CGFloat = 48
    }
    
    // MARK: - Properties
    
    public var rightButton = ConfirmButton("인증요청").builder
        .backgroundColor(.mainBlack3)
        .set(\.layer.cornerRadius, to: 12)
        .set(\.layer.masksToBounds, to: true)
        .with {
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        }
        .build()
    
    // MARK: - Helper
    
    public func setRightButtonTitle(to text: String) {
        rightButton.setTitle(text, for: .normal)
        rightButton.enableText = text
        rightButton.disableText = text
    }

    // MARK: UI
    
    public override func initialize() {
      super.initialize()
        addSubview(rightButton)
    }
    
    public override func setupConstraints() {
        super.setupConstraints()
        self.makeRightButtonConstraints()
        self.remakeCustomTextFieldConstraints()
    }
    
    private func makeRightButtonConstraints() {
        rightButton.snp.makeConstraints {
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-4)
            $0.height.equalTo(UI.rightButtonHeight)
            $0.width.equalTo(UI.rightButtonWidth)
        }
    }
    
    private func remakeCustomTextFieldConstraints() {
        textField.snp.remakeConstraints {
            $0.height.equalTo(UI.textFieldHeight)
            $0.top.equalTo(leftTopLabel.snp.bottom).offset(8)
            $0.left.bottom.equalToSuperview()
            $0.right.equalTo(rightButton.snp.left).offset(-8)
        }
    }
}
