//
//  HasCloseButtonHeaderView.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/22.
//

import UIKit
import SnapKit

// TODO: 제거 검토 
protocol HasCustomNavigationBarView {
    var isNeedNavigationBarView: Bool { get }
    var navigationBarView: CustomNavigationBarView { get }
}

extension HasCustomNavigationBarView where Self: BaseViewController {
    var isNeedNavigationBarView: Bool {
        navigationController == nil
    }
    
    func addNavigationViewIfNeeded(to view: UIView) {
        guard self.isNeedNavigationBarView else { return }
        contentView.addSubview(navigationBarView)
    }
    
    func makeNavigationViewConstraintsIfNeeded() {
        guard self.isNeedNavigationBarView else { return }
        navigationBarView.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
