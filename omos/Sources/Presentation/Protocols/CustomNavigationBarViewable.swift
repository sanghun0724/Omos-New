//
//  CustomNavigationViewable.swift
//  omos
//
//  Created by sangheon on 2023/05/29.
//

import UIKit

protocol CustomTopAppBarPresentable {
    func hideNavigationBar()
    func setupNavigationController()
    func topAppBarIsShow() -> Bool
    func topAppBarShowLeftBtn() -> Bool
    func topAppBarShowTitle() -> Bool
    func topAppBarShowImage() -> Bool
    func topAppBarShowRightBtn() -> Bool
}

extension CustomTopAppBarPresentable where Self: BaseViewController {
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupNavigationController() {
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        hideNavigationBar()
    }
    
    func topAppBarIsShow() -> Bool {
        return topAppBarShowLeftBtn() || topAppBarShowTitle() || topAppBarShowRightBtn()
    }
    
    func topAppBarShowLeftBtn() -> Bool {
        let btnImages = topAppBarLeftBtnImage()
        let btnText = topAppBarLeftBtnText()
        let isShow = (btnImages.0 != nil) || (btnImages.1 != nil) || (btnText != nil)
        return isShow
    }
    
    func topAppBarShowTitle() -> Bool {
        return topAppBarTitleText() != nil
    }
    
    func topAppBarShowImage() -> Bool {
        return topAppBarTitleImage() != nil
    }
    
    func topAppBarTitleText() {
        
    }
    
    func topAppBarLeftBtnImage() {
        
    }
    
    func topAppBarLeftBtnText() {
        
    }
    
    func topAppBarRightBtnImage() {
        
    }
    
    func topAppBarRightBtnText() {
        
    }
    
    func topAppBarShowRightBtn() -> Bool {
        let btnImages = topAppBarRightBtnImage()
        let btnText = topAppBarRightBtnText()
        let isShow = (btnImages.0 != nil) || (btnImages.1 != nil) || (btnText != nil)
        return isShow
    }
}


