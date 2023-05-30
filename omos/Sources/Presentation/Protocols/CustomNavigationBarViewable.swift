//
//  CustomNavigationViewable.swift
//  omos
//
//  Created by sangheon on 2023/05/29.
//

import UIKit

protocol CustomNavigationPresentable {
    func hideOriginNavigationBar()
    func navigationBarShowLeftButton() -> Bool
    func navigationBarShowTitle() -> Bool
    func navigationBarShowImage() -> Bool
    func navigationBarShowRightButton() -> Bool
}

extension CustomNavigationPresentable where Self: BaseViewController {
    
    // MARK: - Navigation
    
    func hideOriginNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func navigationBarShowLeftButton() -> Bool {
        let buttonImage = navigationBarLeftButtonImage()
        let buttonText = navigationBarLeftButtonText()
        let isShow = (buttonImage != nil) || (buttonText != nil)
        return isShow
    }
    
    func navigationBarShowTitle() -> Bool {
        return navigationBarTitleText() != nil
    }
    
    func navigationBarShowImage() -> Bool {
        return navigationBarTitleImage() != nil
    }
    
    func navigationBarShowRightButton() -> Bool {
        let buttonImage = navigationBarRightButtonImage()
        let buttonText = navigationBarRightButtonText()
        let isShow = (buttonImage != nil) || (buttonText != nil)
        return isShow
    }
}


