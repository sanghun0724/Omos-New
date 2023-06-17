//
//  NSMutableAttributedString+Extension.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import UIKit

extension NSMutableAttributedString {
    var fontSize: CGFloat {
        16
    }
    var boldFont: UIFont {
        UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    var normalFont: UIFont {
        UIFont(name: "AppleSDGothicNeo-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    func bold(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
    
    func regular(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
    
    func orangeHighlight(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: DesignSystemAsset.Colors.mainOrange.color
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func blackHighlight(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.black
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func underlined(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
