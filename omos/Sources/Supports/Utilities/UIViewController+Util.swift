//
//  UIViewController+Util.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import UIKit

public extension UIViewController {
    
    func setupNavigationItem(with buttonType: DissmissButtonType ,target: Any? ,action: Selector?) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: buttonType.iconSystemName,
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)),
            style: .plain,
            target: target,
            action: action
        )
    }
}
