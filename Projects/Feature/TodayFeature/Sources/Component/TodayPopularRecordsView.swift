//
//  TodayPopularRecordsView.swift
//  TodayFeature
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import RxDataSources

import DesignSystem

/// 수많은 DJ가 선택한 섹션
final class TodayPopularRecordsView: BaseView {
    
    // MARK: - Constants
    
    enum UI {
        
    }
    
    //typealias popularRecordsDataSource = RxCollectionViewSectionedReloadDataSource<>
    
    // MARK: - UI Components
    
    private lazy var titleLabel = UILabel()
    
    
    
    
    // MARK: - Initialization & Deinitialization
    
    override func initialize() {
        super.initialize()
        self.layout()
    }
    
    private func layout() {
        
    }
    
}
