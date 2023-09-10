//
//  MyDJModel.swift
//  BaseDomain
//
//  Created by 이상헌 on 2023/09/05.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

public struct DJModel {
    public let meta: Int
    public let uuid: String
}

extension DJModel: Equatable {
    public static func == (lhs: DJModel, rhs: DJModel) -> Bool {
      return lhs.uuid == rhs.uuid
    }
}
