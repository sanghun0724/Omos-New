//
//  EmailTextFieldView.swift
//  DesignSystem
//
//  Created by 이상헌 on 2023/07/07.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

public final class EmailTextFieldView: CustomTextFieldView {
    
    // MARK: - Constants

    private enum UI {
      static let rightButtonHeight: CGFloat = 36
      static let rightButtonWidth: CGFloat = 68
    }
    
    // MARK: - Properties
    
    var rightButton = UIButton().builder
        .backgroundColor(.red)
        .set(\.layer.cornerRadius, to: 12)
        .set(\.layer.masksToBounds, to: true)
        .with {
            $0.setTitle("TEST", for: .normal)
        }
        .build()

    // MARK: UI
    
    public override func initialize() {
      super.initialize()
        textField.addSubview(self.rightButton)
    }
    
    public override func setupConstraints() {
        super.setupConstraints()
        self.makeRightButtonConstraints()
        self.updateBottomLineViewConstraints()
    }
    
    private func makeRightButtonConstraints() {
        rightButton.snp.makeConstraints {
            $0.right.top.bottom.equalToSuperview()
            $0.width.equalTo(UI.rightButtonWidth)
        }
    }
    
    private func updateBottomLineViewConstraints() {
        bottomLineView.snp.remakeConstraints {
            $0.left.bottom.equalToSuperview()
            $0.height.equalTo(1)
            $0.right.equalTo(rightButton.snp.left).offset(-8)
        }
    }
}
