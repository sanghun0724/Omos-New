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
    
    /// if you need custom NavigaiotionBarView, when doesn't have navigation stack you can override it
    @objc
    func isNeedCustomNavigationBarView() -> Bool {
        navigationController != nil
    }
    
    @objc
    func navigationBarBottomBorderLineColor() -> UIColor {
        return .clear
    }
    
    @objc
    func navigationBarBackgroundColor() -> UIColor {
        return DesignSystemAsset.Colors.mainBackground.color
    }
    
    // Texts
    
    @objc
    func navigationBarLeftButtonText() -> String? {
        return nil
    }
    
    @objc
    func navigationBarRightButtonText() -> String? {
        return nil
    }
    
    // Images
    
    @objc
    func navigationBarLeftButtonImage() -> UIImage? {
        return nil
    }
    
    @objc
    func navigationBarRightButtonImage() -> UIImage? {
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
     * MARK: Enable/Disable Gesture
     */
    
    @objc
    func isEnableNavigationGesture() -> Bool {
        return true
    }
}
