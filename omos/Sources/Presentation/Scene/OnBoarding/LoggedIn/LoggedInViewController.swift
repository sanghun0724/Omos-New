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
    // MARK: Constants
    
    private enum UI {
        static let headerViewHeight = 173
    }
    
    // MARK: UI Components
    
    private lazy var scrollView = UIScrollView()
    
    private lazy var scrollContentView = UIView()
    
    private lazy var headerView = OnBoardingHeaderView()
    
    private lazy var emailTextFieldView = CustomTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: "@@@")
            $0.fetchRightTopLabelText(text: "@@@")
        }
        .build()
    
    private lazy var passwordTextFieldView = CustomTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: "@@@")
            $0.fetchRightTopLabelText(text: "@@@")
        }
        .build()
    
    private lazy var button1 = UIButton()
    private lazy var seperatedLine = UIView()
    private lazy var button2 = UIButton()
    private lazy var button3 = UIButton()
    
    weak var listener: LoggedInPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: Override
    
    override func isNeedCustomNavigationBarView() -> Bool {
        false
    }
}

// MARK: Layout

extension LoggedInViewController {
    private func setupUI() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        contentView.addSubview(headerView)
        contentView.addSubview(emailTextFieldView)
        contentView.addSubview(passwordTextFieldView)
        
        self.layout()
    }
    
    private func layout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        headerView.snp.makeConstraints {
            $0.height.equalTo(UI.headerViewHeight)
            $0.left.right.top.equalToSuperview()
        }
        emailTextFieldView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.left.right.equalToSuperview().inset(16)
        }
        passwordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(emailTextFieldView.snp.bottom)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LoggedInViewControllerPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = LoggedInViewController().builder
                    .build()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
