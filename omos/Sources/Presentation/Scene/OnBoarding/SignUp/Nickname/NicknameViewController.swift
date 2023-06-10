//
//  NicknameViewController.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

// MARK: - NicknamePresentableAction

enum NicknamePresentableAction {
    case confirmButtonDidTap
    case detach
}

// MARK: - NicknamePresentableListener

protocol NicknamePresentableListener: AnyObject, HasLoadingStream, HasErrorStream {
    typealias Action = NicknamePresentableAction
    typealias State = NicknamePresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}

// MARK: - NicknameViewController

final class NicknameViewController:
    BaseViewController,
    NicknamePresentable,
    NicknameViewControllable,
    CloseButtonBindable,
    ErrorStreamBindable,
    LoadingStreamBindable
{
    
    // MARK: - Constants
    
    private enum UI {
        static let confirmButtonHeight = 48
    }
    
    // MARK: - Properties
    
    weak var listener: NicknamePresentableListener?
    
    private let actionRelay = PublishRelay<NicknamePresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var headerView = OnBoardingHeaderView().builder
        .with {
            $0.fetchTitle(text: Strings.Onboarding.signUp)
        }
        .build()
    
    private lazy var nicknameTextFieldView = CustomTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: Strings.Onboarding.email)
            $0.fetchRightTopLabelText(text: Strings.Onboarding.emailwarning)
        }
        .build()
    
    private lazy var termAgreementView = AgreementView()
    
    private lazy var policyAgreementView = AgreementView()
    
    private lazy var confirmButton = ConfirmButton(Strings.Common.next, disableText: Strings.Common.next).builder
        .set(\.layer.cornerRadius, to: CommonUI.loginCorner)
        .set(\.layer.masksToBounds, to: true)
        .build()
    
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

extension NicknameViewController {}

// MARK: - Bind UI

extension NicknameViewController {
    private func bindUI() {
        
    }
}

// MARK: - Bind listener

extension NicknameViewController {
    private func bind(listener: NicknamePresentableListener?) {
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

extension NicknameViewController {
    private func bindActions() {
        
    }
}

// MARK: - Binding State

extension NicknameViewController {
    private func bindState(from listener: NicknamePresentableListener) {
        
    }
}

// MARK: - Layout

extension NicknameViewController {
    private func setupUI() {
        
        self.layout()
    }
    
    private func layout() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct NicknamePreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = NicknameViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
