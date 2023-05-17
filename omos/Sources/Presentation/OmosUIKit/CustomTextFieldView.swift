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
    
    lazy var textField: CustomTextField = {
        let textField = CustomTextField()
        return textField
    }()
    
    lazy var leftTopLabel: UILabel = {
        let label = UILabel()
        label.isHidden = false
        return label
    }()
    
    lazy var rightTopLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = Asset.Colors.mainOrange.color
        return label
    }()
    
    func fetchLeftTopLabelText(text: String) {
        leftTopLabel.text = text
    }
    
    func fetchRightTopLabelText(text: String) {
        rightTopLabel.text = text
    }
    
    func setWarningState() {
        rightTopLabel.isHidden = false
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
