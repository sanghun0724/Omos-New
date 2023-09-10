//
//  RecordType.swift
//  RecordDomainInterface
//
//  Created by 이상헌 on 2023/07/30.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

public enum RecordType: String, CaseIterable {
    case aLine = "한 줄 쓰기"
    case ost = "OST"
    case story = "Story"
    case lyrics = "lyrics"
    case free = "free"
}
