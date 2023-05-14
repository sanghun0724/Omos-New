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
        static let authSupportedViewHeight = 64
        static let leadingTrailingMargin = 16
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
    
    private lazy var authSupportedView = AuthSupportedView()
    
    private lazy var bottmButtonView = BottomButtonsView()
    
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
        view.backgroundColor = Asset.Colors.mainBackground.color
        contentView.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(headerView)
        scrollContentView.addSubview(emailTextFieldView)
        scrollContentView.addSubview(passwordTextFieldView)
        scrollContentView.addSubview(authSupportedView)
        scrollContentView.addSubview(bottmButtonView)
        
        self.layout()
    }
    
    private func layout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollContentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalTo(contentView)
        }
        headerView.snp.makeConstraints {
            $0.height.equalTo(UI.headerViewHeight)
            $0.leading.trailing.top.equalToSuperview()
        }
        emailTextFieldView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        passwordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(emailTextFieldView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        authSupportedView.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.height.equalTo(64)
        }
        bottmButtonView.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(authSupportedView.snp.bottom).offset(100)
                .priority(249)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.bottom.greaterThanOrEqualToSuperview().offset(-34)
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
