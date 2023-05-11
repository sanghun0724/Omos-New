//
//  HasCloseButtonHeaderView.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/22.
//

import UIKit
import SnapKit

protocol HasCloseButtonHeaderView {
    var needHeaderView: Bool { get }
    var headerView: CloseButtonHeaderView { get }
}

extension HasCloseButtonHeaderView where Self: UIViewController {
    var needHeaderView: Bool {
        navigationController == nil
    }
    
    func addHeaderViewIfNeeded(to view: UIView) {
        guard self.needHeaderView else { return }
        view.addSubview(headerView)
    }
    
    func makeHeaderViewConstraintsIfNeeded() {
        guard self.needHeaderView else { return }
        headerView.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
