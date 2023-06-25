//
//  DecoView.swift
//  omos
//
//  Created by sangheon on 2023/05/14.
//

import UIKit

import DesignSystem

class DecoView: BaseView {
    private let leftSepartedLine = UIView().builder
        .backgroundColor(DesignSystemAsset.Colors.mainGray7.color)
        .build()
    
    private let orLabel = UILabel().builder
        .text("or")
        .textColor(DesignSystemAsset.Colors.mainGray7.color)
        .build()

    private let rightSepartedLine = UIView().builder
        .backgroundColor(DesignSystemAsset.Colors.mainGray7.color)
        .build()
    
    override func initialize() {
        super.initialize()
        addSubview(orLabel)
        addSubview(leftSepartedLine)
        addSubview(rightSepartedLine)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        self.makeOrLabelConstraints()
        self.makeLeftSepartedLineConstraints()
        self.makeRightSepartedLineConstraints()
    }

    private func makeOrLabelConstraints() {
        orLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func makeLeftSepartedLineConstraints() {
        leftSepartedLine.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(1)
            make.trailing.equalTo(orLabel.snp.leading).offset(-14).priority(.high)
        }
    }
    
    private func makeRightSepartedLineConstraints() {
        rightSepartedLine.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalTo(orLabel.snp.trailing).offset(14).priority(.high)
        }
    }
}
