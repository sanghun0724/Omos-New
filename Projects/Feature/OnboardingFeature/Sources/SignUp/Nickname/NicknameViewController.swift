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

import AppFoundation
import DesignSystem
import OnboardingFeatureInterface

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
        static let headerViewHeight = 173
        static let leadingTrailingMargin = 20
        static let separatedLineHeight = 1
        static let confirmButtonHeight = 48
        static let agreementHeight = 20
    }
    
    // MARK: - Properties
    
    weak var listener: NicknamePresentableListener?
    
    private let actionRelay = PublishRelay<NicknamePresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var headerTitleLabel = BaseLabel().builder
        .text("OMOS에서 사용할\n이름을 입력해주세요.")
        .textColor(.white)
        .font(.boldSystemFont(ofSize: 24))
        .numberOfLines(2)
        .build()
    
    private lazy var nicknameTextFieldView = CustomTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: .nickname)
            $0.fetchLeftBottomLabelText(text: "2~12자 이내로 입력해주세요." )
        }
        .build()
    
    private lazy var confirmButton = ConfirmButton(.next, disableText: .next).builder
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
        bindActions()
        bindActionRelay()
        bindState(from: listener)
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
        bindNicknameTextFieldDidChange()
        bindConfirmButton()
    }
    
    private func bindNicknameTextFieldDidChange() {
        nicknameTextFieldView.textField
            .rx
            .text
            .orEmpty
            .changed
            .map { .nicknameTextFieldDidChange(nickname: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindConfirmButton() {
        confirmButton
            .rx
            .tap
            .preventDuplication()
            .map { .confirmButtonDidTap }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Binding State

extension NicknameViewController {
    private func bindState(from listener: NicknamePresentableListener) {
        bindLoadingStream(from: listener)
        bindErrorStream(from: listener)
        bindisValidNicknameFormat(from: listener)
    }
    
    private func bindisValidNicknameFormat(from listener: NicknamePresentableListener) {
        listener.state.map(\.isValidNicknameFormat)
            .distinctUntilChanged()
            .bind(to: self.nicknameTextFieldView.rx.isValidState, self.confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }

}

// MARK: - Layout

extension NicknameViewController {
    private func setupUI() {
        contentView.addSubview(headerTitleLabel)
        contentView.addSubview(nicknameTextFieldView)
        contentView.addSubview(confirmButton)
        self.layout()
    }
    
    private func layout() {
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.left.equalToSuperview().offset(16)
        }
        nicknameTextFieldView.snp.makeConstraints {
            $0.top.equalTo(headerTitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        confirmButton.snp.makeConstraints {
            $0.height.equalTo(UI.confirmButtonHeight)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.bottom.equalToSuperview().offset(-34).priority(750)
        }
        
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
