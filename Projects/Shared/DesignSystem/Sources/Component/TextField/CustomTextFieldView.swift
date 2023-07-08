//
//  CustomTextFieldView.swift
//  omos
//
//  Created by sangheon on 2023/05/13.
//

import UIKit
import SnapKit

public class CustomTextFieldView: BaseView {
    
    public init() {
        super.init(frame: .zero)
    }
    
    // MARK: - Constants
    
    private enum UI {
        static let textFieldHeight: CGFloat = 48
    }
    
    // MARK: - Propoerties
    
    public var isValidState: Bool = true {
        didSet {
            guard let text = textField.text, !text.isEmpty else {
                setNomalState()
                return
            }
            isValidState ? self.setNomalState() : self.setWarningState()
        }
    }
    
    public lazy var textField = CustomTextField()
    
    public lazy var bottomLineView = UIView().builder
        .backgroundColor(.mainGray4) //TODO: 3으로
        .build()
    
    public lazy var leftTopLabel = UILabel().builder
        .font(.systemFont(ofSize: 14, weight: .regular))
        .textColor(.white)
        .build()
    
    public lazy var leftBottomLabel = UILabel().builder
        .font(.systemFont(ofSize: 12, weight: .regular))
        .textColor(DesignSystemAsset.Colors.mainPink.color)
        .numberOfLines(0)
        .isHidden(true)
        .build()
    
    public func fetchLeftTopLabelText(text: String) {
        leftTopLabel.text = text
    }
    
    public func fetchLeftBottomLabelText(text: String) {
        leftBottomLabel.text = text
    }
    
    public func setWarningState() {
        leftBottomLabel.isHidden = false
        textField.layer.borderColor = DesignSystemAsset.Colors.mainPink.color.cgColor
    }
    
    public func setNomalState() {
        leftBottomLabel.isHidden = true
        textField.layer.borderColor = UIColor.clear.cgColor
    }
    
    public override func initialize() {
        super.initialize()
        addSubview(textField)
        addSubview(leftTopLabel)
        addSubview(leftBottomLabel)
        
        textField.addSubview(bottomLineView)
    }
    
    public override func setupConstraints() {
        super.setupConstraints()
        self.makeLeftTopLabelConstraints()
        self.makeLeftBottomLabelConstraints()
        self.makeTextFieldConstraints()
        self.makebottomLineViewConstraints()
    }
    
    private func makeLeftTopLabelConstraints() {
        leftTopLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
    }
    
    private func makeLeftBottomLabelConstraints() {
        leftBottomLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(textField.snp.bottom).offset(8)
        }
    }
    
    private func makeTextFieldConstraints() {
        textField.snp.makeConstraints {
            $0.height.equalTo(UI.textFieldHeight)
            $0.top.equalTo(leftTopLabel.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    private func makebottomLineViewConstraints() {
        bottomLineView.snp.makeConstraints {
            $0.bottom.left.right.equalTo(textField)
            $0.height.equalTo(1)
        }
    }
    
}
