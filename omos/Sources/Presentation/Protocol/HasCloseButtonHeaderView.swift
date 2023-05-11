//
//  HasCloseButtonHeaderView.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/22.
//

import UIKit
import SnapKit

//TODO: 네비게이션 추가 
protocol HasCustomNavigationBarView {
    var needHeaderView: Bool { get }
    var navigationBarView: UIView { get }
}

extension HasCustomNavigationBarView where Self: BaseViewController {
    var needHeaderView: Bool {
        navigationController == nil
    }
    
    func addHeaderViewIfNeeded(to view: UIView) {
        guard self.needHeaderView else { return }
        contentView.addSubview(navigationBarView)
    }
    
    func makeHeaderViewConstraintsIfNeeded() {
        guard self.needHeaderView else { return }
        navigationBarView.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
