//
//  SignUpViewController.swift
//  omos
//
//  Created by sangheon on 2023/05/15.
//

import RIBs
import RxSwift
import UIKit

protocol SignUpPresentableListener: AnyObject {

}

final class SignUpViewController:
    BaseViewController,
    SignUpPresentable,
    SignUpViewControllable {
    
    // MARK: Constants
    
    private enum UI {
        static let headerViewHeight = 173
    }
    
    private lazy var headerView = OnBoardingHeaderView()
    
    private lazy var emailTextFieldView = CustomTextFieldView()
    
    weak var listener: SignUpPresentableListener?
    
    
}

// MARK: Layout

extension SignUpViewController {
    private func setupUI() {
        contentView.addSubview(headerView)
        contentView.addSubview(emailTextFieldView)
        
        self.layout()
    }
    
    private func layout() {
        headerView.snp.makeConstraints {
            $0.height.equalTo(UI.headerViewHeight)
            $0.left.right.top.equalToSuperview()
        }
    }
    
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SignUpViewControllerPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = SignUpViewController().builder
                    .build()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
