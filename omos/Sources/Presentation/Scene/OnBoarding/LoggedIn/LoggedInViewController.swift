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
    
    // MARK: UI Components
    
    private lazy var scrollView = UIScrollView()
    
    private lazy var scrollContentView = UIView()
    
    private lazy var headerView = OnBoardingHeaderView()
    
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
            $0.height.equalTo(173)
            $0.left.right.top.equalToSuperview()
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
