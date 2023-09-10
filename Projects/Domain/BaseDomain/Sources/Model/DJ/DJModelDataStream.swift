//
//  DJModelDataStream.swift
//  BaseDomain
//
//  Created by 이상헌 on 2023/09/05.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxRelay
import RxSwift

// MARK: - DJModelData

public struct DJModelData: Equatable {
    public let models: [DJModel]
    public let modelByUUID: [String: DJModel]
    
    public init(models: [DJModel] = [], modelByUUID: [String : DJModel] = [:]) {
        self.models = models
        self.modelByUUID = modelByUUID
    }
}

// MARK: -

public protocol DJModelDataStream {
    var djModels: Observable<[DJModel]> { get }
    
    func djModel(byUUID uuid: String) -> DJModel?
}

public protocol MutatableDJModelDataStream: DJModelDataStream {
    func updateDJModel(with DJModels: [DJModel])
}

public final class DJModelDataStreamImpl: MutatableDJModelDataStream {
    
    // MARK: - Properties
    
    public var djModels: Observable<[DJModel]> { self.djModelDataRelay.asObservable().map(\.models) }
    private let djModelDataRelay = BehaviorRelay<DJModelData>(value: DJModelData())
    
    
    // MARK: - Internal methods
    
    public func djModel(byUUID uuid: String) -> DJModel? {
        return self.djModelDataRelay.value.modelByUUID[uuid]
    }
    
    public func updateDJModel(with models: [DJModel]) {
        let djModelByUUID = models.reduce(into: [String: DJModel]()) { $0[$1.uuid] = $1 }
        let data = DJModelData(models: models, modelByUUID: djModelByUUID)
        self.djModelDataRelay.accept(data)
    }
}
