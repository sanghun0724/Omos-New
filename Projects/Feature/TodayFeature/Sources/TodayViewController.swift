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
    
    private lazy var scrollView = UIScrollView().builder
        .showsHorizontalScrollIndicator(false)
        .showsVerticalScrollIndicator(false)
        .bounces(false)
        .build()
    
    private lazy var guideView = UIView()
    
    private lazy var todayHeaderView = TodayHeaderView().builder
        .backgroundColor(.orange)
        .build()
    
    private lazy var todayPopularRecordsView = TodayPopularRecordsView().builder
        .backgroundColor(.brown)
        .build()
    
    private lazy var recommendedDJView = RecommendedDJView().builder
        .backgroundColor(.red)
        .build()
    
    private lazy var lovedRecordView = LovedRecordView().builder
        .backgroundColor(.blue)
        .build()
    
    private lazy var stackView = UIStackView(
    arrangedSubviews: [
        todayHeaderView,
        todayPopularRecordsView,
        recommendedDJView,
        lovedRecordView
    ]).builder
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
    
    override func isNeedCustomNavigationBarView() -> Bool {
        false
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
        view.addSubview(scrollView)
        scrollView.addSubview(guideView)
        guideView.addSubview(stackView)
        self.layout()
    }
    
    private func layout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        guideView.snp.makeConstraints {
            $0.top.bottom.width.equalTo(view)
            $0.height.equalTo(view).priority(250)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
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
