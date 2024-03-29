//
//  NSMutableAttributedString+Extension.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import UIKit

extension NSMutableAttributedString {
   public var fontSize: CGFloat {
        16
    }
    public var boldFont: UIFont {
        UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    public var normalFont: UIFont {
        UIFont(name: "AppleSDGothicNeo-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    public func bold(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
    
    public func regular(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
    
    public func orangeHighlight(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: DesignSystemAsset.Colors.mainPink.color
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    public func blackHighlight(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.black
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    public func underlined(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}


