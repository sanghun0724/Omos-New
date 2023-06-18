//
//  CustomTextField.swift
//  omos
//
//  Created by sangheon on 2023/05/13.
//

import UIKit

// input : 라빌 , 워닝 라벨 ,

public class CustomTextField: UITextField, UITextFieldDelegate {
    
    // MARK: Properties
    
    lazy var rightImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .red 
        return view
    }()
    
    // MARK: Initialize
    
    public init() {
        super.init(frame: .zero)
        delegate = self
        setup()
        addSubview(rightImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func fetchPlaceHolderText(text: String) {
        placeholder = text
    }
    
    public func fetchRightImage(image: UIImage) {
        rightImageView.image = image
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
    
    private func setup() {
        autocorrectionType = .no
        autocapitalizationType = .none
        layer.cornerRadius = CommonUI.loginCorner
        layer.masksToBounds = true
        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textColor = .white
        backgroundColor = DesignSystemAsset.Colors.mainBlack.color
        layer.borderColor = .some(UIColor.orange.cgColor)
    }
    
    private func makeRightImageViewConstraints() {
        rightImageView.snp.makeConstraints {
            $0.right.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
    
}
