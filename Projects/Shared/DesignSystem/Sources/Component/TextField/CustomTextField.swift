//
//  CustomTextField.swift
//  omos
//
//  Created by sangheon on 2023/05/13.
//

import UIKit

import AppFoundation

// input : 라빌 , 워닝 라벨 ,

public class CustomTextField: UITextField, UITextFieldDelegate {
    
    // MARK: Properties
    
    lazy var rightImageView = UIImageView().builder
        .contentMode(.scaleAspectFit)
        .build()
    
    private lazy var bottomLineView = UIView().builder
        .backgroundColor(.mainGray4) //TODO: 3으로
        .build()
        
    // MARK: Initialize
    
    public init() {
        super.init(frame: .zero)
        delegate = self
        addSubview(rightImageView)
        addSubview(bottomLineView)
        setup()
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
        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textColor = .white
        backgroundColor = .clear
        makeRightImageViewConstraints()
        makebottomLineViewConstraints()
    }
    
    private func makeRightImageViewConstraints() {
        rightImageView.snp.makeConstraints {
            $0.right.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
    
    private func makebottomLineViewConstraints() {
        bottomLineView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
}

