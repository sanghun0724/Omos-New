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
    }
    
    private func setEnable(_ isEnable: Bool) {
        backgroundColor = isEnable ? Asset.Colors.mainOrange.color : Asset.Colors.mainGray4.color
        setTitle(isEnable ? enableText : disableText, for: .normal)
        //setTitleColor(isEnable ? .black : Asset.Colors.mainGray6.color, for: .normal)
    }
}

