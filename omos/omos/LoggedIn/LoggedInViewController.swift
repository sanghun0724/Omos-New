//
//  LoggedInViewController.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import ModernRIBs
import UIKit

protocol LoggedInPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedInViewController: UIViewController, LoggedInPresentable, LoggedInViewControllable {

    weak var listener: LoggedInPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        setupNavigationItem(with: .close, target: self, action: #selector(didTapClose))
        title = "테스트입니다"
    }
    
    @objc
    private func didTapClose() {
        print("DidTapClose")
    }
}
