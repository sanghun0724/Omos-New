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
    open func isNeedCustomNavigationBarView() -> Bool {
        navigationController != nil
    }
    
    @objc
    open func navigationBarBottomBorderLineColor() -> UIColor {
        return .clear
    }
    
    @objc
    open func navigationBarBackgroundColor() -> UIColor {
        return DesignSystemAsset.Colors.mainBackground.color
    }
    
    // Texts
    
    @objc
    open func navigationBarLeftButtonText() -> String? {
        return nil
    }
    
    @objc
    open func navigationBarRightButtonText() -> String? {
        return nil
    }
    
    // Images
    
    @objc
    open func navigationBarLeftButtonImage() -> UIImage? {
        return nil
    }
    
    @objc
    open func navigationBarRightButtonImage() -> UIImage? {
        return nil
    }
    
    @objc
    open func navigationBarTitleText() -> String? {
        return nil
    }
    
    @objc
    open func navigationBarTitleImage() -> UIImage? {
        return nil
    }
    
    @objc
    open func navigationBarLeftBtnTextColor() -> UIColor {
        return .black
    }
    
    @objc
    open func navigationBarRightBtnColor() -> UIColor {
        return .black
    }
    
    @objc
    open func navigationBarTitleTextColor() -> UIColor {
        return .black
    }
    
    @objc
    open func navigationBarTitleTextFont() -> UIFont {
        return .systemFont(ofSize: 16, weight: .bold)
    }
    
    /*
     * MARK: Enable/Disable Gesture
     */
    
    @objc
    open func isEnableNavigationGesture() -> Bool {
        return true
    }
}
