//
//  MyRecordModel.swift
//  RecordDomainInterface
//
//  Created by 이상헌 on 2023/07/30.
//  Copyright © 2023 Omos. All rights reserved.
//

import CoreKit

// MARK: - MyRecordModel

public struct MyRecordModel {
    let recordType: RecordType
    let isPulbic: Bool
    let music: Music
    let content: String
    let id: Int
    let title: String
    
    public init(myRecordResponse: MyRecordResponse) {
        recordType = RecordType.init(rawValue: myRecordResponse.category) ?? .aLine // TODO: NEED TO Confirm
        isPulbic = myRecordResponse.isPublic
        music = myRecordResponse.music
        content = myRecordResponse.recordContents
        id = myRecordResponse.recordID
        title = myRecordResponse.recordTitle
    }
}

// MARK: - Equatable

extension MyRecordModel: Equatable {
    public static func == (lhs: MyRecordModel, rhs: MyRecordModel) -> Bool {
        lhs.id == rhs.id
    }
}
