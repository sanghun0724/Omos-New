//
//  UINavigationControllerExtensions.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/15.
//

import UIKit

import RIBs

extension UINavigationController: ViewControllable {
    public var uiviewController: UIViewController { self }
    
    convenience init(root: ViewControllable) {
        self.init(rootViewController: root.uiviewController)
    }
}
