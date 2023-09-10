//
//  MyPageStateAction.swift
//  MyPageFeature
//
//  Created by 이상헌 on 2023/07/31.
//  Copyright © 2023 Omos. All rights reserved.
//

import RIBs

// MARK: - MyPagePresentableState

struct MyPagePresentableState {
    
}

// MARK: - MyPagePresentableAction

enum MyPagePresentableAction {
    
}

// MARK: - MyPagePresentable

protocol MyPagePresentable: Presentable {
    var listener: MyPagePresentableListener? { get set }
}
