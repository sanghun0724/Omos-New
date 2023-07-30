//
//  MyRecordViewController.swift
//  MyRecordFeature
//
//  Created by 이상헌 on 2023/07/29.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

import DesignSystem

// MARK: - MyRecordViewController

final class MyRecordViewController:
    BaseViewController,
    MyRecordPresentable,
    MyRecordViewControllable,
    LoadingStreamBindable,
    ErrorStreamBindable,
    HasTableView
{
    
    // MARK: - Constants
    
    private enum UI {
        static let cellHeight: CGFloat = 128
    }
    
    // MARK: - Properties
    
    weak var listener: MyRecordPresentableListener?
    
    private let actionRelay = PublishRelay<MyRecordPresentableListener.Action>()
    
    // MARK: - UI Components
    
    var tableView = UITableView().builder
        .backgroundColor(.red)
        .rowHeight(UI.cellHeight)
        .build()
    
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

extension MyRecordViewController {}

// MARK: - Bind UI

extension MyRecordViewController {
    private func bindUI() {
        
    }
}

// MARK: - Bind listener

extension MyRecordViewController {
    private func bind(listener: MyRecordPresentableListener?) {
        guard let listener = listener else { return }
        self.bindActionRelay()
        bindActions()
        bindState(from: listener)
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

extension MyRecordViewController {
    private func bindActions() {
        
    }
}

// MARK: - Binding State

extension MyRecordViewController {
    private func bindState(from listener: MyRecordPresentableListener) {
        
    }
}

// MARK: - Layout

extension MyRecordViewController {
    private func setupUI() {
        contentView.addSubview(tableView)
        self.layout()
    }
    
    private func layout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MyRecordPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = MyRecordViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
