//
//  AppComponent.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation

import CoreKit
import BaseDomain
import OnboardingDomain
import OnboardingDomainInterface
import TodayFeature
import TodayFeatureInterface
import RootTabBarFeature
import RootTabBarFeatureInterface
import RecordDomain
import RecordDomainInterface

// MARK: AppComponent

final class AppComponent: BootstrapComponent, AppRootDependency {
    
    var appRootBuilder: AppRootBuildable {
        AppRootBuilder {
            AppRootComponent(parent: self)
        }
    }
    
    var onboardingRepositoryService: OnboardingRepositoryService {
        shared {
            OnboardingRepositoryServiceImpl(
                onboardingRepository: onboardingRepository
            )
        }
    }
    
    var rootTabBarBuilder: RootTabBarBuildable {
        RootTabBarBuilder {
            RootTabBarComponent(parent: self)
        }
    }
    
    var imagePrefetchWorker: ImagePrefetchWorking {
        ImagePrefetchWorker()
    }
    
    var recordRepositoryService: RecordRepositoryService {
        RecordRepositoryServiceImpl(
            recordRepository: recordRepository,
            recordTranslator: recordTranslator
        )
    }
}

extension AppComponent {
    private var onboardingRepository: OnboardingRepository {
        OnboardingRepositoryImpl(networkingProvider: Networking())
    }
    
    private var recordRepository: RecordRepository {
        RecordRepositoryImpl(networkingProvider: Networking())
    }
    
    private var recordTranslator: RecordTranslator {
        RecordTranslatorImpl()
    }
}
