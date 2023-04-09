//
//  AppRootViewController.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import ModernRIBs
import UIKit

protocol AppRootPresentableListener: AnyObject {
    
}

final class AppRootViewController: UIViewController, AppRootPresentable, AppRootViewControllable {

    weak var listener: AppRootPresentableListener?
}
