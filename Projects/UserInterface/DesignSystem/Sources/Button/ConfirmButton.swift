//
//  ConfirmButton.swift
//  omos
//
//  Created by sangheon on 2023/05/16.
//

import UIKit

class ConfirmButton: UIButton {
    
    // MARK: Properties
    
    let enableText: String
    let disableText: String
    
    override var isEnabled: Bool {
        didSet { setEnable(isEnabled)}
    }
    
    
    // MARK: initialize
    
    init(_ enableText: String, disableText: String? = nil) {
        self.enableText = enableText
        self.disableText = disableText ?? enableText

        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        setTitleColor(DesignSystemAsset.Colors.mainGray6.color, for: .disabled)
        setTitleColor(.white, for: .normal)
        backgroundColor = DesignSystemAsset.Colors.mainGray4.color
    }
    
    private func setEnable(_ isEnable: Bool) {
        backgroundColor = isEnable ? DesignSystemAsset.Colors.mainOrange.color : DesignSystemAsset.Colors.mainGray4.color
        setTitle(isEnable ? enableText : disableText, for: .normal)
    }
}

