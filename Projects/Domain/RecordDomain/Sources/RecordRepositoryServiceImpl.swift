//
//  RecordRepositoryService.swift
//  RecordDomain
//
//  Created by 이상헌 on 2023/06/24.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

import RxRelay
import RxSwift

import AppFoundation
import CoreKit
import RecordDomainInterface

public class RecordRepositoryServiceImpl {
    private let recordRepositoryService: RecordRepositoryService
    
    public init(recordRepositoryService: RecordRepositoryService) {
        self.recordRepositoryService = recordRepositoryService
    }
}

