////
////  passwordTextFieldView.swift
////  omos
////
////  Created by sangheon on 2023/05/16.
////
//
//import UIKit
//
//class PasswordTextFieldView: CustomTextFieldView {
//    
//    // MARK: - Constants
//
//    private enum UI {
//      static let textFieldHeight: CGFloat = 48
//    }
//    
//    var maskingButton: UIButton(type: .custom)
//    
//    
//    private func configMaskingButtonIamge() {
//        maskingButton = UIButton.init(primaryAction: UIAction(handler: { _ in
//            self.textField.isSecureTextEntry.toggle()
//            self.maskingButton.isSelected.toggle()
//        }))
//        
//        var buttonConfiguration = UIButton.Configuration.plain()
//        buttonConfiguration.imagePadding = 10
//        buttonConfiguration.baseBackgroundColor = .clear
//        
//        maskingButton.setImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
//        maskingButton.setImage(<#T##image: UIImage?##UIImage?#>, for: .selected)
//        maskingButton.configuration = buttonConfiguration
//        
//        textField.rightView = maskingButton
//        textField.rightViewMode = .always
//    }
//    
//    
//    
//    
//    
//}
//
//// MARK: UI
//
//extension PasswordTextFieldView {
//     
//}
