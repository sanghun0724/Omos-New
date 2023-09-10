//
//  ConfirmButton.swift
//  omos
//
//  Created by sangheon on 2023/05/16.
//

import UIKit

public class ConfirmButton: UIButton {
    
    // MARK: Properties
    
    var enableText: String
    var disableText: String
    
    public override var isEnabled: Bool {
        didSet { setEnable(isEnabled)}
    }
    
    
    // MARK: initialize
    
    public init(_ enableText: String, disableText: String? = nil) {
        self.enableText = enableText
        self.disableText = disableText ?? enableText
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        setTitleColor(.white, for: .disabled)
        setTitleColor(.white, for: .normal)
        backgroundColor = DesignSystemAsset.Colors.mainGray4.color
        setEnable(false)
    }
    
    private func setEnable(_ isEnable: Bool) {
        backgroundColor = isEnable ? DesignSystemAsset.Colors.mainPink.color : DesignSystemAsset.Colors.mainGray4.color
        setTitle(isEnable ? enableText : disableText, for: .normal)
    }
}

