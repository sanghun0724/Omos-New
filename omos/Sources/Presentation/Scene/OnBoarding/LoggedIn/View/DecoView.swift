//
//  DecoView.swift
//  omos
//
//  Created by sangheon on 2023/05/14.
//

import UIKit

class DecoView: BaseView {
    private let leftSepartedLine = UIView().builder
        .backgroundColor(Asset.Colors.mainGray7.color)
        .build()
    
    private let orLabel = UILabel().builder
        .text("or")
        .textColor(Asset.Colors.mainGray7.color)
        .build()

    private let rightSepartedLine = UIView().builder
        .backgroundColor(Asset.Colors.mainGray7.color)
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
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(1)
            make.right.equalTo(orLabel.snp.left).offset(-14)
        }
    }
    
    private func makeRightSepartedLineConstraints() {
        rightSepartedLine.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalTo(orLabel.snp.right).offset(14)
        }
    }
}
