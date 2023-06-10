//
//  AgreementView.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import UIKit

class AgreementView: BaseView {
    
    // MARK: - UI Components
    
    enum UI {
        static let checkCircleViewSize = 12
    }
    
    private lazy var checkCircleView = UIButton().builder
        .set(\.layer.masksToBounds, to: true)
        .set(\.layer.cornerRadius, to: 6)
        .build()
    
    private lazy var guideLabel = UILabel().builder
        .build()
    
    private lazy var showButton = UIButton().builder
        .with {
            $0.titleLabel?.font = .systemFont(ofSize: 16)
            $0.titleLabel?.textAlignment = .right
            $0.titleLabel?.attributedText = NSMutableAttributedString().underlined("보기")
        }
        .build()
    
    // MARK: - initialize
    
    override func initialize() {
        super.initialize()
        backgroundColor = .clear
        addSubview(checkCircleView)
        addSubview(guideLabel)
        addSubview(showButton)
        
    }
    
    private func makeCheckButtonConstraints() {
        checkCircleView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(UI.checkCircleViewSize)
        }
    }
    
    private func makeGuideLabelConstranints() {
        guideLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(checkCircleView.snp.trailing).offset(10)
        }
    }
    
    private func makeShowButtonConstraints() {
        showButton.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
            $0.width.greaterThanOrEqualTo(30)
        }
    }
    
}


