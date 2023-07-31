//
//  MyRecordBuilder.swift
//  MyRecordFeature
//
//  Created by 이상헌 on 2023/07/29.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation
import RIBs

import BaseDomain
import RecordDomainInterface

// MARK: - MyRecordDependency

protocol MyRecordDependency: NeedleFoundation.Dependency {
    var imagePrefetchWorker: ImagePrefetchWorking { get }
    var recordRepositoryService: RecordRepositoryService { get }
}

// MARK: - MyRecordBuildDependency

struct MyRecordBuildDependency {
    let listener: MyRecordListener
}

// MARK: - MyRecordComponent

final class MyRecordComponent: NeedleFoundation.Component<MyRecordDependency> {
    fileprivate var initialState: MyRecordPresentableState {
        MyRecordPresentableState()
    }
}

// MARK: - MyRecordBuildable

protocol MyRecordBuildable: Buildable {
    func build(with dynamicBuildDependency: MyRecordBuildDependency) -> MyRecordRouting
}

// MARK: - MyRecordBuilder

final class MyRecordBuilder:
    ComponentizedBuilder<MyRecordComponent, MyRecordRouting, MyRecordBuildDependency, Void>,
    MyRecordBuildable
{

    override func build(
      with component: MyRecordComponent,
      _ payload: MyRecordBuildDependency
    ) -> MyRecordRouting {
        let viewController = MyRecordViewController()
        let interactor = MyRecordInteractor(
            presenter: viewController,
            initialState: component.initialState,
            imagePrefechWorker: component.imagePrefetchWorker,
            recordRepositoryService: component.recordRepositoryService
        )
        
        interactor.listener = payload.listener
        return MyRecordRouter(interactor: interactor, viewController: viewController)
    }
}
