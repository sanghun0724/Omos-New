//
//  CustomTextFieldView.swift
//  omos
//
//  Created by sangheon on 2023/05/13.
//

import UIKit
import SnapKit

class CustomTextFieldView: BaseView {
    
    // MARK: - Constants

    private enum UI {
      static let textFieldHeight: CGFloat = 48
    }
    
    // MARK: - Propoerties
    
    var isValidFormatted: Bool = true {
        didSet {
            isValidFormatted ? self.setNomalState() : self.setWarningState()
        }
    }
    
    var isSuccessLoggedIn: Bool = false {
        didSet {
            if isSuccessLoggedIn {
                self.setNomalState()
            } else {
                fetchRightTopLabelText(text: " 로그인 실패")
                self.setWarningState()
            }
        }
    }
    
    lazy var textField = CustomTextField()
    
    lazy var leftTopLabel = UILabel().builder
        .font(.systemFont(ofSize: 14, weight: .regular))
        .textColor(.white)
        .build()
    
    lazy var rightTopLabel = UILabel().builder
        .font(.systemFont(ofSize: 12, weight: .regular))
        .textColor(Asset.Colors.mainOrange.color)
        .isHidden(true)
        .build()
    
    func fetchLeftTopLabelText(text: String) {
        leftTopLabel.text = text
    }
    
    func fetchRightTopLabelText(text: String) {
        rightTopLabel.text = text
    }
    
    func setWarningState() {
        rightTopLabel.isHidden = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Asset.Colors.mainOrange.color.cgColor
    }
    
    func setNomalState() {
        rightTopLabel.isHidden = true
        textField.layer.borderColor = UIColor.clear.cgColor
    }
    
    override func initialize() {
        super.initialize()
        addSubview(textField)
        addSubview(leftTopLabel)
        addSubview(rightTopLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        self.makeLeftTopLabelConstraints()
        self.makeRightTopLabelConstraints()
        self.makeTextFieldConstraints()
    }
    
    private func makeLeftTopLabelConstraints() {
        leftTopLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
    }
    
    private func makeRightTopLabelConstraints() {
        rightTopLabel.snp.makeConstraints {
            $0.right.top.equalToSuperview()
        }
    }
    
    private func makeTextFieldConstraints() {
        textField.snp.makeConstraints {
            $0.height.equalTo(UI.textFieldHeight)
            $0.top.equalTo(rightTopLabel.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
}
