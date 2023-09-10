// This is for Tuist

import RxSwift

import CoreKit

// MARK: - TodayRepositoryService

public protocol TodayRepositoryService {
    func loadData() -> Observable<Void>
}

