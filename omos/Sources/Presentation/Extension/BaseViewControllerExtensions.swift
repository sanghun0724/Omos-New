//
//  BaseViewControllerExtensions.swift
//  omos
//
//  Created by sangheon on 2023/05/29.
//

import UIKit

extension BaseViewController {
    
    /*
     * MARK: Custom Top App Bar Options (Must Override)
     */
    
    @objc
    func navigationBarBottomBorderLineColor() -> UIColor {
        return .clear
    }
    
    @objc
    func navigationBarBackgroundColor() -> UIColor {
        return .white
    }
    
    @objc
    func navigationBarLeftButtonText() -> String? {
        return nil
    }
    
    @objc
    func navigationBarRightButtonText() -> String? {
        return nil
    }
    
    @objc
    func navigationBarTitleText() -> String? {
        return nil
    }
    
    @objc
    func navigationBarTitleImage() -> UIImage? {
        return nil
    }
    
    @objc
    func navigationBarLeftBtnTextColor() -> UIColor {
        return .black
    }
    
    @objc
    func navigationBarRightBtnColor() -> UIColor {
        return .black
    }
    
    @objc
    func navigationBarTitleTextColor() -> UIColor {
        return .black
    }
    
    @objc
    func navigationBarTitleTextFont() -> UIFont {
        return .systemFont(ofSize: 16, weight: .bold)
    }
    
    /*
     * MARK: Navigation Button Events
     */
    @objc
    func navigationLeftButtonDidTapped() {
        fatalError("must be override func \(#function)  {} in \(NSStringFromClass(self.classForCoder))")
    }
    
    @objc
    func navigationRightButtonDidTapped() {
        fatalError("must be override func \(#function)  {} in \(NSStringFromClass(self.classForCoder))")
    }
    
    @objc
    func navigationTitleDidTapped() {
        fatalError("must be override func \(#function)  {} in \(NSStringFromClass(self.classForCoder))")
    }
    
    /*
     * MARK: Enable/Disable Gesture
     */
    
    @objc
    func isEnableNavigationGesture() -> Bool {
        return true
    }
}
