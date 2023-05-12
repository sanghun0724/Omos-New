//
//  LoggedInViewController.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs
import UIKit

protocol LoggedInPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedInViewController:
    BaseViewController,
    LoggedInPresentable,
    LoggedInViewControllable
{

    weak var listener: LoggedInPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = .blue
    
        title = "테스트입니다"
//        addNavigationViewIfNeeded(to: self.view)
//        makeNavigationViewConstraintsIfNeeded()
    }
    
    @objc
    private func didTapClose() {
        print("DidTapClose")
    }
}
