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

import DesignSystem
import AppFoundation

// MARK: - EmailSignUpViewController

final class EmailSignUpViewController:
    BaseViewController,
    EmailSignUpPresentable,
    EmailSignUpViewControllable,
    CloseButtonBindable,
    ErrorStreamBindable,
    LoadingStreamBindable
{
    
    // MARK: - Constants
    
    private enum UI {
        static let emailValidationButtonHeight = 20
        static let emailValidationButtonWidth = 100
        static let leadingTrailingMargin = 16
        static let alertWidth = 300
        static let confirmButtonHeight = 48
    }
    
    // MARK: - Properties
    
    weak var listener: EmailSignUpPresentableListener?
    
    private let actionRelay = PublishRelay<EmailSignUpPresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var headerTitleLabel = UILabel().builder
        .text(.signUp)
        .textColor(.white)
        .font(.boldSystemFont(ofSize: 24))
        .build()
    
    private lazy var emailTextFieldView = EmailTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: .email)
            $0.fetchLeftBottomLabelText(text: .emailFormatWarning)
            $0.rightButton.setTitle("인증요청", for: .normal)
        }
        .build()
    
    private lazy var validationCodeConfirmTextFieldView = EmailTextFieldView()
        .builder
        .with {
            $0.textField.fetchPlaceHolderText(text: "인증코드를 입력해주세요.")
            $0.fetchLeftTopLabelText(text: "인증코드")
            $0.fetchLeftBottomLabelText(text: .emailFormatWarning)
            $0.rightButton.setTitle("확인", for: .normal)
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
        bind(listener: self.listener)
    }
    
    // MARK: - Override
    
    override func isNeedCustomNavigationBarView() -> Bool {
        true
    }
    
    override func navigationBarLeftButtonImage() -> UIImage? {
        DesignSystemAsset.Common.arrowLeft.image
    }
    
}

// MARK: - Bind listener

extension EmailSignUpViewController {
    private func bind(listener: EmailSignUpPresentableListener?) {
        guard let listener = listener else { return }
        self.bindActionRelay()
        bindActions()
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

extension EmailSignUpViewController {
    private func bindActions() {
        bindCloseButtonTapAction()
        bindEmailTextFieldDidChangedAction()
        bindEmailValidationRequestButtonTapAction()
        bindValidationCodeConfirmTextAction()
        bindValidationCodeConfirmButtonTapAction()
        bindConfirmButtonTapAction()
        bindDetachAction()
    }
    
    private func bindEmailTextFieldDidChangedAction() {
        emailTextFieldView.textField.rx
            .text
            .orEmpty
            .changed
            .map { .emailTextFieldDidChanged(email: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindEmailValidationRequestButtonTapAction() {
        emailTextFieldView.rightButton
            .rx
            .tapWithPreventDuplication()
            .withUnretained(self)
            .map { owner, _ in owner.emailTextFieldView.setRightButtonTitle(to: "재전송") }
            .withLatestFrom(self.emailTextFieldView.textField.rx.text.orEmpty)
            .map { .emailValidationRequestButtonDidTap(email: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
            
    }
    
    private func bindValidationCodeConfirmTextAction() {
        validationCodeConfirmTextFieldView.textField.rx
            .text
            .orEmpty
            .changed
            .map { .validationCodeTextFieldDidChanged(code: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindValidationCodeConfirmButtonTapAction() {
        validationCodeConfirmTextFieldView.rightButton
            .rx
            .tapWithPreventDuplication()
            .withLatestFrom(self.validationCodeConfirmTextFieldView.textField.rx.text.orEmpty)
            .map { .validationCodeConfirmButtonDidTap(inputCode: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindConfirmButtonTapAction() {
        confirmButton
            .rx
            .tapWithPreventDuplication()
            .map { .confirmButtonDidTap }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindDetachAction() {
        detachAction
            .map { .detach }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binding State

extension EmailSignUpViewController {
    private func bindState(from listener: EmailSignUpPresentableListener) {
        bindLoadingStream(from: listener)
        bindErrorStream(from: listener)
        bindValidationEmailState(from: listener)
        bindisSuccessSendValidationCodeState(from: listener)
        bindEmailRegisterValidation(from: listener)
        bindIsEnableConfirmValidation(from: listener)
        bindIsEmailTextFieldEmpty(from: listener)
    }
    
    private func bindIsEmailTextFieldEmpty(from listener: EmailSignUpPresentableListener) {
        listener.state
            .map(\.isEmailTextFieldEmpty)
            .map { !$0 }
            .distinctUntilChanged()
            .asDriver(onErrorDriveWith: .empty())
            .drive(self.emailTextFieldView.rightButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    private func bindValidationEmailState(from listener: EmailSignUpPresentableListener) {
        listener.state
            .map(\.isValidEmailFormat)
            .asDriver(onErrorDriveWith: .never())
            .drive(self.emailTextFieldView.rx.isValidState)
            .disposed(by: disposeBag)
    }
    
    private func bindisSuccessSendValidationCodeState(from listener: EmailSignUpPresentableListener) {
        listener.state
            .map(\.isShowValdiationConfirmTextField)
            .distinctUntilChanged()
            .map { !$0 }
            .asDriver(onErrorDriveWith: .empty())
            .drive(self.validationCodeConfirmTextFieldView.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
    private func bindEmailRegisterValidation(from listener: EmailSignUpPresentableListener) {
        listener.state
            .compactMap(\.isSuccessEmailCertification.value)
            .distinctUntilChanged()
            .skip(1)
            .filter { $0 }
            .asDriver(onErrorDriveWith: .empty())
            .drive(with: self) { owner, _ in
                owner.emailTextFieldView.isUserInteractionEnabled = false
                // todo
            }
            .disposed(by: disposeBag)
    }
    
    private func bindIsEnableConfirmValidation(from listener: EmailSignUpPresentableListener) {
        listener.state
            .compactMap(\.isSuccessEmailCertification.value)
            .distinctUntilChanged()
            .asDriver(onErrorDriveWith: .empty())
            .drive(self.confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout

extension EmailSignUpViewController {
    private func setupUI() {
        contentView.addSubview(headerTitleLabel)
        contentView.addSubview(emailTextFieldView)
        contentView.addSubview(validationCodeConfirmTextFieldView)
        contentView.addSubview(confirmButton)
        self.layout()
    }
    
    private func layout() {
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.left.equalToSuperview().offset(16)
        }
        emailTextFieldView.snp.makeConstraints {
            $0.top.equalTo(headerTitleLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        validationCodeConfirmTextFieldView.snp.makeConstraints {
            $0.top.equalTo(emailTextFieldView.snp.bottom).offset(44)
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

struct SignUpPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = EmailSignUpViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
