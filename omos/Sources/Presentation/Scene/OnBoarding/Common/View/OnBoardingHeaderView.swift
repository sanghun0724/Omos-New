//
//  OnBoardingHeaderView.swift
//  omos
//
//  Created by sangheon on 2023/05/13.
//

import UIKit

class OnBoardingHeaderView: BaseView {
    
    // MARK: Constants
    
    private enum UI {
        static let logoImageHeight = CommonUI.mainWidth * 0.170_6
        static let logoImageWidth = CommonUI.mainWidth * 0.201_5
    }
    
    private lazy var logoImageView = UIImageView()
        .builder
        .contentMode(.scaleAspectFit)
        .build()
    
    private lazy var titleLabel = UILabel()
        .builder
        .text("로그인")
        .font(.systemFont(ofSize: 22))
        .textColor(.orange)
        .build()
    
    override func initialize() {
        super.initialize()
        backgroundColor = .systemMint
        addSubview(logoImageView)
        addSubview(titleLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        self.makeOnBoardingHeaderViewConstraints()
    }
    
    private func makeOnBoardingHeaderViewConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(UI.logoImageHeight)
            make.width.equalTo(UI.logoImageWidth)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
        }
    }
}
