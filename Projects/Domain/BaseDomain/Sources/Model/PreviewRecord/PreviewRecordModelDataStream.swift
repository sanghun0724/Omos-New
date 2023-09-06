//
//  PreviewRecordDataModel.swift
//  BaseDomain
//
//  Created by 이상헌 on 2023/09/05.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxRelay
import RxSwift

// MARK: - PreviewRecordModelData

public struct PreviewRecordModelData: Equatable {
    public let models: [PreviewRecordModel]
    public let modelByUUID: [String: PreviewRecordModel]
    
    init(models: [PreviewRecordModel] = [], modelByUUID: [String : PreviewRecordModel] = [:]) {
        self.models = models
        self.modelByUUID = modelByUUID
    }
}

// MARK: - PreviewRecordModelDataStream

protocol PreviewRecordModelDataStream {
    var previewRecordModels: Observable<[PreviewRecordModel]> { get }
    
    func previewRecordModel(byUUID uuid: String) -> PreviewRecordModel?
}

protocol MutablePreviewRecordModelDataStream: PreviewRecordModelDataStream {
    func updatePreviewRecordModels(with models: [PreviewRecordModel])
}

final class PreviewRecordModelDataStreamImpl: MutablePreviewRecordModelDataStream {
    
    // MARK: - Properties
    
    var previewRecordModels: Observable<[PreviewRecordModel]> { self.previewRecordModelDataRelay.asObservable().map(\.models) }
    private let previewRecordModelDataRelay = BehaviorRelay<PreviewRecordModelData>(value: PreviewRecordModelData())
    
    // MARK: - Internal methods
    
    func previewRecordModel(byUUID uuid: String) -> PreviewRecordModel? {
        return self.previewRecordModelDataRelay.value.modelByUUID[uuid]
    }
    
    func updatePreviewRecordModels(with models: [PreviewRecordModel]) {
        let previewModelByUUID = models.reduce(into: [String: PreviewRecordModel]()) { $0[$1.uuid] = $1 }
        let data = PreviewRecordModelData(models: models, modelByUUID: previewModelByUUID)
        self.previewRecordModelDataRelay.accept(data)
    }

}
