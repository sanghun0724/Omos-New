//
//  AgreementListView.swift
//  OnboardingFeature
//
//  Created by 이상헌 on 2023/07/16.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import DesignSystem

final class AgreementListView: BaseView {
    
    // MARK: - Constants
    
    enum UI {
        static let checkButtonSize = 20
    }
    
    // MARK: - UI Components
    
    lazy var checkButton = UIButton().builder
        .with {
            $0.setImage(.emptyCheckBox, for: .normal)
            $0.setImage(.checkBox, for: .selected)
        }
        .build()
    
    lazy var titleLabel = UILabel().builder
        .font(.systemFont(ofSize: 16, weight: .medium))
        .textColor(.white)
        .build()
    
    lazy var accessoryButton = UIButton().builder
        .with {
            $0.setImage(.arrowRight, for: .normal) //TODO:
        }
        .build()
    
    // MARK: - Initialization & Deinitialization
    
    override func initialize() {
        super.initialize()
        addSubview(checkButton)
        addSubview(titleLabel)
        addSubview(accessoryButton)
        makeCheckButtonConstraints()
        makeTitleLabelConstraints()
        makeAccessoryButtonConstraints()
    }
    
    private func makeCheckButtonConstraints() {
        checkButton.snp.makeConstraints {
            $0.top.bottom.left.equalToSuperview()
            $0.size.equalTo(UI.checkButtonSize)
        }
    }
    
    private func makeTitleLabelConstraints() {
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(checkButton.snp.right).offset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func makeAccessoryButtonConstraints() {
        accessoryButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.right.top.bottom.equalToSuperview()
        }
    }


    
}
