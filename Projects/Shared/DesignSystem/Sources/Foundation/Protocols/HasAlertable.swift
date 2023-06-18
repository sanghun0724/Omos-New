//
//  HasAlertable.swift
//  omos
//
//  Created by sangheon on 2023/05/27.
//

import UIKit

public protocol HasAlertable: AnyObject {
    func showAlert(title: String, message: String)
}

public extension HasAlertable where Self: UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
