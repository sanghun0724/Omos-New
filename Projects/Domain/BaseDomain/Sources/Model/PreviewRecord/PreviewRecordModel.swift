//
//  PreviewRecordModel.swift
//  BaseDomain
//
//  Created by 이상헌 on 2023/09/05.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

// MARK: - PreviewRecordModel

public struct PreviewRecordModel {
    let uuid: String
    let meta: Int 
}

// MARK: - Equatable

extension PreviewRecordModel: Equatable {
    public static func == (lhs: PreviewRecordModel, rhs: PreviewRecordModel) -> Bool {
      return lhs.uuid == rhs.uuid
    }
}
