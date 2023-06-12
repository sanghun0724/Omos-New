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
    
    lazy var checkCircleView = UIButton().builder
        .set(\.layer.masksToBounds, to: true)
        .set(\.layer.cornerRadius, to: 6)
        .backgroundColor(.white)
        .build()
    
    private lazy var guideLabel = UILabel()
    
    lazy var showButton = UIButton().builder
        .with {
            $0.setTitle("보기", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16)
            $0.titleLabel?.textAlignment = .right
            $0.titleLabel?.textColor = Asset.Colors.mainGray4.color
            $0.titleLabel?.attributedText = NSMutableAttributedString().underlined("보기")
        }
        .build()
    
    // MARK: helper methods
    
    func setTermsGuideLabelText() {
        guideLabel.attributedText = NSMutableAttributedString()
            .regular(string: "(필수) ", fontSize: 16)
            .orangeHighlight("이용약관")
            .regular(string: "에 동의합니다.", fontSize: 16)
    }
    
    func setPolicyGuideLabelText() {
        guideLabel.attributedText = NSMutableAttributedString()
            .regular(string: "(필수) ", fontSize: 16)
            .orangeHighlight("개인정보 보호정책")
            .regular(string: "에 동의합니다.", fontSize: 16)
    }
    
    // MARK: - initialize
    
    override func initialize() {
        super.initialize()
        backgroundColor = .clear
        addSubview(checkCircleView)
        addSubview(guideLabel)
        addSubview(showButton)
        self.makeCheckButtonConstraints()
        self.makeGuideLabelConstranints()
        self.makeShowButtonConstraints()
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
            $0.top.bottom.trailing.equalToSuperview()
            $0.width.greaterThanOrEqualTo(30)
        }
    }
    
}


