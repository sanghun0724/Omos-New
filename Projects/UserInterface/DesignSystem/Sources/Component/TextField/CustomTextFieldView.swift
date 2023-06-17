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
    
    var isValidState: Bool = true {
        didSet {
            guard let text = textField.text, !text.isEmpty else {
                setNomalState()
                return
            }
            isValidState ? self.setNomalState() : self.setWarningState()
        }
    }
    
    lazy var textField = CustomTextField().builder
        .set(\.layer.borderWidth, to: 1)
        .set(\.layer.borderColor, to: UIColor.clear.cgColor)
        .build()
    
    lazy var leftTopLabel = UILabel().builder
        .font(.systemFont(ofSize: 14, weight: .regular))
        .textColor(.white)
        .build()
    
    lazy var rightTopLabel = UILabel().builder
        .font(.systemFont(ofSize: 12, weight: .regular))
        .textColor(DesignSystemAsset.Colors.mainOrange.color)
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
        textField.layer.borderColor = DesignSystemAsset.Colors.mainOrange.color.cgColor
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
