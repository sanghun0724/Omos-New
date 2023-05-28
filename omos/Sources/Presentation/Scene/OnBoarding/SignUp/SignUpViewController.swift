//
//  SignUpViewController.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

// MARK: - SignUpPresentableAction

enum SignUpPresentableAction {
    
}

// MARK: - SignUpPresentableListener

protocol SignUpPresentableListener: AnyObject {
    typealias Action = SignUpPresentableAction
    typealias State = SignUpPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}

// MARK: - SignUpViewController

final class SignUpViewController:
    BaseViewController,
    SignUpPresentable,
    SignUpViewControllable
{
    
    // MARK: - Constants
    
    private enum UI {
        
    }
    
    // MARK: - Properties
    
    weak var listener: SignUpPresentableListener?
    
    private let actionRelay = PublishRelay<SignUpPresentableListener.Action>()
    
    // MARK: - UI Components
    
    // MARK: - Initialization & Deinitialization
    
    override init() {
        super.init()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
        bind(listener: self.listener)
    }
}


// MARK: Private methods

extension SignUpViewController {}

// MARK: - Bind UI

extension SignUpViewController {
    private func bindUI() {
        
    }
}

// MARK: - Bind listener

extension SignUpViewController {
    private func bind(listener: SignUpPresentableListener?) {
        guard let listener = listener else { return }
    }
    
    private func bindActionRelay() {
        self.actionRelay.asObservable()
          .bind(with: self) { onwer, action in
            onwer.listener?.sendAction(action)
          }
          .disposed(by: disposeBag)
    }
}

// MARK: - Binding Action

extension SignUpViewController {
    private func bindActions() {
        
    }
}

// MARK: - Binding State

extension SignUpViewController {
    private func bindState(from listener: SignUpListener) {
        
    }
}

// MARK: - Layout

extension SignUpViewController {
    private func setupUI() {
        
        self.layout()
    }
    
    private func layout() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SignUpPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = SignUpViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
