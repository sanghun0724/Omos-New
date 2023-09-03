//
//  TodayViewController.swift
//  omos
//
//  Created by sangheon on 2023/05/23.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

import OnboardingDomain
import DesignSystem
import TodayFeatureInterface

// MARK: - TodayViewController

final class TodayViewController:
    BaseViewController,
    TodayPresentable,
    TodayViewControllable
{
    
    // MARK: - Constants
    
    private enum UI {
        
    }
    
    // MARK: - Properties
    
    weak var listener: TodayPresentableListener?
    
    private let actionRelay = PublishRelay<TodayPresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var scrollView = UIScrollView()
    
    private lazy var guideView = UIView()
    
    private lazy var stackView = UIStackView().builder
        .axis(.vertical)
        .alignment(.fill)
        .distribution(.equalSpacing)
        .spacing(4)
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
        contentView.backgroundColor = .purple
    }
}


// MARK: Private methods

extension TodayViewController {}

// MARK: - Bind UI

extension TodayViewController {
    private func bindUI() {
        
    }
}

// MARK: - Bind listener

extension TodayViewController {
    private func bind(listener: TodayPresentableListener?) {
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

extension TodayViewController {
    private func bindActions() {
        
    }
}

// MARK: - Binding State

extension TodayViewController {
    private func bindState(from listener: TodayListener) {
        
    }
}

// MARK: - Layout

extension TodayViewController {
    private func setupUI() {
        
        self.layout()
    }
    
    private func layout() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct TodayPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = TodayViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
