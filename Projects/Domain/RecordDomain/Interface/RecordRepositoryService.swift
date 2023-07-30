// This is for Tuist

import RxSwift

import CoreKit

// MARK: - RecordRepositoryService

public protocol RecordRepositoryService: MyRecordRepositoryService {}

// MARK: - RecordRepositoryService

public protocol MyRecordRepositoryService {
    func requestMyRecords(userId: Int) -> Observable<MyRecordModel>
}
