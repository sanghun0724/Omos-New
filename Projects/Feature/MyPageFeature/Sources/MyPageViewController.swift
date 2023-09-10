//
//  MyPageViewController.swift
//  MyPageFeature
//
//  Created by 이상헌 on 2023/07/31.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

import DesignSystem

// MARK: - MyPagePresentableListener

protocol MyPagePresentableListener: AnyObject {
    typealias Action = MyPagePresentableAction
    typealias State = MyPagePresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}

// MARK: - MyPageViewController

final class MyPageViewController:
    BaseViewController,
    MyPagePresentable,
    MyPageViewControllable
{
    
    // MARK: - Constants
    
    private enum UI {
        
    }
    
    // MARK: - Properties
    
    weak var listener: MyPagePresentableListener?
    
    private let actionRelay = PublishRelay<MyPagePresentableListener.Action>()
    
    // MARK: - UI Components
    
    // MARK: - Initialization & Deinitialization
    
    override init() {
        super.init()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
        bind(listener: self.listener)
    }
}


// MARK: Private methods

extension MyPageViewController {}

// MARK: - Bind UI

extension MyPageViewController {
    private func bindUI() {
        
    }
}

// MARK: - Bind listener

extension MyPageViewController {
    private func bind(listener: MyPagePresentableListener?) {
        guard let listener = listener else { return }
    }
    
    private func bindActionRelay() {
        self.actionRelay.asObservable()
          .bind(with: self) { onwer, action in
            onwer.listener?.sendAction(action)
          }
          .disposed(by: disposeBag)
    }
}

// MARK: - Binding Action

extension MyPageViewController {
    private func bindActions() {
        
    }
}

// MARK: - Binding State

extension MyPageViewController {
    private func bindState(from listener: MyPagePresentableListener) {
        
    }
}

// MARK: - Layout

extension MyPageViewController {
    private func setupUI() {
        
        self.layout()
    }
    
    private func layout() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MyPagePreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = MyPageViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
