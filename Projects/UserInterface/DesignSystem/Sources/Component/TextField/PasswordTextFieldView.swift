//
//  passwordTextFieldView.swift
//  omos
//
//  Created by sangheon on 2023/05/16.
//

import UIKit

public class PasswordTextFieldView: CustomTextFieldView {
    
    // MARK: - Constants

    private enum UI {
      static let textFieldHeight: CGFloat = 48
    }
    
    // MARK: - Properties
    
    var maskingButton = UIButton(type: .custom)
    
    
    private func configMaskingButtonImage() {
        maskingButton = UIButton.init(primaryAction: UIAction(handler: { _ in
            self.textField.isSecureTextEntry.toggle()
            self.maskingButton.isSelected.toggle()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        maskingButton.setImage(DesignSystemAsset.Login.visible1.image, for: .normal)
        maskingButton.setImage(DesignSystemAsset.Login.visible2.image, for: .selected)
        maskingButton.configuration = buttonConfiguration
        
        textField.rightView = maskingButton
        textField.rightViewMode = .always
    }

    // MARK: UI
    
    public override func initialize() {
      super.initialize()
        self.configMaskingButtonImage()
        textField.addSubview(self.maskingButton)
    }
    
    public override func setupConstraints() {
        super.setupConstraints()
        self.makeMaskingButtonConstraints()
    }
    
    private func makeMaskingButtonConstraints() {
        maskingButton.snp.makeConstraints {
            $0.right.top.bottom.equalToSuperview()
            $0.width.equalTo(UI.textFieldHeight)
        }
    }
    
}
